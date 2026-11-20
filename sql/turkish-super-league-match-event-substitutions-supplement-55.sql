-- TFF provides official substitution participants and minutes; club and match reports confirm same-minute pairings.
-- TFF 283563: https://www.tff.org/Default.aspx?macId=283563&pageID=528
-- Kasımpaşa 283563: https://www.kasimpasa.com.tr/tr/kasimpasa0-trabzonspor1_5667.html
-- Skorx 283563: https://skorx.com.tr/mac/kasimpasa-sk-vs-trabzonspor-19442945
-- TFF 283564: https://www.tff.org/Default.aspx?macId=283564&pageID=528
-- Gaziantep FK 283564: https://www.gaziantepfk.org/haberler/mac-sonucu-konyaspor-3-0-gaziantep
-- Referans Gazetesi 283564: https://www.referansgazetesi.com.tr/konyaspor-3-gaziantep-fk-0-mac-ozeti
-- TFF 283639: https://www.tff.org/Default.aspx?macId=283639&pageID=528
-- Sporx 283639: https://m.sporx.com/fatih-karagumruk-kayserispor-maci-goller-kartlar-4842400
-- TFF 283729: https://www.tff.org/Default.aspx?macId=283729&pageID=528
-- Yeni Haber 283729: https://www.yenihaberden.com/goztepe-evinde-geri-dondu-tum-goller-ilk-yarida-geldi/1847703/
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
    (283563, 2, N'Kasımpaşa A.Ş.', N'Trabzonspor A.Ş.'),
    (283564, 2, N'Tümosan Konyaspor', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283639, 10, N'Mısırlı.com.tr Fatih Karagümrük', N'Zecorner Kayserispor'),
    (283729, 20, N'Göztepe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük');

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
    (283563, 73, N'ATAKAN MÜJDE', N'substituted_in_home', N'RIBEIRO DIAS CARLOS MIGUEL', N'substituted_out_home', 0),
    (283563, 73, N'YUSUF BARASI', N'substituted_in_home', N'ALİ YAVUZ KOL', N'substituted_out_home', 0),
    (283563, 65, N'OLEKSANDR ZUBKOV', N'substituted_in_away', N'EDIN VISCA', N'substituted_out_away', 0),
    (283563, 65, N'DANYLO SIKAN', N'substituted_in_away', N'EBERE PAUL ONUACHU', N'substituted_out_away', 0),
    (283564, 86, N'MARIUS STEFANESCU', N'substituted_in_home', N'MARKO JEVTOVIC', N'substituted_out_home', 0),
    (283564, 86, N'MELİH BOSTAN', N'substituted_in_home', N'MEHMET UMUT NAYİR', N'substituted_out_home', 0),
    (283564, 56, N'ALİ OSMAN KALIN', N'substituted_in_away', N'ENVER KULASIN', N'substituted_out_away', 0),
    (283564, 56, N'CHRISTOPHER LUNGOYI', N'substituted_in_away', N'JUNINHO GRACIELO BACUNA', N'substituted_out_away', 0),
    (283639, 89, N'MARUIS TRESOR DOH', N'substituted_in_home', N'CLAUDIO MATIAS KRANEVITTER', N'substituted_out_home', 0),
    (283639, 89, N'ANDRE ANTHONY GRAY', N'substituted_in_home', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_home', 0),
    (283639, 46, N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_in_away', N'ARİF KOCAMAN', N'substituted_out_away', 0),
    (283639, 46, N'BURAK KAPACAK', N'substituted_in_away', N'ABDULSAMET BURAK', N'substituted_out_away', 0),
    (283729, 73, N'RHALDNEY', N'substituted_in_home', N'ISHOLA JUNIOR OLAITAN', N'substituted_out_home', 0),
    (283729, 73, N'JEFERSON MARINHO DOS SANTOS', N'substituted_in_home', N'JANDERSON DE CARVALHO COSTA', N'substituted_out_home', 0),
    (283729, 62, N'BARTUĞ ELMAZ', N'substituted_in_away', N'SAM ANDREAS LARSSON', N'substituted_out_away', 0),
    (283729, 62, N'AHMED TRAORE', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 16
    THROW 519051, 'Expected 16 source-confirmed substitutions.', 1;

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
