-- Seed appearances and match events for the first 2025-2026 fixture.
-- Sources: TFF match sheet and supplementary event reports.
-- TFF: https://www.tff.org/Default.aspx?macId=283554&pageID=29
-- Pairings and substitution causes: https://www.transfermarkt.com.tr/eyupspor_konyaspor/index/spielbericht/4646338
-- Same-minute substitution timeline: https://macpesinde.com/mac/super-lig/sezon-25-26/hafta-1/2025-08-10/eyupspor-vs-konyaspor/mac-gunu
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @PlayerInput TABLE (
    player_name NVARCHAR(120) NOT NULL PRIMARY KEY,
    is_starter BIT NOT NULL
);

INSERT INTO @PlayerInput (player_name, is_starter)
VALUES
    (N'BERKE ÖZER', 1),
    (N'LUCCAS CLARO DOS SANTOS', 1),
    (N'ROBIN YALÇIN', 1),
    (N'TALHA ÜLVAN', 1),
    (N'MELİH KABASAKAL', 1),
    (N'NIHAD MUJAKIC', 1),
    (N'DENIS MIHAI DRAGUS', 1),
    (N'KEREM DEMİRBAY', 1),
    (N'EMRE AKBABA', 1),
    (N'SERDAR GÜRLER', 1),
    (N'THIAM MAME BABA', 1),
    (N'METE KAAN DEMİR', 0),
    (N'UMUT DİLAN BOZOK', 0),
    (N'HALİL AKBUNAR', 0),
    (N'YALÇIN KAYAN', 0),
    (N'PRINCE OBENG AMPEM', 0),
    (N'BAHADIR HAN GÜNGÖRDÜ', 1),
    (N'ADİL DEMİRBAĞ', 1),
    (N'DANIJEL ALEKSIC', 1),
    (N'ENIS BARDHI', 1),
    (N'GUILHERME HAUBERT SITYA', 1),
    (N'MARKO JEVTOVIC', 1),
    (N'ALASSANE NDAO', 1),
    (N'RIECHEDLY GUILLERMO BAZOER', 1),
    (N'MEHMET UMUT NAYİR', 1),
    (N'YHOAN MANY ANDZOUANA', 1),
    (N'MELİH İBRAHİMOĞLU', 1),
    (N'MORTEN BJORLO', 0),
    (N'MUHAMMET TUNAHAN TAŞCI', 0),
    (N'UĞURCAN YAZĞILI', 0),
    (N'PEDRO HENRIQUE OLIVEIRA DOS SANTOS', 0);

DECLARE @EventInput TABLE (
    event_no INT NOT NULL PRIMARY KEY,
    minute INT NOT NULL,
    event_type NVARCHAR(20) NOT NULL,
    player_1_name NVARCHAR(120) NULL,
    player_1_role NVARCHAR(30) NULL,
    player_2_name NVARCHAR(120) NULL,
    player_2_role NVARCHAR(30) NULL,
    goal_type NVARCHAR(40) NULL,
    card_colour NVARCHAR(20) NULL,
    is_injury BIT NULL
);

INSERT INTO @EventInput (
    event_no,
    minute,
    event_type,
    player_1_name,
    player_1_role,
    player_2_name,
    player_2_role,
    goal_type,
    card_colour,
    is_injury
)
VALUES
    (1, 5, N'goal', N'MEHMET UMUT NAYİR', N'scorer_away', NULL, NULL, N'H', NULL, NULL),
    (2, 21, N'goal', N'MEHMET UMUT NAYİR', N'scorer_away', NULL, NULL, N'H', NULL, NULL),
    (3, 33, N'goal', N'ENIS BARDHI', N'scorer_away', NULL, NULL, N'P', NULL, NULL),
    (4, 46, N'substitution', N'UMUT DİLAN BOZOK', N'substituted_in_home', N'MELİH KABASAKAL', N'substituted_out_home', NULL, NULL, 0),
    (5, 46, N'substitution', N'HALİL AKBUNAR', N'substituted_in_home', N'TALHA ÜLVAN', N'substituted_out_home', NULL, NULL, 0),
    (6, 46, N'substitution', N'YALÇIN KAYAN', N'substituted_in_home', N'EMRE AKBABA', N'substituted_out_home', NULL, NULL, 0),
    (7, 48, N'card', N'YALÇIN KAYAN', N'carded_home', NULL, NULL, NULL, N'yellow', NULL),
    (8, 51, N'goal', N'HALİL AKBUNAR', N'scorer_home', NULL, NULL, N'F', NULL, NULL),
    (9, 70, N'substitution', N'MORTEN BJORLO', N'substituted_in_away', N'DANIJEL ALEKSIC', N'substituted_out_away', NULL, NULL, 0),
    (10, 70, N'substitution', N'UĞURCAN YAZĞILI', N'substituted_in_away', N'RIECHEDLY GUILLERMO BAZOER', N'substituted_out_away', NULL, NULL, 1),
    (11, 78, N'substitution', N'PRINCE OBENG AMPEM', N'substituted_in_home', N'SERDAR GÜRLER', N'substituted_out_home', NULL, NULL, 0),
    (12, 78, N'substitution', N'MUHAMMET TUNAHAN TAŞCI', N'substituted_in_away', N'ALASSANE NDAO', N'substituted_out_away', NULL, NULL, 0),
    (13, 79, N'goal', N'ADİL DEMİRBAĞ', N'scorer_away', NULL, NULL, N'H', NULL, NULL),
    (14, 88, N'substitution', N'PEDRO HENRIQUE OLIVEIRA DOS SANTOS', N'substituted_in_away', N'ENIS BARDHI', N'substituted_out_away', NULL, NULL, 0),
    (15, 89, N'card', N'KEREM DEMİRBAY', N'carded_home', NULL, NULL, NULL, N'yellow', NULL),
    (16, 92, N'card', N'BAHADIR HAN GÜNGÖRDÜ', N'carded_away', NULL, NULL, NULL, N'yellow', NULL),
    (17, 94, N'substitution', N'METE KAAN DEMİR', N'substituted_in_home', N'HALİL AKBUNAR', N'substituted_out_home', NULL, NULL, 1);

