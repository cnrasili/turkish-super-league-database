-- TFF minutes and Mynet pairings for Rizespor-Antalyaspor.
-- Hojer's forced substitution is documented by Sahadan.
-- TFF: https://www.tff.org/Default.aspx?macId=283771&pageID=528
-- Mynet: https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924482-caykur-rizespor-hesapcom-antalyaspor
-- Sahadan: https://www.sahadan.com/mac/c-rizespor-vs-antalyaspor/9kc0bud2nnl3u38n3i0zewdg4/anlatim
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @MatchMap TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    week INT NOT NULL,
    home_club_name NVARCHAR(120) NOT NULL,
    away_club_name NVARCHAR(120) NOT NULL,
    match_id INT NULL
);

INSERT INTO @MatchMap (source_match_id, week, home_club_name, away_club_name)
VALUES (283771, 25, N'Çaykur Rizespor A.Ş.', N'Hesap.com Antalyaspor');

UPDATE match_map
SET match_id = match_row.match_id
FROM @MatchMap AS match_map
INNER JOIN dbo.season AS season
    ON season.name = N'2025-2026'
INNER JOIN dbo.[match] AS match_row
    ON match_row.season_id = season.season_id
    AND match_row.week = match_map.week
INNER JOIN dbo.club AS home_club
    ON home_club.club_id = match_row.home_club_id
    AND home_club.name = match_map.home_club_name
INNER JOIN dbo.club AS away_club
    ON away_club.club_id = match_row.away_club_id
    AND away_club.name = match_map.away_club_name;

IF EXISTS (SELECT 1 FROM @MatchMap WHERE match_id IS NULL)
    THROW 514401, 'The TFF fixture must resolve to one database match.', 1;

DECLARE @SubstitutionInput TABLE (
    source_match_id INT NOT NULL,
    minute INT NOT NULL,
    incoming_player_name NVARCHAR(120) NOT NULL,
    outgoing_player_name NVARCHAR(120) NOT NULL,
    incoming_role NVARCHAR(30) NOT NULL,
    outgoing_role NVARCHAR(30) NOT NULL,
    is_injury BIT NOT NULL,
    PRIMARY KEY (source_match_id, minute, incoming_player_name)
);

INSERT INTO @SubstitutionInput (
    source_match_id,
    minute,
    incoming_player_name,
    outgoing_player_name,
    incoming_role,
    outgoing_role,
    is_injury
)
VALUES
    (283771, 76, N'LOIDE ANTONIO AUGUSTO', N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', N'substituted_in_home', N'substituted_out_home', 0),
    (283771, 76, N'FRANTZDY PIERROT', N'ALI SOWE', N'substituted_in_home', N'substituted_out_home', 0),
    (283771, 83, N'ALTIN ZEQIRI', N'MIHAI-VALENTIN MIHAILA', N'substituted_in_home', N'substituted_out_home', 0),
    (283771, 83, N'IOANNIS PAPANIKOLAOU', N'QAZIM LACI', N'substituted_in_home', N'substituted_out_home', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 4
    THROW 514402, 'Expected four source-confirmed substitutions.', 1;

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
    THROW 514403, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 514404, 'A source-confirmed substitution already exists.', 1;

DECLARE @EventMap TABLE (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    minute INT NOT NULL,
    incoming_player_id INT NOT NULL,
    outgoing_player_id INT NOT NULL,
    is_injury BIT NOT NULL,
    PRIMARY KEY (match_id, event_no)
);

INSERT INTO @EventMap (
    match_id,
    event_no,
    minute,
    incoming_player_id,
    outgoing_player_id,
    is_injury
)
SELECT
    match_map.match_id,
    COALESCE((
        SELECT MAX(existing_event.event_no)
        FROM dbo.match_event AS existing_event
        WHERE existing_event.match_id = match_map.match_id
    ), 0) + ROW_NUMBER() OVER (
        PARTITION BY match_map.match_id
        ORDER BY input.minute, input.incoming_player_name
    ),
    input.minute,
    incoming_player.person_id,
    outgoing_player.person_id,
    input.is_injury
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
    ON outgoing_player.person_id = outgoing_person.person_id;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT match_id, event_no, minute
    FROM @EventMap;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT match_id, event_no, incoming_player_id, N'substituted_in_home'
    FROM @EventMap
    UNION ALL
    SELECT match_id, event_no, outgoing_player_id, N'substituted_out_home'
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

SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
