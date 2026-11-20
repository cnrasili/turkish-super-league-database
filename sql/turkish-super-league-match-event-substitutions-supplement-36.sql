-- TFF provides official minutes; match reports confirm pairings and documented causes.
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
    (283700, 17, N'Beşiktaş A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283701, 17, N'Corendon Alanyaspor', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283709, 18, N'Kocaelispor', N'Trabzonspor A.Ş.'),
    (283710, 18, N'Gençlerbirliği', N'Samsunspor A.Ş.');

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
    (283700, 78, N'TAYLAN ANTALYALI', N'substituted_in_away', N'IOANNIS PAPANIKOLAOU', N'substituted_out_away', 0),
    (283700, 78, N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_in_away', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_away', 0),
    (283700, 78, N'TAHA ŞAHİN', N'substituted_in_away', N'MİTHAT PALA', N'substituted_out_away', 0),
    (283700, 85, N'SALİH UÇAN', N'substituted_in_home', N'KARTAL KAYRA YILMAZ', N'substituted_out_home', 0),
    (283700, 85, N'EMİRHAN TOPÇU', N'substituted_in_home', N'GABRIEL ARMANDO DE ABREU', N'substituted_out_home', 0),
    (283701, 68, N'IANIS HAGI', N'substituted_in_home', N'GÜVEN YALÇIN', N'substituted_out_home', 0),
    (283701, 68, N'UCHENNA OGUNDU', N'substituted_in_home', N'EFECAN KARACA', N'substituted_out_home', 0),
    (283701, 87, N'ANDRE ANTHONY GRAY', N'substituted_in_away', N'DATRO DAVID FOFANA', N'substituted_out_away', 0),
    (283701, 87, N'BURHAN ERSOY', N'substituted_in_away', N'RICARDO DE SOUSA ESGAIO', N'substituted_out_away', 0),
    (283709, 46, N'GÖKHAN DEĞİRMENCİ', N'substituted_in_home', N'ALEKSANDAR JOVANOVIC', N'substituted_out_home', 1),
    (283709, 46, N'MANUEL LUIS DA SILVA CAFUMANA', N'substituted_in_home', N'DARKO CHURLINOV', N'substituted_out_home', 0),
    (283709, 86, N'CİHAN ÇANAK', N'substituted_in_away', N'MUSTAFA ESKİHELLAÇ', N'substituted_out_away', 0),
    (283709, 86, N'ANTHONY NNADUZOR NWAKAEME', N'substituted_in_away', N'CHRIST RAVYNEL INAO OULAI', N'substituted_out_away', 0),
    (283710, 65, N'JULES OLIVIER NTCHAM', N'substituted_in_away', N'YALÇIN KAYAN', N'substituted_out_away', 0),
    (283710, 65, N'ELAYİS TAVSAN', N'substituted_in_away', N'TAHSİN BÜLBÜL', N'substituted_out_away', 0),
    (283710, 83, N'SAMED ONUR', N'substituted_in_home', N'OĞULCAN ÜLGÜN', N'substituted_out_home', 0),
    (283710, 83, N'ABDURRAHİM DURSUN', N'substituted_in_home', N'SEKOU KOITA', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 17
    THROW 514351, 'Expected 17 report-confirmed substitutions.', 1;

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

IF (SELECT COUNT(*) FROM @MatchMap) <> 4
    THROW 514352, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514353, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514354, 'A source-confirmed substitution already exists.', 1;

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

-- Sources: TFF 283700 https://www.tff.org/Default.aspx?macId=283700&pageID=29; Transfermarkt https://www.transfermarkt.ch/spielbericht/index/spielbericht/4647914 for pairings and documented injury causes
-- Sources: TFF 283701 https://www.tff.org/Default.aspx?macId=283701&pageID=29; Transfermarkt https://www.transfermarkt.com/alanyaspor_fatih-karagumruk/index/spielbericht/4647915 for pairings
-- Sources: TFF 283709 https://www.tff.org/Default.aspx?macId=283709&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647923 for pairings and documented injury causes
-- Sources: TFF 283710 https://www.tff.org/Default.aspx?macId=283710&pageID=29; beIN SPORTS https://beinsports.com.tr/haber/genclerbirligi-samsunspor for pairings
SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
