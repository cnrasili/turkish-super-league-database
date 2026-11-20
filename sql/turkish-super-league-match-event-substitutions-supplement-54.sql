-- TFF provides official substitution participants and minutes; clubs and independent match reports confirm pairings.
-- TFF 283766: https://www.tff.org/Default.aspx?macId=283766&pageID=528
-- Gaziantep FK 283766: https://www.gaziantepfk.org/haberler/mac-sonucu-samsunspor-0-0-gaziantep
-- TFF 283802: https://www.tff.org/Default.aspx?macId=283802&pageID=528
-- Gençlerbirliği 283802: https://genclerbirligi.org.tr/haberler/natura-dunyasi-genclerbirligi-0-goztepe-2
-- TFF 283811: https://www.tff.org/Default.aspx?macId=283811&pageID=528
-- Gaziantep FK 283811: https://www.gaziantepfk.org/haberler/mac-sonucu-caykur-rizespor-2-1-gaziantep
-- TFF 283816: https://www.tff.org/Default.aspx?macId=283816&pageID=528
-- DHA 283816: https://www.dha.com.tr/yerel-haberler/antalya/hesap-com-antalyaspor-tumosan-konyaspor-0-2-2856963
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @MatchInput TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    week INT NOT NULL,
    home_club_name NVARCHAR(120) NOT NULL,
    away_club_name NVARCHAR(120) NOT NULL
);

