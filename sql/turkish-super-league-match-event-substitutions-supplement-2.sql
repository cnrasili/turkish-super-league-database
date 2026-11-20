-- eScored and Live-Result confirm ten same-minute substitutions for Alanyaspor-Samsunspor.
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
    (46, N'MESCHACK ELIA LINA', N'substituted_in_home', N'İBRAHİM KAYA', N'substituted_out_home', 0),
    (46, N'BARAN MOĞULTAY', N'substituted_in_home', N'ÜMİT AKDAĞ', N'substituted_out_home', 0),
    (57, N'LUBOMİR SATKA', N'substituted_in_away', N'YUNUS EMRE ÇİFT', N'substituted_out_away', 0),
    (57, N'RİCK VAN DRONGELEN', N'substituted_in_away', N'ALI BADRA DIABATE', N'substituted_out_away', 0),
    (68, N'GÜVEN YALÇIN', N'substituted_in_home', N'STEVE MICHEL KEVİN MOUNIE', N'substituted_out_home', 0),
    (68, N'İZZET ÇELİK', N'substituted_in_home', N'FATİH AKSOY', N'substituted_out_home', 0),
    (87, N'GAİUS ABRAHAM JERED MAKOUTA', N'substituted_in_home', N'ANTONIO SIMAO MUANZA', N'substituted_out_home', 0),
    (87, N'ENES KESKİN', N'substituted_in_home', N'UI JO HWANG', N'substituted_out_home', 0),
    (90, N'TANGUY BEMIN COULIBALY', N'substituted_in_away', N'ELAYİS TAVSAN', N'substituted_out_away', 0),
    (90, N'ENES ALBAK', N'substituted_in_away', N'JOSAFAT WOODING MENDES', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 10
    THROW 51328, 'Expected ten report-confirmed substitutions.', 1;

DECLARE @MatchId INT;

SELECT @MatchId = match_row.match_id
FROM dbo.season AS season
INNER JOIN dbo.[match] AS match_row
    ON match_row.season_id = season.season_id
INNER JOIN dbo.club AS home_club
    ON home_club.club_id = match_row.home_club_id
INNER JOIN dbo.club AS away_club
    ON away_club.club_id = match_row.away_club_id
WHERE season.name = N'2025-2026'
    AND match_row.week = 31
    AND home_club.name = N'Corendon Alanyaspor'
    AND away_club.name = N'Samsunspor A.Ş.';

IF @MatchId IS NULL
    THROW 51329, 'The TFF source fixture must resolve to one database match.', 1;

IF EXISTS (
    SELECT 1
    FROM dbo.season AS season
    INNER JOIN dbo.[match] AS match_row ON match_row.season_id = season.season_id
    INNER JOIN dbo.club AS home_club ON home_club.club_id = match_row.home_club_id
    INNER JOIN dbo.club AS away_club ON away_club.club_id = match_row.away_club_id
    WHERE season.name = N'2025-2026'
        AND match_row.week = 31
        AND home_club.name = N'Corendon Alanyaspor'
        AND away_club.name = N'Samsunspor A.Ş.'
        AND match_row.match_id <> @MatchId
)
    THROW 51330, 'The TFF source fixture resolved to multiple database matches.', 1;

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
    THROW 51331, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 51332, 'A source-confirmed substitution already exists.', 1;

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

-- Sources: TFF match sheet https://www.tff.org/Default.aspx?macId=283827&pageID=29; eScored https://escored.com/match/alanyaspor-samsunspor-2026-04-27/; Live-Result https://www.live-result.com/football/matches/match1737476_Alanyaspor-Samsunspor-online
SELECT COUNT(*) AS sourced_substitution_events FROM @EventMap;
