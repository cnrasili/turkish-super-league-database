-- TFF supplies official substitution minutes; linked match reports confirm same-minute pairings.
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
    (283614, 7, N'Fenerbahçe A.Ş.', N'Hesap.com Antalyaspor'),
    (283632, 9, N'Fenerbahçe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283658, 12, N'Gaziantep Futbol Kulübü A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283669, 13, N'Çaykur Rizespor A.Ş.', N'Fenerbahçe A.Ş.');

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
    (283614, 77, N'İRFAN CAN KAHVECİ', N'substituted_in_home', N'MUHAMMED KEREM AKTÜRKOĞLU', N'substituted_out_home', 0),
    (283614, 77, N'CENK TOSUN', N'substituted_in_home', N'YOUSSEF EN NESYRI', N'substituted_out_home', 0),
    (283614, 87, N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_in_home', N'İSMAİL YÜKSEK', N'substituted_out_home', 0),
    (283614, 87, N'SEBASTIAN SZYMANSKI', N'substituted_in_home', N'ANDERSON SOUZA CONCEIÇAO', N'substituted_out_home', 0),
    (283614, 67, N'JESPER ISMAILA CEESAY', N'substituted_in_away', N'SONER DİKMEN', N'substituted_out_away', 0),
    (283614, 67, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_away', N'HASAN YAKUB İLÇİN', N'substituted_out_away', 0),
    (283614, 80, N'DOĞUKAN SİNİK', N'substituted_in_away', N'NIKOLA STORM', N'substituted_out_away', 0),
    (283614, 80, N'SAMET KARAKOÇ', N'substituted_in_away', N'BÜNYAMİN BALCI', N'substituted_out_away', 0),
    (283632, 65, N'YOUSSEF EN NESYRI', N'substituted_in_home', N'ANDERSON SOUZA CONCEIÇAO', N'substituted_out_home', 0),
    (283632, 65, N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_in_home', N'EDSON OMAR ALVAREZ VELAZQUEZ', N'substituted_out_home', 0),
    (283632, 78, N'SEBASTIAN SZYMANSKI', N'substituted_in_home', N'DORGELES NENE', N'substituted_out_home', 0),
    (283632, 78, N'OĞUZ AYDIN', N'substituted_in_home', N'MUHAMMED KEREM AKTÜRKOĞLU', N'substituted_out_home', 0),
    (283632, 60, N'BERKAY ÖZCAN', N'substituted_in_away', N'DANIEL ANTHONY JOHNSON', N'substituted_out_away', 0),
    (283632, 60, N'MARUIS TRESOR DOH', N'substituted_in_away', N'CLAUDIO MATIAS KRANEVITTER', N'substituted_out_away', 0),
    (283632, 72, N'AHMET SİVRİ', N'substituted_in_away', N'SAM ANDREAS LARSSON', N'substituted_out_away', 0),
    (283632, 72, N'TARIK BUĞRA KALPAKLI', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0),
    (283658, 60, N'SEMİH GÜLER', N'substituted_in_home', N'ARDA KIZILDAĞ', N'substituted_out_home', 0),
    (283658, 60, N'DEIAN CRISTIAN SORESCU', N'substituted_in_home', N'LUIS JESUS PEREZ MAQUEDA', N'substituted_out_home', 0),
    (283658, 81, N'JUNINHO GRACIELO BACUNA', N'substituted_in_home', N'CHRISTOPHER LUNGOYI', N'substituted_out_home', 0),
    (283658, 81, N'EMMANUEL OKYERE BOATENG', N'substituted_in_home', N'MOHAMED LAMINE BAYO', N'substituted_out_home', 0),
    (283658, 65, N'TAYLAN ANTALYALI', N'substituted_in_away', N'QAZIM LACI', N'substituted_out_away', 0),
    (283658, 65, N'MIHAI-VALENTIN MIHAILA', N'substituted_in_away', N'JESURUN RAK-SAKYI', N'substituted_out_away', 0),
    (283658, 77, N'MİTHAT PALA', N'substituted_in_away', N'CASPER SOMMER HOJER', N'substituted_out_away', 0),
    (283658, 77, N'VACLAV JURECKA', N'substituted_in_away', N'ALI SOWE', N'substituted_out_away', 0),
    (283669, 56, N'ANDERSON SOUZA CONCEIÇAO', N'substituted_in_away', N'MERT MÜLDÜR', N'substituted_out_away', 0),
    (283669, 56, N'ARCHIBALD NORMAN BROWN', N'substituted_in_away', N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_out_away', 0),
    (283669, 75, N'VACLAV JURECKA', N'substituted_in_home', N'EMRECAN BULUT', N'substituted_out_home', 0),
    (283669, 75, N'ALTIN ZEQIRI', N'substituted_in_home', N'JESURUN RAK-SAKYI', N'substituted_out_home', 0),
    (283669, 83, N'MİTHAT PALA', N'substituted_in_home', N'CASPER SOMMER HOJER', N'substituted_out_home', 0),
    (283669, 83, N'TAYLAN ANTALYALI', N'substituted_in_home', N'IOANNIS PAPANIKOLAOU', N'substituted_out_home', 0),
    (283669, 84, N'RODRIGO NASCIMENTO FRANCA', N'substituted_in_away', N'JAYDEN QUINN OOSTERWOLDE', N'substituted_out_away', 0),
    (283669, 84, N'OĞUZ AYDIN', N'substituted_in_away', N'DORGELES NENE', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 32
    THROW 51345, 'Expected 32 report-confirmed substitutions.', 1;

DECLARE @MatchMap TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    match_id INT NOT NULL UNIQUE
);

INSERT INTO @MatchMap (source_match_id, match_id)
SELECT input.source_match_id, match_row.match_id
FROM @MatchInput AS input
INNER JOIN dbo.season AS season ON season.name = N'2025-2026'
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
    THROW 51346, 'Each TFF source fixture must resolve to one database match.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map ON match_map.source_match_id = input.source_match_id
    LEFT JOIN dbo.person AS incoming_person ON incoming_person.name = input.incoming_player_name
    LEFT JOIN dbo.player AS incoming_player ON incoming_player.person_id = incoming_person.person_id
    LEFT JOIN dbo.appearance AS incoming_appearance
        ON incoming_appearance.match_id = match_map.match_id
        AND incoming_appearance.player_id = incoming_player.person_id
    LEFT JOIN dbo.person AS outgoing_person ON outgoing_person.name = input.outgoing_player_name
    LEFT JOIN dbo.player AS outgoing_player ON outgoing_player.person_id = outgoing_person.person_id
    LEFT JOIN dbo.appearance AS outgoing_appearance
        ON outgoing_appearance.match_id = match_map.match_id
        AND outgoing_appearance.player_id = outgoing_player.person_id
    WHERE incoming_appearance.player_id IS NULL OR outgoing_appearance.player_id IS NULL
)
    THROW 51347, 'Each substitution participant must have an appearance in the fixture.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map ON match_map.source_match_id = input.source_match_id
    INNER JOIN dbo.person AS incoming_person ON incoming_person.name = input.incoming_player_name
    INNER JOIN dbo.player AS incoming_player ON incoming_player.person_id = incoming_person.person_id
    INNER JOIN dbo.person AS outgoing_person ON outgoing_person.name = input.outgoing_player_name
    INNER JOIN dbo.player AS outgoing_player ON outgoing_player.person_id = outgoing_person.person_id
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
    THROW 51348, 'A source-confirmed substitution already exists.', 1;

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

;WITH NumberedSubstitutions AS (
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
    INNER JOIN @MatchMap AS match_map ON match_map.source_match_id = input.source_match_id
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
FROM NumberedSubstitutions;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT match_id, event_no, minute FROM @EventMap;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT match_id, event_no, incoming_player_id, incoming_role FROM @EventMap
    UNION ALL
    SELECT match_id, event_no, outgoing_player_id, outgoing_role FROM @EventMap;

    INSERT INTO dbo.substitution (match_id, event_no, is_injury)
    SELECT match_id, event_no, is_injury FROM @EventMap;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- Sources: TFF 283614 https://www.tff.org/Default.aspx?macId=283614&pageID=29; match report https://www.transfermarkt.com.tr/fenerbahce-sk_antalyaspor/index/spielbericht/4646734; Antalya Korfez report https://antalyakorfezcom.teimg.com/antalyakorfez-com/uploads/2025/09/30-09-2025-00-1.pdf
-- Sources: TFF 283632 https://www.tff.org/Default.aspx?macId=283632&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647845
-- Sources: TFF 283658 https://www.tff.org/Default.aspx?macId=283658&pageID=29; Transfermarkt https://www.transfermarkt.com.tr/spielbericht/index/spielbericht/4647890
-- Sources: TFF 283669 https://www.tff.org/Default.aspx?macId=283669&pageID=29; DHA https://www.dha.com.tr/yerel-haberler/rize/caykur-rizespor-fenerbahce-2-5-2764228
SELECT COUNT(*) AS sourced_substitution_events FROM @EventMap;
