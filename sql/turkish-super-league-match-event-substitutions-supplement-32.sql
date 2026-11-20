-- TFF provides official minutes; Transfermarkt match reports confirm pairings and documented causes.
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
    (283606, 6, N'Gençlerbirliği', N'İkas Eyüpspor'),
    (283614, 7, N'Fenerbahçe A.Ş.', N'Hesap.com Antalyaspor');

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
    (283606, 46, N'DENIS MIHAI DRAGUS', N'substituted_in_away', N'HALİL AKBUNAR', N'substituted_out_away', 0),
    (283606, 46, N'THIAM MAME BABA', N'substituted_in_away', N'UMUT DİLAN BOZOK', N'substituted_out_away', 0),
    (283606, 60, N'AYOTOMIWA SHERIF DELE BASHIRU', N'substituted_in_home', N'DAL VARESANOVIC', N'substituted_out_home', 0),
    (283606, 60, N'ZAN ZUZEK', N'substituted_in_home', N'OĞULCAN ÜLGÜN', N'substituted_out_home', 0),
    (283606, 71, N'EMRE AKBABA', N'substituted_in_away', N'YALÇIN KAYAN', N'substituted_out_away', 0),
    (283606, 71, N'PRINCE OBENG AMPEM', N'substituted_in_away', N'SERDAR GÜRLER', N'substituted_out_away', 0),
    (283606, 80, N'SAMED ONUR', N'substituted_in_home', N'FRANCO DARYL TONGYA HEUBANG', N'substituted_out_home', 0),
    (283606, 80, N'METEHAN MİMAROĞLU', N'substituted_in_home', N'SEKOU KOITA', N'substituted_out_home', 0),
    (283614, 67, N'JESPER ISMAILA CEESAY', N'substituted_in_away', N'SONER DİKMEN', N'substituted_out_away', 0),
    (283614, 67, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_away', N'HASAN YAKUB İLÇİN', N'substituted_out_away', 0),
    (283614, 77, N'İRFAN CAN KAHVECİ', N'substituted_in_home', N'MUHAMMED KEREM AKTÜRKOĞLU', N'substituted_out_home', 0),
    (283614, 77, N'CENK TOSUN', N'substituted_in_home', N'YOUSSEF EN NESYRI', N'substituted_out_home', 0),
    (283614, 80, N'DOĞUKAN SİNİK', N'substituted_in_away', N'NIKOLA STORM', N'substituted_out_away', 0),
    (283614, 80, N'SAMET KARAKOÇ', N'substituted_in_away', N'BÜNYAMİN BALCI', N'substituted_out_away', 0),
    (283614, 87, N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_in_home', N'İSMAİL YÜKSEK', N'substituted_out_home', 0),
    (283614, 87, N'SEBASTIAN SZYMANSKI', N'substituted_in_home', N'ANDERSON SOUZA CONCEIÇAO', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 16
    THROW 514301, 'Expected 16 report-confirmed substitutions.', 1;

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

IF (SELECT COUNT(*) FROM @MatchMap) <> 2
    THROW 514302, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514303, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514304, 'A source-confirmed substitution already exists.', 1;

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

-- Sources: TFF 283606 https://www.tff.org/Default.aspx?macId=283606&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4646442
-- Sources: TFF 283614 https://www.tff.org/Default.aspx?macId=283614&pageID=29; Transfermarkt https://www.transfermarkt.co.uk/fenerbahce-sk_antalyaspor/index/spielbericht/4646734
SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
