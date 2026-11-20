-- TFF 283832: https://www.tff.org/Default.aspx?macId=283832&pageID=29
-- Transfermarkt 283832: https://www.transfermarkt.com/vorbericht/index/spielbericht/4648046
-- Mackolik 283832: https://www.mackolik.com/mac/gen%C3%A7lerbirli%C4%9Fi-vs-kocaelispor/a8k2e05gm7wxvupw5vcquyrkk
-- TFF 283846: https://www.tff.org/Default.aspx?macId=283846&pageID=528
-- FotMob 283846: https://www.fotmob.com/tr/matches/kocaelispor-vs-fatih-karagumruk/3zelx
-- TFF 283852: https://www.tff.org/Default.aspx?macId=283852&pageID=528
-- eScored 283852: https://escored.com/match/kayserispor-konyaspor-2026-05-17/
-- TFF 283857: https://www.tff.org/Default.aspx?macId=283857&pageID=528
-- Galatasaray 283857: https://www.galatasaray.org/haber/futbol/kasimpasa-1-0-galatasaray/60311
-- Mynet 283857: https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924558-kasimpasa-galatasaray
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
    (283832, 31, N'Gençlerbirliği', N'Kocaelispor'),
    (283846, 33, N'Kocaelispor', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283852, 34, N'Zecorner Kayserispor', N'Tümosan Konyaspor'),
    (283857, 34, N'Kasımpaşa A.Ş.', N'Galatasaray A.Ş.');
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
    (283832, 46, N'SERDAR DURSUN', N'substituted_in_away', N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_out_away', 0),
    (283832, 46, N'MAHAMADOU SUSOHO SISSOHO', N'substituted_in_away', N'KAROL LINETTY', N'substituted_out_away', 0),
    (283832, 68, N'MBAYE HAMADY NIANG', N'substituted_in_home', N'SEKOU KOITA', N'substituted_out_home', 0),
    (283832, 68, N'OĞULCAN ÜLGÜN', N'substituted_in_home', N'FRANCO DARYL TONGYA HEUBANG', N'substituted_out_home', 0),
    (283846, 46, N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_in_home', N'AHMET OĞUZ', N'substituted_out_home', 0),
    (283846, 46, N'HABIB ALI KEITA', N'substituted_in_home', N'JOSEPH NONGE BOENDE', N'substituted_out_home', 0),
    (283852, 57, N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_in_home', N'BURAK KAPACAK', N'substituted_out_home', 0),
    (283852, 57, N'DENIS MAKAROV', N'substituted_in_home', N'INDRIT TUCI', N'substituted_out_home', 0),
    (283852, 89, N'AHMET TIRPANCI', N'substituted_in_away', N'KARAHAN YASİR SUBAŞI', N'substituted_out_away', 0),
    (283852, 89, N'ENES İLYAS SEVEN', N'substituted_in_away', N'İSMAİL ESAT BUĞA', N'substituted_out_away', 0),
    (283852, 89, N'ÖMER ÇOBANOĞLU', N'substituted_in_away', N'JINHO JO', N'substituted_out_away', 0),
    (283857, 77, N'ISMAIL JOSHUA JAKOBS', N'substituted_in_away', N'ARDA ÜNYAY', N'substituted_out_away', 0),
    (283857, 77, N'ROLAND SALLAI', N'substituted_in_away', N'SACHA BOEY', N'substituted_out_away', 0);
IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 13
    THROW 519061, 'Expected 13 source-confirmed substitutions.', 1;

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


