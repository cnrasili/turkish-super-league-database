-- TFF confirms official minutes; match reports confirm substitution pairings.
-- TFF 283800: https://www.tff.org/Default.aspx?macId=283800&pageID=29
-- Gaziantep FK 283800: https://gaziantepfk.org/haberler/mac-sonucu-gaziantep-1-1-alanyaspor
-- Sahadan 283800 injury notes: https://www.sahadan.com/mac/gaziantep-fk-vs-alanyaspor/9vxgjl7z2o4ljotod3v3emz9w/anlatim
-- TFF 283804: https://www.tff.org/Default.aspx?macId=283804&pageID=29
-- beIN SPORTS 283804: https://beinsports.com.tr/haber/misirlicomtr-fatih-karagumruk-caykur-rizespor
-- TFF 283809: https://www.tff.org/Default.aspx?macId=283809&pageID=528
-- Mynet 283809: https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924520-ikas-eyupspor-samsunspor
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
    (283800, 28, N'Gaziantep Futbol Kulübü A.Ş.', N'Corendon Alanyaspor'),
    (283804, 28, N'Mısırlı.com.tr Fatih Karagümrük', N'Çaykur Rizespor A.Ş.'),
    (283809, 29, N'İkas Eyüpspor', N'Samsunspor A.Ş.');

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
    (283800, 76, N'LEO MYENTY JANNA ABENA', N'substituted_in_home', N'ARDA KIZILDAĞ', N'substituted_out_home', 0),
    (283800, 76, N'KARAMBA GASSAMA', N'substituted_in_home', N'LUIS JESUS PEREZ MAQUEDA', N'substituted_out_home', 1),
    (283800, 69, N'ANTONIO SIMAO MUANZA', N'substituted_in_away', N'NICOLAS JEAN PAUL NOEL JANVIER', N'substituted_out_away', 0),
    (283800, 69, N'ENES KESKİN', N'substituted_in_away', N'GÜVEN YALÇIN', N'substituted_out_away', 0),
    (283800, 82, N'EFECAN KARACA', N'substituted_in_away', N'GAİUS ABRAHAM JERED MAKOUTA', N'substituted_out_away', 0),
    (283800, 82, N'STEVE MICHEL KEVİN MOUNIE', N'substituted_in_away', N'UI JO HWANG', N'substituted_out_away', 0),
    (283804, 86, N'MUHAMMED İYYAD KADIOĞLU', N'substituted_in_home', N'ÇAĞTAY KURUKALIP', N'substituted_out_home', 0),
    (283804, 86, N'AHMED TRAORE', N'substituted_in_home', N'SAM ANDREAS LARSSON', N'substituted_out_home', 0),
    (283804, 73, N'IOANNIS PAPANIKOLAOU', N'substituted_in_away', N'TAYLAN ANTALYALI', N'substituted_out_away', 0),
    (283804, 73, N'ALTIN ZEQIRI', N'substituted_in_away', N'LOIDE ANTONIO AUGUSTO', N'substituted_out_away', 0),
    (283804, 91, N'FRANTZDY PIERROT', N'substituted_in_away', N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_out_away', 0),
    (283804, 91, N'EMRECAN BULUT', N'substituted_in_away', N'CASPER SOMMER HOJER', N'substituted_out_away', 0),
    (283809, 84, N'ABDOU KHADRE SY', N'substituted_in_home', N'METEHAN ALTUNBAŞ', N'substituted_out_home', 0),
    (283809, 84, N'TAŞKIN İLTER', N'substituted_in_home', N'MATEUSZ JACEK LEGOWSKI', N'substituted_out_home', 0),
    (283809, 69, N'TANGUY BEMIN COULIBALY', N'substituted_in_away', N'YALÇIN KAYAN', N'substituted_out_away', 0),
    (283809, 69, N'AFONSO GAMELAS DE PINHO SOUSA', N'substituted_in_away', N'JULES OLIVIER NTCHAM', N'substituted_out_away', 0),
    (283809, 84, N'TONI BOREVKOVIC', N'substituted_in_away', N'YUNUS EMRE ÇİFT', N'substituted_out_away', 0),
    (283809, 84, N'ZEKİ YAVRU', N'substituted_in_away', N'JOSAFAT WOODING MENDES', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 18
    THROW 514901, 'Expected 18 source-confirmed substitutions.', 1;

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

IF (SELECT COUNT(*) FROM @MatchMap) <> 3
    THROW 514902, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514903, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514904, 'A source-confirmed substitution already exists.', 1;

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
