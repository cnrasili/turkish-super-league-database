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
    (283656, 12, N'Samsunspor A.Ş.', N'İkas Eyüpspor'),
    (283676, 14, N'Gaziantep Futbol Kulübü A.Ş.', N'İkas Eyüpspor'),
    (283678, 14, N'Çaykur Rizespor A.Ş.', N'Zecorner Kayserispor'),
    (283681, 15, N'Tümosan Konyaspor', N'Çaykur Rizespor A.Ş.');

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
    (283656, 46, N'EYÜP AYDIN', N'substituted_in_home', N'CELİL YÜKSEL', N'substituted_out_home', 0),
    (283656, 46, N'TONI BOREVKOVIC', N'substituted_in_home', N'LUBOMİR SATKA', N'substituted_out_home', 0),
    (283656, 83, N'EMRE AKBABA', N'substituted_in_away', N'KEREM DEMİRBAY', N'substituted_out_away', 0),
    (283656, 83, N'UMUT DİLAN BOZOK', N'substituted_in_away', N'THIAM MAME BABA', N'substituted_out_away', 0),
    (283656, 83, N'TAŞKIN İLTER', N'substituted_in_away', N'TARAS STEPANENKO', N'substituted_out_away', 1),
    (283656, 88, N'YUNUS EMRE ÇİFT', N'substituted_in_home', N'PAPE CHERIF NDIAYE', N'substituted_out_home', 0),
    (283656, 88, N'JOSAFAT WOODING MENDES', N'substituted_in_home', N'CARL JOHAN HOLSE JUSTESEN', N'substituted_out_home', 0),
    (283676, 46, N'PAPA ALIOUNE NDIAYE', N'substituted_in_home', N'MELİH KABASAKAL', N'substituted_out_home', 1),
    (283676, 46, N'LEO MYENTY JANNA ABENA', N'substituted_in_home', N'TAYYİP TALHA SANUÇ', N'substituted_out_home', 0),
    (283676, 46, N'DEIAN CRISTIAN SORESCU', N'substituted_in_home', N'LUIS JESUS PEREZ MAQUEDA', N'substituted_out_home', 0),
    (283676, 84, N'HALİL AKBUNAR', N'substituted_in_away', N'DENIS MIHAI DRAGUS', N'substituted_out_away', 0),
    (283676, 84, N'PRINCE OBENG AMPEM', N'substituted_in_away', N'THIAM MAME BABA', N'substituted_out_away', 0),
    (283676, 84, N'MATEUSZ JACEK LEGOWSKI', N'substituted_in_away', N'TARAS STEPANENKO', N'substituted_out_away', 1),
    (283678, 31, N'MUHAMED BULJUBASIC', N'substituted_in_home', N'TAYLAN ANTALYALI', N'substituted_out_home', 0),
    (283678, 31, N'ALTIN ZEQIRI', N'substituted_in_home', N'EMRECAN BULUT', N'substituted_out_home', 0),
    (283678, 70, N'MİTHAT PALA', N'substituted_in_home', N'CASPER SOMMER HOJER', N'substituted_out_home', 0),
    (283678, 70, N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_in_home', N'IOANNIS PAPANIKOLAOU', N'substituted_out_home', 0),
    (283681, 72, N'MUHAMED BULJUBASIC', N'substituted_in_away', N'IOANNIS PAPANIKOLAOU', N'substituted_out_away', 0),
    (283681, 72, N'ALTIN ZEQIRI', N'substituted_in_away', N'JESURUN RAK-SAKYI', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 19
    THROW 514301, 'Expected 19 report-confirmed substitutions.', 1;

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

-- Sources: TFF 283656 https://www.tff.org/Default.aspx?macId=283656&pageID=29; Transfermarkt https://www.transfermarkt.de/spielbericht/index/spielbericht/4647888
-- Sources: TFF 283676 https://www.tff.org/Default.aspx?macId=283676&pageID=29; Transfermarkt https://www.transfermarkt.com.tr/spielbericht/index/spielbericht/4647881
-- Sources: TFF 283678 https://www.tff.org/Default.aspx?macId=283678&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647883
-- Sources: TFF 283681 https://www.tff.org/Default.aspx?macId=283681&pageID=29; Transfermarkt https://www.transfermarkt.ch/konyaspor_caykur-rizespor/index/spielbericht/4647859
SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