INSERT INTO @MatchInput (source_match_id, week, home_club_name, away_club_name)
VALUES
    (283766, 24, N'Samsunspor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283802, 28, N'Gençlerbirliği', N'Göztepe A.Ş.'),
    (283811, 29, N'Çaykur Rizespor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283816, 30, N'Hesap.com Antalyaspor', N'Tümosan Konyaspor');

DECLARE @SubstitutionInput TABLE (
    source_match_id INT NOT NULL,
    minute INT NOT NULL,
    incoming_player_name NVARCHAR(120) NOT NULL,
    incoming_role NVARCHAR(30) NOT NULL,
    outgoing_player_name NVARCHAR(120) NOT NULL,
    outgoing_role NVARCHAR(30) NOT NULL,
    is_injury BIT NOT NULL,
    PRIMARY KEY (source_match_id, minute, incoming_player_name)
);

INSERT INTO @SubstitutionInput (
    source_match_id,
    minute,
    incoming_player_name,
    incoming_role,
    outgoing_player_name,
    outgoing_role,
    is_injury
)
VALUES
    (283766, 76, N'ANTOINE MAKOUMBOU', N'substituted_in_home', N'YALÇIN KAYAN', N'substituted_out_home', 0),
    (283766, 76, N'SONER GÖNÜL', N'substituted_in_home', N'LOGI TOMASSON', N'substituted_out_home', 0),
    (283766, 76, N'PAPE CHERIF NDIAYE', N'substituted_in_home', N'MARIUS MOUNDILMADJI', N'substituted_out_home', 0),
    (283766, 79, N'KARAMBA GASSAMA', N'substituted_in_away', N'KACPER SZYMON KOZLOWSKI', N'substituted_out_away', 0),
    (283766, 79, N'YUSUF KARHAN KABADAYI', N'substituted_in_away', N'MOHAMED LAMINE BAYO', N'substituted_out_away', 0),
    (283802, 73, N'METEHAN MİMAROĞLU', N'substituted_in_home', N'HENRY CHUKWUEMEKA ONYEKURU', N'substituted_out_home', 0),
    (283802, 73, N'GÖKTAN GÜRPÜZ', N'substituted_in_home', N'MBAYE HAMADY NIANG', N'substituted_out_home', 0),
    (283802, 73, N'ADAMA TRAORE', N'substituted_in_home', N'SEKOU KOITA', N'substituted_out_home', 0),
    (283802, 91, N'MUSAH MOHAMMED', N'substituted_in_away', N'ANTHONY JUNIOR DENNIS', N'substituted_out_away', 0),
    (283802, 91, N'EFKAN BEKİROĞLU', N'substituted_in_away', N'FILIP YAVOROV KRASTEV', N'substituted_out_away', 0),
    (283811, 78, N'ARDA KIZILDAĞ', N'substituted_in_away', N'LUIS JESUS PEREZ MAQUEDA', N'substituted_out_away', 0),
    (283811, 78, N'NIHAD MUJAKIC', N'substituted_in_away', N'CHRISTOPHER LUNGOYI', N'substituted_out_away', 0),
    (283811, 90, N'IOANNIS PAPANIKOLAOU', N'substituted_in_home', N'TAYLAN ANTALYALI', N'substituted_out_home', 0),
    (283811, 90, N'FRANTZDY PIERROT', N'substituted_in_home', N'ALI SOWE', N'substituted_out_home', 0),
    (283811, 90, N'MUHAMMET TAHA ŞAHİN', N'substituted_in_home', N'MIHAI-VALENTIN MIHAILA', N'substituted_out_home', 0),
    (283816, 64, N'BAHADIR ÖZTÜRK', N'substituted_in_home', N'LAUTARO DANIEL GIANNETTI', N'substituted_out_home', 0),
    (283816, 64, N'ABDÜLKADİR ÖMÜR', N'substituted_in_home', N'DARIO SARIC', N'substituted_out_home', 0),
    (283816, 64, N'NIKOLA STORM', N'substituted_in_home', N'DOĞUKAN SİNİK', N'substituted_out_home', 0),
    (283816, 71, N'MARKO JEVTOVIC', N'substituted_in_away', N'MORTEN BJORLO', N'substituted_out_away', 0),
    (283816, 71, N'ENIS BARDHI', N'substituted_in_away', N'KAZEEM ADEREMI J. OLAIGBE', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 20
    THROW 519001, 'Expected 20 source-confirmed substitutions.', 1;

DECLARE @MatchMap TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    match_id INT NOT NULL UNIQUE
);

INSERT INTO @MatchMap (source_match_id, match_id)
SELECT input.source_match_id, match_row.match_id
FROM @MatchInput AS input
INNER JOIN dbo.season AS season
    ON season.name = N'2025-2026'
INNER JOIN dbo.[match] AS match_row
    ON match_row.season_id = season.season_id
    AND match_row.week = input.week
INNER JOIN dbo.club AS home_club
    ON home_club.club_id = match_row.home_club_id
    AND home_club.name = input.home_club_name
INNER JOIN dbo.club AS away_club
    ON away_club.club_id = match_row.away_club_id
    AND away_club.name = input.away_club_name;

IF (SELECT COUNT(*) FROM @MatchMap) <> 1
    THROW 519002, 'Each TFF source fixture must resolve to one database match.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map
        ON match_map.source_match_id = input.source_match_id
    LEFT JOIN dbo.person AS incoming_person
        ON incoming_person.name = input.incoming_player_name
    LEFT JOIN dbo.player AS incoming_player
        ON incoming_player.person_id = incoming_person.person_id
    LEFT JOIN dbo.appearance AS incoming_appearance
        ON incoming_appearance.match_id = match_map.match_id
        AND incoming_appearance.player_id = incoming_player.person_id
    LEFT JOIN dbo.person AS outgoing_person
        ON outgoing_person.name = input.outgoing_player_name
    LEFT JOIN dbo.player AS outgoing_player
        ON outgoing_player.person_id = outgoing_person.person_id
    LEFT JOIN dbo.appearance AS outgoing_appearance
        ON outgoing_appearance.match_id = match_map.match_id
        AND outgoing_appearance.player_id = outgoing_player.person_id
    WHERE incoming_appearance.player_id IS NULL
        OR outgoing_appearance.player_id IS NULL
)
    THROW 519003, 'Each substitution participant must have an appearance in the fixture.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map
        ON match_map.source_match_id = input.source_match_id
    INNER JOIN dbo.person AS incoming_person
        ON incoming_person.name = input.incoming_player_name
    INNER JOIN dbo.player AS incoming_player
        ON incoming_player.person_id = incoming_person.person_id
    INNER JOIN dbo.person AS outgoing_person
        ON outgoing_person.name = input.outgoing_player_name
    INNER JOIN dbo.player AS outgoing_player
        ON outgoing_player.person_id = outgoing_person.person_id
    INNER JOIN dbo.event_player AS incoming_event_player
        ON incoming_event_player.match_id = match_map.match_id
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
    THROW 519004, 'A source-confirmed substitution already exists.', 1;

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

;WITH ResolvedSubstitutions AS (
    SELECT
        match_map.match_id,
        input.minute,
        incoming_player.person_id AS incoming_player_id,
        input.incoming_role,
        outgoing_player.person_id AS outgoing_player_id,
        input.outgoing_role,
        input.is_injury,
        COALESCE((
            SELECT MAX(existing_event.event_no)
            FROM dbo.match_event AS existing_event
            WHERE existing_event.match_id = match_map.match_id
        ), 0) + ROW_NUMBER() OVER (
            PARTITION BY match_map.match_id
            ORDER BY input.minute, input.incoming_player_name
        ) AS event_no
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map
        ON match_map.source_match_id = input.source_match_id
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
FROM ResolvedSubstitutions;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT match_id, event_no, minute
    FROM @EventMap;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT match_id, event_no, incoming_player_id, incoming_role
    FROM @EventMap
    UNION ALL
    SELECT match_id, event_no, outgoing_player_id, outgoing_role
    FROM @EventMap;

    INSERT INTO dbo.substitution (match_id, event_no, is_injury)
    SELECT match_id, event_no, is_injury
    FROM @EventMap;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;

SELECT COUNT(*) AS sourced_substitution_events FROM @EventMap;

