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
    (283621, 8, N'Mısırlı.com.tr Fatih Karagümrük', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283625, 8, N'Kocaelispor', N'İkas Eyüpspor'),
    (283626, 9, N'İkas Eyüpspor', N'Kasımpaşa A.Ş.'),
    (283632, 9, N'Fenerbahçe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük');

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
    (283621, 46, N'JOAO PEDRO GOMES CAMACHO', N'substituted_in_home', N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_out_home', 0),
    (283621, 46, N'DATRO DAVID FOFANA', N'substituted_in_home', N'ANDRE ANTHONY GRAY', N'substituted_out_home', 0),
    (283621, 80, N'AHMET SİVRİ', N'substituted_in_home', N'BERKAY ÖZCAN', N'substituted_out_home', 0),
    (283621, 80, N'ÇAĞTAY KURUKALIP', N'substituted_in_home', N'JURE BALKOVEC', N'substituted_out_home', 0),
    (283621, 86, N'JUNINHO GRACIELO BACUNA', N'substituted_in_away', N'DRISSA CAMARA', N'substituted_out_away', 0),
    (283621, 86, N'PAPA ALIOUNE NDIAYE', N'substituted_in_away', N'MELİH KABASAKAL', N'substituted_out_away', 0),
    (283625, 68, N'JOSEPH NONGE BOENDE', N'substituted_in_home', N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_out_home', 0),
    (283625, 68, N'KAROL LINETTY', N'substituted_in_home', N'HABIB ALI KEITA', N'substituted_out_home', 0),
    (283625, 74, N'YALÇIN KAYAN', N'substituted_in_away', N'MATEUSZ JACEK LEGOWSKI', N'substituted_out_away', 0),
    (283625, 74, N'UMUT DİLAN BOZOK', N'substituted_in_away', N'THIAM MAME BABA', N'substituted_out_away', 0),
    (283625, 87, N'CENGİZ UMUT MERAŞ', N'substituted_in_away', N'NIHAD MUJAKIC', N'substituted_out_away', 0),
    (283625, 87, N'METEHAN ALTUNBAŞ', N'substituted_in_away', N'PRINCE OBENG AMPEM', N'substituted_out_away', 0),
    (283626, 85, N'EMRE AKBABA', N'substituted_in_home', N'KEREM DEMİRBAY', N'substituted_out_home', 0),
    (283626, 85, N'UMUT DİLAN BOZOK', N'substituted_in_home', N'THIAM MAME BABA', N'substituted_out_home', 0),
    (283626, 85, N'SVIT SESLAR', N'substituted_in_home', N'SERDAR GÜRLER', N'substituted_out_home', 0),
    (283626, 85, N'YUSUF BARASI', N'substituted_in_away', N'CEM ÜSTÜNDAĞ', N'substituted_out_away', 0),
    (283626, 85, N'EMRE TAŞDEMİR', N'substituted_in_away', N'GODFRİED AYESU OWUSU FRİMPONG', N'substituted_out_away', 0),
    (283632, 60, N'BERKAY ÖZCAN', N'substituted_in_away', N'DANIEL ANTHONY JOHNSON', N'substituted_out_away', 0),
    (283632, 60, N'MARUIS TRESOR DOH', N'substituted_in_away', N'CLAUDIO MATIAS KRANEVITTER', N'substituted_out_away', 0),
    (283632, 72, N'TARIK BUĞRA KALPAKLI', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0),
    (283632, 72, N'AHMET SİVRİ', N'substituted_in_away', N'SAM ANDREAS LARSSON', N'substituted_out_away', 0),
    (283632, 65, N'YOUSSEF EN NESYRI', N'substituted_in_home', N'ANDERSON SOUZA CONCEIÇAO', N'substituted_out_home', 0),
    (283632, 65, N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_in_home', N'EDSON OMAR ALVAREZ VELAZQUEZ', N'substituted_out_home', 0),
    (283632, 78, N'SEBASTIAN SZYMANSKI', N'substituted_in_home', N'DORGELES NENE', N'substituted_out_home', 0),
    (283632, 78, N'OĞUZ AYDIN', N'substituted_in_home', N'MUHAMMED KEREM AKTÜRKOĞLU', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 25
    THROW 514301, 'Expected 25 report-confirmed substitutions.', 1;

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

-- Sources: TFF 283621 https://www.tff.org/Default.aspx?macId=283621&pageID=29; Transfermarkt https://www.transfermarkt.com.tr/fatih-karagumruk_gaziantep-fk/index/spielbericht/4647834
-- Sources: TFF 283625 https://www.tff.org/Default.aspx?macId=283625&pageID=29; Transfermarkt https://www.transfermarkt.co.uk/spielbericht/index/spielbericht/4647838
-- Sources: TFF 283626 https://www.tff.org/Default.aspx?macId=283626&pageID=29; Transfermarkt https://www.transfermarkt.com.tr/eyupspor-kasimpasa/index/spielbericht/4647839
-- Sources: TFF 283632 https://www.tff.org/Default.aspx?macId=283632&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647845
SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
