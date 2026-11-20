-- TFF confirms official minutes; match reports confirm substitution pairings.
-- TFF 283822: https://www.tff.org/Default.aspx?macId=283822&pageID=29
-- Mynet 283822: https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924530-fenerbahce-caykur-rizespor
-- TFF 283834: https://www.tff.org/Default.aspx?macId=283834&pageID=29
-- Mynet 283834: https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924545-caykur-rizespor-tumosan-konyaspor
-- TFF 283836: https://www.tff.org/Default.aspx?macId=283836&pageID=29
-- DHA 283836: https://www.dha.com.tr/yerel-haberler/antalya/hesap-com-antalyaspor-corendon-alanyaspor-0-2866023
-- Nesine 283836: https://www.nesine.com/Iddaa/Mac-Merkezi/20260503/2837976
-- TFF 283854: https://www.tff.org/Default.aspx?macId=283854&pageID=29
-- İHA 283854: https://www.gazeterize.com/trendyol-super-lig-fatih-karagumruk-2-corendon-alanyaspor-1-mac-sonucu
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
    (283822, 30, N'Fenerbahçe A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283834, 32, N'Çaykur Rizespor A.Ş.', N'Tümosan Konyaspor'),
    (283836, 32, N'Hesap.com Antalyaspor', N'Corendon Alanyaspor'),
    (283854, 34, N'Mısırlı.com.tr Fatih Karagümrük', N'Corendon Alanyaspor');

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
    (283822, 55, N'ANTHONY TİTE EMMANUEL MUSABA', N'substituted_in_home', N'DORGELES NENE', N'substituted_out_home', 0),
    (283822, 55, N'MÜNİR LEVENT MERCAN', N'substituted_in_home', N'ARCHIBALD NORMAN BROWN', N'substituted_out_home', 0),
    (283822, 97, N'OĞUZ AYDIN', N'substituted_in_home', N'ANDERSON SOUZA CONCEIÇAO', N'substituted_out_home', 0),
    (283822, 97, N'MERT MÜLDÜR', N'substituted_in_home', N'NELSON CABRAL SEMEDO', N'substituted_out_home', 0),
    (283822, 80, N'EMİR ORTAKAYA', N'substituted_in_away', N'MIHAI-VALENTIN MIHAILA', N'substituted_out_away', 0),
    (283822, 80, N'MODIBO SAGNAN', N'substituted_in_away', N'LOIDE ANTONIO AUGUSTO', N'substituted_out_away', 0),
    (283822, 80, N'IOANNIS PAPANIKOLAOU', N'substituted_in_away', N'TAYLAN ANTALYALI', N'substituted_out_away', 0),
    (283834, 81, N'EMİR ORTAKAYA', N'substituted_in_home', N'SAMET AKAYDİN', N'substituted_out_home', 0),
    (283834, 81, N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_in_home', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_home', 0),
    (283834, 72, N'IOANNIS PAPANIKOLAOU', N'substituted_in_home', N'TAYLAN ANTALYALI', N'substituted_out_home', 0),
    (283834, 72, N'MUHAMMET TAHA ŞAHİN', N'substituted_in_home', N'LOIDE ANTONIO AUGUSTO', N'substituted_out_home', 0),
    (283834, 62, N'RAYYAN BANİYA', N'substituted_in_away', N'UĞURCAN YAZĞILI', N'substituted_out_away', 0),
    (283834, 62, N'MARKO JEVTOVIC', N'substituted_in_away', N'DIOGO ANTONIO CUPIDO GONÇALVES', N'substituted_out_away', 0),
    (283834, 62, N'ENIS BARDHI', N'substituted_in_away', N'KAZEEM ADEREMI J. OLAIGBE', N'substituted_out_away', 0),
    (283836, 61, N'İBRAHİM KAYA', N'substituted_in_away', N'GÜVEN YALÇIN', N'substituted_out_away', 0),
    (283836, 61, N'NICOLAS JEAN PAUL NOEL JANVIER', N'substituted_in_away', N'ANTONIO SIMAO MUANZA', N'substituted_out_away', 0),
    (283836, 91, N'ENES KESKİN', N'substituted_in_away', N'MESCHACK ELIA LINA', N'substituted_out_away', 0),
    (283836, 91, N'İZZET ÇELİK', N'substituted_in_away', N'RUAN PEREIRA DUARTE', N'substituted_out_away', 0),
    (283836, 77, N'LAUTARO DANIEL GIANNETTI', N'substituted_in_home', N'VEYSEL SARI', N'substituted_out_home', 0),
    (283836, 77, N'DARIO SARIC', N'substituted_in_home', N'SONER DİKMEN', N'substituted_out_home', 0),
    (283836, 77, N'KENNETH IMMANUEL PAAL', N'substituted_in_home', N'BÜNYAMİN BALCI', N'substituted_out_home', 0),
    (283854, 72, N'İBRAHİM KAYA', N'substituted_in_away', N'ENES KESKİN', N'substituted_out_away', 0),
    (283854, 72, N'İZZET ÇELİK', N'substituted_in_away', N'GAİUS ABRAHAM JERED MAKOUTA', N'substituted_out_away', 0),
    (283854, 72, N'IANIS HAGI', N'substituted_in_away', N'UI JO HWANG', N'substituted_out_away', 0),
    (283854, 82, N'EFECAN KARACA', N'substituted_in_away', N'ANTONIO SIMAO MUANZA', N'substituted_out_away', 0),
    (283854, 82, N'GÜVEN YALÇIN', N'substituted_in_away', N'BRUNO VIANA WILLEMEM DA SILVA', N'substituted_out_away', 0),
    (283854, 90, N'FATİH KURUCUK', N'substituted_in_home', N'SAM ANDREAS LARSSON', N'substituted_out_home', 0),
    (283854, 90, N'TARIK BUĞRA KALPAKLI', N'substituted_in_home', N'BARIŞ JAKOB KALAYCI', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 28
    THROW 514801, 'Expected 28 source-confirmed substitutions.', 1;

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
    THROW 514802, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514803, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514804, 'A source-confirmed substitution already exists.', 1;

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
