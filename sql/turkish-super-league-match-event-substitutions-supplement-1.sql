-- DHA report confirms eight same-minute substitutions for Antalyaspor-Fatih Karagumruk.
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @SubstitutionInput TABLE (
    source_match_id INT NOT NULL,
    week INT NOT NULL,
    home_club_name NVARCHAR(120) NOT NULL,
    away_club_name NVARCHAR(120) NOT NULL,
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
    week,
    home_club_name,
    away_club_name,
    minute,
    incoming_player_name,
    incoming_role,
    outgoing_player_name,
    outgoing_role,
    is_injury
)
VALUES
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 63, N'DARIO SARIC', N'substituted_in_home', N'ABDÜLKADİR ÖMÜR', N'substituted_out_home', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 63, N'JAKUB KALUZINSKI', N'substituted_in_home', N'BÜNYAMİN BALCI', N'substituted_out_home', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 85, N'MERT YILMAZ', N'substituted_in_home', N'GÜRAY VURAL', N'substituted_out_home', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 85, N'ENGİN POYRAZ EFE YILDIRIM', N'substituted_in_home', N'TOMAS CVANCARA', N'substituted_out_home', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 71, N'ÇAĞTAY KURUKALIP', N'substituted_in_away', N'TARIK BUĞRA KALPAKLI', N'substituted_out_away', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 71, N'BERKAY ÖZCAN', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 92, N'FATİH KURUCUK', N'substituted_in_away', N'ANIL YİĞİT ÇINAR', N'substituted_out_away', 0),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', 92, N'NIKOLOZ UGREKHELIDZE', N'substituted_in_away', N'BARIŞ JAKOB KALAYCI', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 8
    THROW 51324, 'Expected eight report-confirmed substitutions.', 1;

DECLARE @MatchMap TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    match_id INT NOT NULL UNIQUE
);

INSERT INTO @MatchMap (source_match_id, match_id)
SELECT DISTINCT input.source_match_id, match_row.match_id
FROM @SubstitutionInput AS input
INNER JOIN dbo.season AS season ON season.name = N'2025-2026'
INNER JOIN dbo.[match] AS match_row
    ON match_row.season_id = season.season_id AND match_row.week = input.week
INNER JOIN dbo.club AS home_club
    ON home_club.club_id = match_row.home_club_id AND home_club.name = input.home_club_name
INNER JOIN dbo.club AS away_club
    ON away_club.club_id = match_row.away_club_id AND away_club.name = input.away_club_name;

IF (SELECT COUNT(*) FROM @MatchMap) <> 1
    THROW 51325, 'The TFF source fixture must resolve to one database match.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map ON match_map.source_match_id = input.source_match_id
    INNER JOIN dbo.person AS incoming_person ON incoming_person.name = input.incoming_player_name
    INNER JOIN dbo.player AS incoming_player ON incoming_player.person_id = incoming_person.person_id
    LEFT JOIN dbo.appearance AS incoming_appearance
        ON incoming_appearance.match_id = match_map.match_id
        AND incoming_appearance.player_id = incoming_player.person_id
    INNER JOIN dbo.person AS outgoing_person ON outgoing_person.name = input.outgoing_player_name
    INNER JOIN dbo.player AS outgoing_player ON outgoing_player.person_id = outgoing_person.person_id
    LEFT JOIN dbo.appearance AS outgoing_appearance
        ON outgoing_appearance.match_id = match_map.match_id
        AND outgoing_appearance.player_id = outgoing_player.person_id
    WHERE incoming_appearance.player_id IS NULL OR outgoing_appearance.player_id IS NULL
)
    THROW 51326, 'Each substitution participant must have an appearance in the fixture.', 1;

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
    THROW 51327, 'A source-confirmed substitution already exists.', 1;

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
FROM NumberedSubstitutions;

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

-- Sources: TFF match sheet https://www.tff.org/Default.aspx?macId=283582&pageID=29; DHA report https://www.dha.com.tr/spor/antalyaspor-fatih-karagumruk-1-2-2709971
SELECT COUNT(*) AS sourced_substitution_events FROM @EventMap;
