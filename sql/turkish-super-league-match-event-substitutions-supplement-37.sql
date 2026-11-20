-- TFF provides official minutes; match reports confirm pairings.
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
    (283714, 18, N'Göztepe A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283716, 19, N'Trabzonspor A.Ş.', N'Kasımpaşa A.Ş.'),
    (283717, 19, N'Gaziantep Futbol Kulübü A.Ş.', N'Tümosan Konyaspor'),
    (283718, 19, N'İkas Eyüpspor', N'Beşiktaş A.Ş.');

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
    (283714, 78, N'RHALDNEY', N'substituted_in_home', N'NOVATUS DISMAS MIROSHI', N'substituted_out_home', 0),
    (283714, 78, N'EFKAN BEKİROĞLU', N'substituted_in_home', N'ISHOLA JUNIOR OLAITAN', N'substituted_out_home', 0),
    (283714, 78, N'JEFERSON MARINHO DOS SANTOS', N'substituted_in_home', N'JANDERSON DE CARVALHO COSTA', N'substituted_out_home', 0),
    (283714, 84, N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_in_away', N'MUHAMMET TAHA ŞAHİN', N'substituted_out_away', 0),
    (283714, 84, N'ALTIN ZEQIRI', N'substituted_in_away', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_away', 0),
    (283714, 71, N'TAYLAN ANTALYALI', N'substituted_in_away', N'IOANNIS PAPANIKOLAOU', N'substituted_out_away', 0),
    (283714, 71, N'MİTHAT PALA', N'substituted_in_away', N'CASPER SOMMER HOJER', N'substituted_out_away', 0),
    (283716, 80, N'ADAM AROUS', N'substituted_in_away', N'RODRIGO NASCIMENTO FRANCA', N'substituted_out_away', 0),
    (283716, 80, N'RIBEIRO DIAS CARLOS MIGUEL', N'substituted_in_away', N'İRFAN CAN KAHVECİ', N'substituted_out_away', 0),
    (283717, 70, N'BLAZ KRAMER', N'substituted_in_away', N'MEHMET UMUT NAYİR', N'substituted_out_away', 0),
    (283717, 70, N'GUILHERME HAUBERT SITYA', N'substituted_in_away', N'ARİF BOŞLUK', N'substituted_out_away', 0),
    (283718, 86, N'ANGEL YESID TORRES QUINONES', N'substituted_in_home', N'CENGİZ UMUT MERAŞ', N'substituted_out_home', 0),
    (283718, 86, N'ROBIN YALÇIN', N'substituted_in_home', N'TAŞKIN İLTER', N'substituted_out_home', 0),
    (283718, 62, N'CENGİZ ÜNDER', N'substituted_in_away', N'VACLAV CERNY', N'substituted_out_away', 0),
    (283718, 62, N'SALİH UÇAN', N'substituted_in_away', N'JOAO PEDRO FERREIRA DA SILVA', N'substituted_out_away', 0),
    (283718, 62, N'MUSTAFA ERHAN HEKİMOĞLU', N'substituted_in_away', N'MILOT RASHICA', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 16
    THROW 514361, 'Expected 16 report-confirmed substitutions.', 1;

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
    THROW 514362, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514363, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514364, 'A source-confirmed substitution already exists.', 1;

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

-- Sources: TFF 283714 https://www.tff.org/Default.aspx?macId=283714&pageID=29; beIN SPORTS https://beinsports.com.tr/haber/goztepe-caykur-rizespor-6 for pairings
-- Sources: TFF 283716 https://www.tff.org/Default.aspx?macId=283716&pageID=29; beIN SPORTS https://beinsports.com.tr/haber/trabzonspor-kasimpasa-13 for pairings
-- Sources: TFF 283717 https://www.tff.org/Default.aspx?macId=283717&pageID=29; Gaziantep FK https://www.gaziantepfk.org/haberler/mac-sonucu-gaziantep-1-1-konyaspor-2 for pairings
-- Sources: TFF 283718 https://www.tff.org/Default.aspx?macId=283718&pageID=29; Sahadan https://www.sahadan.com/mac/eyupspor-vs-besiktas/8yl78ecnv1fqynawwtf5159uc/anlatim for pairings

SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
