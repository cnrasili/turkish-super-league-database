-- Cards that TFF records with the minute code MS instead of a numeric minute.
-- The match relation stores elapsed integer minutes, so these rows use minute 90.
-- TFF 283619: https://www.tff.org/Default.aspx?macId=283619&pageID=29
-- TFF 283627: https://www.tff.org/Default.aspx?macId=283627&pageID=29
-- TFF 283680: https://www.tff.org/Default.aspx?macId=283680&pageID=29
-- TFF 283712: https://www.tff.org/Default.aspx?macId=283712&pageID=29
-- TFF 283726: https://www.tff.org/Default.aspx?macId=283726&pageID=29
-- TFF 283735: https://www.tff.org/Default.aspx?macId=283735&pageID=29
-- TFF 283742: https://www.tff.org/Default.aspx?macId=283742&pageID=29
-- TFF 283772: https://www.tff.org/Default.aspx?macId=283772&pageID=29
-- TFF 283803: https://www.tff.org/Default.aspx?macId=283803&pageID=29
-- TFF 283806: https://www.tff.org/Default.aspx?macId=283806&pageID=29
-- TFF 283848: https://www.tff.org/Default.aspx?macId=283848&pageID=29
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
    (283619, 8, N'Trabzonspor A.Ş.', N'Zecorner Kayserispor'),
    (283627, 9, N'Tümosan Konyaspor', N'Kocaelispor'),
    (283680, 15, N'İkas Eyüpspor', N'Zecorner Kayserispor'),
    (283712, 18, N'Galatasaray A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283726, 20, N'Beşiktaş A.Ş.', N'Tümosan Konyaspor'),
    (283735, 21, N'Mısırlı.com.tr Fatih Karagümrük', N'Hesap.com Antalyaspor'),
    (283742, 21, N'Zecorner Kayserispor', N'Kocaelispor'),
    (283772, 25, N'Zecorner Kayserispor', N'Trabzonspor A.Ş.'),
    (283803, 28, N'Trabzonspor A.Ş.', N'Galatasaray A.Ş.'),
    (283806, 29, N'Göztepe A.Ş.', N'Kasımpaşa A.Ş.'),
    (283848, 33, N'Tümosan Konyaspor', N'Fenerbahçe A.Ş.');

DECLARE @CardInput TABLE (
    source_match_id INT NOT NULL,
    player_name NVARCHAR(120) NOT NULL,
    [role] NVARCHAR(30) NOT NULL,
    colour NVARCHAR(20) NOT NULL,
    PRIMARY KEY (source_match_id, player_name)
);

INSERT INTO @CardInput (source_match_id, player_name, [role], colour)
VALUES
    (283619, N'LIONEL JULES CAROLE', N'carded_away', N'yellow'),
    (283627, N'UĞURCAN YAZĞILI', N'carded_home', N'yellow'),
    (283680, N'JOAO SABINO MENDES NETO SARAIVA', N'carded_away', N'red'),
    (283712, N'ABDÜLKERİM BARDAKCI', N'carded_home', N'yellow'),
    (283726, N'DENİZ ERTAŞ', N'carded_away', N'yellow'),
    (283735, N'SONER DİKMEN', N'carded_away', N'yellow'),
    (283742, N'GÖRKEM SAĞLAM', N'carded_home', N'yellow'),
    (283772, N'JOSHUA BENJAMIN BRENET', N'carded_home', N'yellow'),
    (283803, N'ONURALP ÇAKIROĞLU', N'carded_home', N'yellow'),
    (283803, N'ABDÜLKERİM BARDAKCI', N'carded_away', N'red'),
    (283806, N'HELITON JORGE TITO DOS SANTOS', N'carded_home', N'yellow'),
    (283806, N'RODRIGO NASCIMENTO FRANCA', N'carded_away', N'yellow'),
    (283848, N'RIECHEDLY GUILLERMO BAZOER', N'carded_home', N'yellow'),
    (283848, N'OĞUZ AYDIN', N'carded_away', N'yellow');

IF (SELECT COUNT(*) FROM @CardInput) <> 14
    THROW 520001, 'Expected 14 source-confirmed cards.', 1;

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

IF (SELECT COUNT(*) FROM @MatchMap) <> 11
    THROW 520002, 'Each TFF source fixture must resolve to one database match.', 1;

IF EXISTS (
    SELECT 1
    FROM @CardInput AS input
    LEFT JOIN dbo.person AS person
        ON person.name = input.player_name
    LEFT JOIN dbo.player AS player
        ON player.person_id = person.person_id
    WHERE player.person_id IS NULL
)
    THROW 520003, 'Every card participant must resolve to a player profile.', 1;

IF EXISTS (
    SELECT 1
    FROM @CardInput AS input
    INNER JOIN @MatchMap AS match_map
        ON match_map.source_match_id = input.source_match_id
    INNER JOIN dbo.person AS person
        ON person.name = input.player_name
    INNER JOIN dbo.event_player AS event_participant
        ON event_participant.match_id = match_map.match_id
        AND event_participant.player_id = person.person_id
        AND event_participant.[role] = input.[role]
    INNER JOIN dbo.card AS existing_card
        ON existing_card.match_id = event_participant.match_id
        AND existing_card.event_no = event_participant.event_no
    INNER JOIN dbo.match_event AS existing_event
        ON existing_event.match_id = existing_card.match_id
        AND existing_event.event_no = existing_card.event_no
        AND existing_event.minute = 90
)
    THROW 520004, 'A source-confirmed card already exists.', 1;

DECLARE @EventMap TABLE (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    minute INT NOT NULL,
    player_id INT NOT NULL,
    [role] NVARCHAR(30) NOT NULL,
    colour NVARCHAR(20) NOT NULL,
    PRIMARY KEY (match_id, event_no)
);

;WITH ResolvedCards AS (
    SELECT
        match_map.match_id,
        90 AS minute,
        player.person_id AS player_id,
        input.[role],
        input.colour,
        COALESCE((
            SELECT MAX(existing_event.event_no)
            FROM dbo.match_event AS existing_event
            WHERE existing_event.match_id = match_map.match_id
        ), 0) + ROW_NUMBER() OVER (
            PARTITION BY match_map.match_id
            ORDER BY input.player_name
        ) AS event_no
    FROM @CardInput AS input
    INNER JOIN @MatchMap AS match_map
        ON match_map.source_match_id = input.source_match_id
    INNER JOIN dbo.person AS person
        ON person.name = input.player_name
    INNER JOIN dbo.player AS player
        ON player.person_id = person.person_id
)
INSERT INTO @EventMap (match_id, event_no, minute, player_id, [role], colour)
SELECT match_id, event_no, minute, player_id, [role], colour
FROM ResolvedCards;

IF (SELECT COUNT(*) FROM @EventMap) <> 14
    THROW 520005, 'Each sourced card must resolve to one event row.', 1;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.match_event (match_id, event_no, minute)
    SELECT match_id, event_no, minute
    FROM @EventMap;

    INSERT INTO dbo.event_player (match_id, event_no, player_id, [role])
    SELECT match_id, event_no, player_id, [role]
    FROM @EventMap;

    INSERT INTO dbo.card (match_id, event_no, colour)
    SELECT match_id, event_no, colour
    FROM @EventMap;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
