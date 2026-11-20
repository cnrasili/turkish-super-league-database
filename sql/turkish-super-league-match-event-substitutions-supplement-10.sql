-- TFF supplies official substitution minutes; Transfermarkt confirms same-minute pairings.
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @SubstitutionInput TABLE (
    minute INT NOT NULL,
    incoming_player_name NVARCHAR(120) NOT NULL,
    incoming_role NVARCHAR(30) NOT NULL,
    outgoing_player_name NVARCHAR(120) NOT NULL,
    outgoing_role NVARCHAR(30) NOT NULL,
    is_injury BIT NOT NULL,
    PRIMARY KEY (minute, incoming_player_name)
);

INSERT INTO @SubstitutionInput (
    minute,
    incoming_player_name,
    incoming_role,
    outgoing_player_name,
    outgoing_role,
    is_injury
)
VALUES
    (57, N'MUSTAFA ERHAN HEKİMOĞLU', N'substituted_in_away', N'DEVRİM ŞAHİN', N'substituted_out_away', 0),
    (57, N'SALİH UÇAN', N'substituted_in_away', N'RAFAEL ALEXANDRE FERNANDES FERREIRA DA SILVA', N'substituted_out_away', 0),
    (79, N'MELİH BOSTAN', N'substituted_in_home', N'PEDRO HENRIQUE OLIVEIRA DOS SANTOS', N'substituted_out_home', 0),
    (79, N'MARIUS STEFANESCU', N'substituted_in_home', N'JINHO JO', N'substituted_out_home', 0),
    (92, N'KAAN AKYAZI', N'substituted_in_home', N'JACKSON KYANVUBU MULEKA', N'substituted_out_home', 0),
    (92, N'MÜCAHİT İBRAHİMOĞLU', N'substituted_in_home', N'RIECHEDLY GUILLERMO BAZOER', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 6
    THROW 51361, 'Expected six report-confirmed substitutions.', 1;

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
    AND match_row.week = 3
    AND home_club.name = N'Tümosan Konyaspor'
    AND away_club.name = N'Beşiktaş A.Ş.';

IF @MatchCount <> 1
    THROW 51362, 'The TFF source fixture must resolve to one database match.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    LEFT JOIN dbo.person AS incoming_person ON incoming_person.name = input.incoming_player_name
    LEFT JOIN dbo.player AS incoming_player ON incoming_player.person_id = incoming_person.person_id
    LEFT JOIN dbo.appearance AS incoming_appearance
        ON incoming_appearance.match_id = @MatchId
        AND incoming_appearance.player_id = incoming_player.person_id
    LEFT JOIN dbo.person AS outgoing_person ON outgoing_person.name = input.outgoing_player_name
    LEFT JOIN dbo.player AS outgoing_player ON outgoing_player.person_id = outgoing_person.person_id
    LEFT JOIN dbo.appearance AS outgoing_appearance
        ON outgoing_appearance.match_id = @MatchId
        AND outgoing_appearance.player_id = outgoing_player.person_id
    WHERE incoming_appearance.player_id IS NULL OR outgoing_appearance.player_id IS NULL
)
    THROW 51363, 'Each substitution participant must have an appearance in the fixture.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN dbo.person AS incoming_person ON incoming_person.name = input.incoming_player_name
    INNER JOIN dbo.player AS incoming_player ON incoming_player.person_id = incoming_person.person_id
    INNER JOIN dbo.person AS outgoing_person ON outgoing_person.name = input.outgoing_player_name
    INNER JOIN dbo.player AS outgoing_player ON outgoing_player.person_id = outgoing_person.person_id
    INNER JOIN dbo.event_player AS incoming_event_player
        ON incoming_event_player.match_id = @MatchId
        AND incoming_event_player.player_id = incoming_player.person_id
        AND incoming_event_player.[role] = input.incoming_role
    INNER JOIN dbo.event_player AS outgoing_event_player
        ON outgoing_event_player.match_id = incoming_event_player.match_id
        AND outgoing_event_player.event_no = incoming_event_player.event_no
        AND outgoing_event_player.player_id = outgoing_player.person_id
        AND outgoing_event_player.[role] = input.outgoing_role
    INNER JOIN dbo.substitution AS existing_substitution
        ON existing_substitution.match_id = incoming_event_player.match_id
        AND existing_substitution.event_no = incoming_event_player.event_no
)
    THROW 51364, 'A source-confirmed substitution already exists.', 1;

DECLARE @EventMap TABLE (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    minute INT NOT NULL,
    incoming_player_id INT NOT NULL,
    incoming_role NVARCHAR(30) NOT NULL,
    outgoing_player_id INT NOT NULL,
    outgoing_role NVARCHAR(30) NOT NULL,
    is_injury BIT NOT NULL,
    PRIMARY KEY (match_id, event_no)
);

;WITH NumberedSubstitutions AS (
    SELECT
        @MatchId AS match_id,
        input.minute,
        incoming_player.person_id AS incoming_player_id,
        input.incoming_role,
        outgoing_player.person_id AS outgoing_player_id,
        input.outgoing_role,
        input.is_injury,
        COALESCE((
            SELECT MAX(existing_event.event_no)
            FROM dbo.match_event AS existing_event
            WHERE existing_event.match_id = @MatchId
        ), 0) + ROW_NUMBER() OVER (
            ORDER BY input.minute, input.incoming_player_name
        ) AS event_no
    FROM @SubstitutionInput AS input
    INNER JOIN dbo.person AS incoming_person
        ON incoming_person.name = input.incoming_player_name
    INNER JOIN dbo.player AS incoming_player
        ON incoming_player.person_id = incoming_person.person_id
    INNER JOIN dbo.person AS outgoing_person
        ON outgoing_person.name = input.outgoing_player_name
    INNER JOIN dbo.player AS outgoing_player
        ON outgoing_player.person_id = outgoing_person.person_id
)
INSERT INTO @EventMap (
    match_id,
    event_no,
    minute,
    incoming_player_id,
    incoming_role,
    outgoing_player_id,
    outgoing_role,
    is_injury
)
SELECT
    match_id,
    event_no,
    minute,
    incoming_player_id,
    incoming_role,
    outgoing_player_id,
    outgoing_role,
    is_injury
FROM NumberedSubstitutions;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT match_id, event_no, minute FROM @EventMap;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT match_id, event_no, incoming_player_id, incoming_role FROM @EventMap
    UNION ALL
    SELECT match_id, event_no, outgoing_player_id, outgoing_role FROM @EventMap;

    INSERT INTO dbo.substitution (match_id, event_no, is_injury)
    SELECT match_id, event_no, is_injury FROM @EventMap;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- Sources: TFF 283573 https://www.tff.org/Default.aspx?macId=283573&pageID=29; Transfermarkt https://www.transfermarkt.com.tr/konyaspor-besiktas-jk/index/spielbericht/4646358
SELECT COUNT(*) AS sourced_substitution_events FROM @EventMap;
