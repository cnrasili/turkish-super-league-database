-- TFF lists official substitution minutes; Sahadan confirms same-minute pairings.
-- TFF: https://www.tff.org/Default.aspx?macId=283721&pageID=528
-- Sahadan: https://www.sahadan.com/mac/fenerbahce-vs-goztepe/8zrj2jnpldzvzu1fhjqb9q978/anlatim
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @MatchId INT;
DECLARE @MatchCount INT;

SELECT
    @MatchId = MIN(match_row.match_id),
    @MatchCount = COUNT(*)
FROM dbo.season AS season
INNER JOIN dbo.[match] AS match_row
    ON match_row.season_id = season.season_id
INNER JOIN dbo.club AS home_club
    ON home_club.club_id = match_row.home_club_id
INNER JOIN dbo.club AS away_club
    ON away_club.club_id = match_row.away_club_id
WHERE season.name = N'2025-2026'
    AND match_row.week = 19
    AND home_club.name = N'Fenerbahçe A.Ş.'
    AND away_club.name = N'Göztepe A.Ş.';

IF @MatchCount <> 1
    THROW 514601, 'The TFF fixture must resolve to one database match.', 1;

DECLARE @SubstitutionInput TABLE (
    minute INT NOT NULL,
    incoming_player_name NVARCHAR(120) NOT NULL,
    outgoing_player_name NVARCHAR(120) NOT NULL,
    is_injury BIT NOT NULL,
    PRIMARY KEY (minute, incoming_player_name)
);

INSERT INTO @SubstitutionInput (
    minute,
    incoming_player_name,
    outgoing_player_name,
    is_injury
)
VALUES
    (61, N'JUAN SANTOS DA SILVA', N'GUILERME LUIZ OLIVEIRA DA SILVA', 0),
    (61, N'JEFERSON MARINHO DOS SANTOS', N'JANDERSON DE CARVALHO COSTA', 0),
    (81, N'UĞUR KAAN YILDIZ', N'ARDA OKAN KURTULAN', 0),
    (81, N'İSMAİL KÖYBAŞI', N'EFKAN BEKİROĞLU', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 4
    THROW 514602, 'Expected four report-confirmed substitutions.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    LEFT JOIN dbo.person AS incoming_person
        ON incoming_person.name = input.incoming_player_name
    LEFT JOIN dbo.player AS incoming_player
        ON incoming_player.person_id = incoming_person.person_id
    LEFT JOIN dbo.appearance AS incoming_appearance
        ON incoming_appearance.match_id = @MatchId
        AND incoming_appearance.player_id = incoming_player.person_id
    LEFT JOIN dbo.person AS outgoing_person
        ON outgoing_person.name = input.outgoing_player_name
    LEFT JOIN dbo.player AS outgoing_player
        ON outgoing_player.person_id = outgoing_person.person_id
    LEFT JOIN dbo.appearance AS outgoing_appearance
        ON outgoing_appearance.match_id = @MatchId
        AND outgoing_appearance.player_id = outgoing_player.person_id
    WHERE incoming_appearance.player_id IS NULL
        OR outgoing_appearance.player_id IS NULL
)
    THROW 514603, 'Each substitution participant must have an appearance in the fixture.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN dbo.match_event AS existing_event
        ON existing_event.match_id = @MatchId
        AND existing_event.minute = input.minute
    INNER JOIN dbo.event_player AS incoming_event_player
        ON incoming_event_player.match_id = existing_event.match_id
        AND incoming_event_player.event_no = existing_event.event_no
        AND incoming_event_player.[role] = N'substituted_in_away'
    INNER JOIN dbo.person AS incoming_person
        ON incoming_person.person_id = incoming_event_player.player_id
        AND incoming_person.name = input.incoming_player_name
    INNER JOIN dbo.event_player AS outgoing_event_player
        ON outgoing_event_player.match_id = existing_event.match_id
        AND outgoing_event_player.event_no = existing_event.event_no
        AND outgoing_event_player.[role] = N'substituted_out_away'
    INNER JOIN dbo.person AS outgoing_person
        ON outgoing_person.person_id = outgoing_event_player.player_id
        AND outgoing_person.name = input.outgoing_player_name
    INNER JOIN dbo.substitution AS existing_substitution
        ON existing_substitution.match_id = existing_event.match_id
        AND existing_substitution.event_no = existing_event.event_no
)
    THROW 514604, 'A source-confirmed substitution already exists.', 1;

DECLARE @EventMap TABLE (
    event_no INT NOT NULL PRIMARY KEY,
    minute INT NOT NULL,
    incoming_player_id INT NOT NULL,
    outgoing_player_id INT NOT NULL,
    is_injury BIT NOT NULL
);

INSERT INTO @EventMap (
    event_no,
    minute,
    incoming_player_id,
    outgoing_player_id,
    is_injury
)
SELECT
    COALESCE((
        SELECT MAX(existing_event.event_no)
        FROM dbo.match_event AS existing_event
        WHERE existing_event.match_id = @MatchId
    ), 0) + ROW_NUMBER() OVER (
        ORDER BY input.minute, input.incoming_player_name
    ),
    input.minute,
    incoming_player.person_id,
    outgoing_player.person_id,
    input.is_injury
FROM @SubstitutionInput AS input
INNER JOIN dbo.person AS incoming_person
    ON incoming_person.name = input.incoming_player_name
INNER JOIN dbo.player AS incoming_player
    ON incoming_player.person_id = incoming_person.person_id
INNER JOIN dbo.person AS outgoing_person
    ON outgoing_person.name = input.outgoing_player_name
INNER JOIN dbo.player AS outgoing_player
    ON outgoing_player.person_id = outgoing_person.person_id;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT @MatchId, event_no, minute
    FROM @EventMap;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT @MatchId, event_no, incoming_player_id, N'substituted_in_away'
    FROM @EventMap
    UNION ALL
    SELECT @MatchId, event_no, outgoing_player_id, N'substituted_out_away'
    FROM @EventMap;

    INSERT INTO dbo.substitution (match_id, event_no, is_injury)
    SELECT @MatchId, event_no, is_injury
    FROM @EventMap;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;

SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
