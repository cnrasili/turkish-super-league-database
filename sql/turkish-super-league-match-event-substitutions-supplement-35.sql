-- TFF provides official minutes; match reports confirm pairings and documented causes.
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
    (283693, 16, N'Mısırlı.com.tr Fatih Karagümrük', N'Kocaelispor'),
    (283697, 16, N'Zecorner Kayserispor', N'Corendon Alanyaspor'),
    (283698, 17, N'İkas Eyüpspor', N'Fenerbahçe A.Ş.'),
    (283699, 17, N'Tümosan Konyaspor', N'Zecorner Kayserispor');

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
    (283693, 72, N'DARKO CHURLINOV', N'substituted_in_away', N'MANUEL LUIS DA SILVA CAFUMANA', N'substituted_out_away', 0),
    (283693, 72, N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_in_away', N'BOTOND BALOGH', N'substituted_out_away', 0),
    (283697, 70, N'NICOLAS JEAN PAUL NOEL JANVIER', N'substituted_in_away', N'NUNO MIGUEL REIS LIMA', N'substituted_out_away', 0),
    (283697, 70, N'İBRAHİM KAYA', N'substituted_in_away', N'IANIS HAGI', N'substituted_out_away', 0),
    (283697, 76, N'MEHMET ERAY ÖZBEK', N'substituted_in_home', N'DORUKHAN TOKÖZ', N'substituted_out_home', 1),
    (283697, 76, N'TALHA SARIARSLAN', N'substituted_in_home', N'CARLOS MANUEL CARDOSO MANE', N'substituted_out_home', 0),
    (283698, 82, N'YİĞİT EFE DEMİR', N'substituted_in_away', N'MUHAMMED KEREM AKTÜRKOĞLU', N'substituted_out_away', 0),
    (283698, 82, N'SEBASTIAN SZYMANSKI', N'substituted_in_away', N'İSMAİL YÜKSEK', N'substituted_out_away', 0),
    (283698, 86, N'BARAN ALİ GEZEK', N'substituted_in_home', N'KEREM DEMİRBAY', N'substituted_out_home', 0),
    (283698, 86, N'TAŞKIN İLTER', N'substituted_in_home', N'TARAS STEPANENKO', N'substituted_out_home', 0),
    (283698, 86, N'CHRIST OTINIEL SADIA', N'substituted_in_home', N'DENIS MIHAI DRAGUS', N'substituted_out_home', 0),
    (283698, 89, N'BARTUĞ ELMAZ', N'substituted_in_away', N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_out_away', 0),
    (283698, 89, N'HAYDAR KARATAŞ', N'substituted_in_away', N'MARCO ASENSIO WILLEMSEN', N'substituted_out_away', 0),
    (283699, 85, N'MUZAFFER UTKU ERİŞ', N'substituted_in_home', N'JACKSON KYANVUBU MULEKA', N'substituted_out_home', 0),
    (283699, 85, N'JOSIP CALUSIC', N'substituted_in_home', N'KARAHAN YASİR SUBAŞI', N'substituted_out_home', 0),
    (283699, 85, N'MELİH BOSTAN', N'substituted_in_home', N'PEDRO HENRIQUE OLIVEIRA DOS SANTOS', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 16
    THROW 514301, 'Expected 16 report-confirmed substitutions.', 1;

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

-- Sources: TFF 283693 https://www.tff.org/Default.aspx?macId=283693&pageID=29; Mackolik https://www.mackolik.com/mac/fatih-karag%C3%BCmr%C3%BCk-vs-kocaelispor/8omy9ua0pxg5n2yx9vcrrqolw
-- Sources: TFF 283697 https://www.tff.org/Default.aspx?macId=283697&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647875
-- Sources: TFF 283698 https://www.tff.org/Default.aspx?macId=283698&pageID=29; Transfermarkt https://www.transfermarkt.com/eyupspor_fenerbahce/index/spielbericht/4647912
-- Sources: TFF 283699 https://www.tff.org/Default.aspx?macId=283699&pageID=29; Transfermarkt https://www.transfermarkt.com/spielbericht/index/spielbericht/4647913
SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
