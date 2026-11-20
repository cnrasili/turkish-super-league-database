-- TFF provides official minutes; match reports confirm same-minute pairings.
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
    (283739, 21, N'Tümosan Konyaspor', N'Göztepe A.Ş.'),
    (283740, 21, N'Çaykur Rizespor A.Ş.', N'Galatasaray A.Ş.'),
    (283747, 22, N'Kasımpaşa A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283751, 22, N'Göztepe A.Ş.', N'Zecorner Kayserispor');

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
    (283739, 83, N'TAHA ALTIKARDEŞ', N'substituted_in_away', N'OGÜN BAYRAK', N'substituted_out_away', 0),
    (283739, 83, N'UĞUR KAAN YILDIZ', N'substituted_in_away', N'NOVATUS DISMAS MIROSHI', N'substituted_out_away', 0),
    (283740, 75, N'IOANNIS PAPANIKOLAOU', N'substituted_in_home', N'TAYLAN ANTALYALI', N'substituted_out_home', 0),
    (283740, 75, N'ALTIN ZEQIRI', N'substituted_in_home', N'CASPER SOMMER HOJER', N'substituted_out_home', 0),
    (283740, 75, N'FRANTZDY PIERROT', N'substituted_in_home', N'ALI SOWE', N'substituted_out_home', 0),
    (283740, 75, N'İLKAY GÜNDOĞAN', N'substituted_in_away', N'YUNUS AKGÜN', N'substituted_out_away', 0),
    (283740, 75, N'SACHA BOEY', N'substituted_in_away', N'NOA NOËLL LANG', N'substituted_out_away', 0),
    (283740, 80, N'WILFRIED STEPHANE SINGO', N'substituted_in_away', N'ABDÜLKERİM BARDAKCI', N'substituted_out_away', 0),
    (283740, 80, N'MAURO EMANUEL ICARDI', N'substituted_in_away', N'LUCAS SEBASTIAN TORREIRA DI PASCUA', N'substituted_out_away', 0),
    (283747, 75, N'PAPE HABIB GUEYE', N'substituted_in_home', N'İRFAN CAN KAHVECİ', N'substituted_out_home', 0),
    (283747, 75, N'FOUSSENI DIABATE', N'substituted_in_home', N'CENK TOSUN', N'substituted_out_home', 0),
    (283747, 75, N'RIBEIRO DIAS CARLOS MIGUEL', N'substituted_in_home', N'KEREM DEMİRBAY', N'substituted_out_home', 1),
    (283751, 75, N'MUSAH MOHAMMED', N'substituted_in_home', N'ANTHONY JUNIOR DENNIS', N'substituted_out_home', 0),
    (283751, 75, N'UĞUR KAAN YILDIZ', N'substituted_in_home', N'OGÜN BAYRAK', N'substituted_out_home', 0),
    (283751, 66, N'MEHMET ERAY ÖZBEK', N'substituted_in_away', N'RAMAZAN CİVELEK', N'substituted_out_away', 1),
    (283751, 66, N'FEDOR CHALOV', N'substituted_in_away', N'MIGUEL FILIPE NUNES CARDOSO', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 16
    THROW 514381, 'Expected 16 report-confirmed substitutions.', 1;

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
    THROW 514382, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514383, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514384, 'A source-confirmed substitution already exists.', 1;

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

-- Sources: TFF 283739 https://www.tff.org/Default.aspx?macId=283739&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924442-tumosan-konyaspor-goztepe
-- Sources: TFF 283740 https://www.tff.org/Default.aspx?macId=283740&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924448-caykur-rizespor-galatasaray
-- Sources: TFF 283747 https://www.tff.org/Default.aspx?macId=283747&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924457-kasimpasa-misirlicomtr-fatih-karagumruk
-- Sources: TFF 283751 https://www.tff.org/Default.aspx?macId=283751&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924450-goztepe-zecorner-kayserispor

SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
