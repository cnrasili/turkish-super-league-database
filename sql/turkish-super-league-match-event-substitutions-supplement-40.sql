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
    (283753, 23, N'Zecorner Kayserispor', N'Hesap.com Antalyaspor'),
    (283755, 23, N'Mısırlı.com.tr Fatih Karagümrük', N'Samsunspor A.Ş.'),
    (283757, 23, N'Beşiktaş A.Ş.', N'Göztepe A.Ş.'),
    (283760, 23, N'Çaykur Rizespor A.Ş.', N'Kocaelispor'),
    (283765, 24, N'Trabzonspor A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük');

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
    (283753, 46, N'DENIS MAKAROV', N'substituted_in_home', N'GERMAN ONUGKHA', N'substituted_out_home', 0),
    (283753, 46, N'FEDOR CHALOV', N'substituted_in_home', N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_out_home', 0),
    (283755, 73, N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_in_home', N'SHAVY WARREN BABICKA', N'substituted_out_home', 0),
    (283755, 73, N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_in_home', N'BERKAY ÖZCAN', N'substituted_out_home', 0),
    (283755, 83, N'AHMED TRAORE', N'substituted_in_home', N'DANIELE VERDE', N'substituted_out_home', 0),
    (283755, 83, N'BARIŞ JAKOB KALAYCI', N'substituted_in_home', N'SAM ANDREAS LARSSON', N'substituted_out_home', 0),
    (283755, 75, N'ELAYİS TAVSAN', N'substituted_in_away', N'ZEKİ YAVRU', N'substituted_out_away', 0),
    (283755, 75, N'MARIUS MOUNDILMADJI', N'substituted_in_away', N'PAPE CHERIF NDIAYE', N'substituted_out_away', 0),
    (283755, 75, N'YALÇIN KAYAN', N'substituted_in_away', N'ANTOINE MAKOUMBOU', N'substituted_out_away', 0),
    (283757, 81, N'SALİH UÇAN', N'substituted_in_home', N'ORKUN KÖKÇÜ', N'substituted_out_home', 0),
    (283757, 81, N'MUSTAFA ERHAN HEKİMOĞLU', N'substituted_in_home', N'KRİSTJAN ASLLANİ', N'substituted_out_home', 0),
    (283760, 82, N'MUHARREM CİNAN', N'substituted_in_away', N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_out_away', 0),
    (283760, 82, N'JOSEPH NONGE BOENDE', N'substituted_in_away', N'MANUEL LUIS DA SILVA CAFUMANA', N'substituted_out_away', 0),
    (283765, 73, N'ANTHONY NNADUZOR NWAKAEME', N'substituted_in_home', N'MUSTAFA ESKİHELLAÇ', N'substituted_out_home', 0),
    (283765, 73, N'MATHIAS JOHAN FJORTOFT LOVIK', N'substituted_in_home', N'CHIBUIKE GODFREY NWAIWU', N'substituted_out_home', 0),
    (283765, 76, N'ÇAĞTAY KURUKALIP', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0),
    (283765, 76, N'AHMED TRAORE', N'substituted_in_away', N'SHAVY WARREN BABICKA', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 17
    THROW 514391, 'Expected 17 report-confirmed substitutions.', 1;

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

IF (SELECT COUNT(*) FROM @MatchMap) <> 5
    THROW 514392, 'Each TFF source fixture must resolve to one database match.', 1;

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
    THROW 514393, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514394, 'A source-confirmed substitution already exists.', 1;

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

-- Sources: TFF 283753 https://www.tff.org/Default.aspx?macId=283753&pageID=29; StatsPerform https://optaplayerstats.statsperform.com/en_GB/soccer/%D0%A1%D1%83%D0%BF%D0%B5%D1%80-%D0%9B%D0%B8%D0%B3%D0%B0-2025-2026/97zghcaoec1isvvdkh9ud50d0/match/view/9cflwncyyvhkbcn9z2eecqivo/match-summary
-- Sources: TFF 283755 https://www.tff.org/Default.aspx?macId=283755&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924464-misirlicomtr-fatih-karagumruk-samsunspor; Transfermarkt https://www.transfermarkt.com.tr/spielbericht/index/spielbericht/4647969
-- Sources: TFF 283757 https://www.tff.org/Default.aspx?macId=283757&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924463-besiktas-goztepe; Transfermarkt https://www.transfermarkt.com/besiktas-jk_goztepe/index/spielbericht/4647971
-- Sources: TFF 283760 https://www.tff.org/Default.aspx?macId=283760&pageID=29; Mynet https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924462-caykur-rizespor-kocaelispor; Transfermarkt https://www.transfermarkt.com/caykur-rizespor-kocaelispor/index/spielbericht/4647974
-- Sources: TFF 283765 https://www.tff.org/Default.aspx?macId=283765&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647979

SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