DECLARE @MatchId INT;
DECLARE @FixtureCount INT;
DECLARE @PlayerCount INT;
DECLARE @InputPlayerCount INT;

BEGIN TRY
    BEGIN TRANSACTION;

    SELECT
        @FixtureCount = COUNT(*),
        @MatchId = MIN(match_row.match_id)
    FROM dbo.[match] AS match_row
    INNER JOIN dbo.season AS season
        ON season.season_id = match_row.season_id
    INNER JOIN dbo.club AS home_club
        ON home_club.club_id = match_row.home_club_id
    INNER JOIN dbo.club AS away_club
        ON away_club.club_id = match_row.away_club_id
    WHERE season.name = N'2025-2026'
        AND match_row.week = 1
        AND home_club.name = N'İkas Eyüpspor'
        AND away_club.name = N'Tümosan Konyaspor';

    IF @FixtureCount <> 1
    BEGIN
        ;THROW 51100, 'The sample fixture must resolve to exactly one match row.', 1;
    END;

    IF EXISTS (
        SELECT 1
        FROM dbo.appearance
        WHERE match_id = @MatchId
    )
    OR EXISTS (
        SELECT 1
        FROM dbo.match_event
        WHERE match_id = @MatchId
    )
    BEGIN
        ;THROW 51101, 'The sample fixture already has appearance or event rows.', 1;
    END;

    SELECT @PlayerCount = COUNT(*)
    FROM @PlayerInput AS input
    INNER JOIN dbo.person AS person
        ON person.name = input.player_name
    INNER JOIN dbo.player AS player
        ON player.person_id = person.person_id;

    SELECT @InputPlayerCount = COUNT(*)
    FROM @PlayerInput;

    IF @PlayerCount <> @InputPlayerCount
    BEGIN
        ;THROW 51102, 'Every sample participant must resolve to one player profile.', 1;
    END;

    IF EXISTS (
        SELECT input.player_name
        FROM @PlayerInput AS input
        INNER JOIN dbo.person AS person
            ON person.name = input.player_name
        INNER JOIN dbo.player AS player
            ON player.person_id = person.person_id
        GROUP BY input.player_name
        HAVING COUNT(*) <> 1
    )
    BEGIN
        ;THROW 51103, 'A sample participant name resolves to multiple player profiles.', 1;
    END;

    INSERT INTO dbo.appearance (match_id, player_id, is_starter)
    SELECT
        @MatchId,
        player.person_id,
        input.is_starter
    FROM @PlayerInput AS input
    INNER JOIN dbo.person AS person
        ON person.name = input.player_name
    INNER JOIN dbo.player AS player
        ON player.person_id = person.person_id;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT @MatchId, event_no, minute
    FROM @EventInput;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT
        @MatchId,
        input.event_no,
        player.person_id,
        input.player_1_role
    FROM @EventInput AS input
    INNER JOIN dbo.person AS person
        ON person.name = input.player_1_name
    INNER JOIN dbo.player AS player
        ON player.person_id = person.person_id
    WHERE input.player_1_name IS NOT NULL;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT
        @MatchId,
        input.event_no,
        player.person_id,
        input.player_2_role
    FROM @EventInput AS input
    INNER JOIN dbo.person AS person
        ON person.name = input.player_2_name
    INNER JOIN dbo.player AS player
        ON player.person_id = person.person_id
    WHERE input.player_2_name IS NOT NULL;

    INSERT INTO dbo.goal (match_id, event_no, goal_type)
    SELECT @MatchId, event_no, goal_type
    FROM @EventInput
    WHERE event_type = N'goal';

    INSERT INTO dbo.card (match_id, event_no, colour)
    SELECT @MatchId, event_no, card_colour
    FROM @EventInput
    WHERE event_type = N'card';

    INSERT INTO dbo.substitution (match_id, event_no, is_injury)
    SELECT @MatchId, event_no, is_injury
    FROM @EventInput
    WHERE event_type = N'substitution';

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
    BEGIN
        ROLLBACK TRANSACTION;
    END;

    THROW;
END CATCH;
