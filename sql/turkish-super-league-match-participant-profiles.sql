-- Source-backed profiles for players in the 2025-2026 TFF match sheets.
-- Contract rows are inserted only when TFF records a season-overlapping professional period.
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @ParticipantInput TABLE (
    tff_license_no BIGINT NOT NULL PRIMARY KEY,
    club_name NVARCHAR(120) NOT NULL,
    player_name NVARCHAR(120) NOT NULL,
    birth_date DATE NOT NULL,
    nationality NVARCHAR(80) NOT NULL,
    [position] NVARCHAR(40) NOT NULL,
    contract_start_date DATE NULL,
    contract_end_date DATE NULL
);

INSERT INTO @ParticipantInput (
    tff_license_no,
    club_name,
    player_name,
    birth_date,
    nationality,
    [position],
    contract_start_date,
    contract_end_date
)
VALUES
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2134198&pageId=30; position: https://www.antalyaspor.com.tr/tr/a-takim/hasan-yakub-ilcin2.html.
    (2042754, N'Hesap.com Antalyaspor', N'HASAN YAKUB İLÇİN', '2009-03-24', N'TC', N'Attacking Midfield', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2824811&pageId=526; position: https://www.transfermarkt.com/gilbert-mendy/profil/spieler/1456741.
    (19582, N'İkas Eyüpspor', N'GILBERT MENDY', '2004-11-05', N'SEN', N'Centre-Back', '2025-09-01', '2029-06-30'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2498923&pageId=30; position: https://www.transfermarkt.com.br/samu-saiz/profil/spieler/131506.
    (18419, N'İkas Eyüpspor', N'SAMUEL SAIZ ALONSO', '1991-01-22', N'ESP', N'Attacking Midfield', '2024-01-16', '2026-01-05'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1965682&pageId=30; position: owner-provided 25/26 squad screenshot.
    (3548075, N'Fenerbahçe A.Ş.', N'HAYDAR KARATAŞ', '2007-03-13', N'TC', N'Left Winger', '2025-11-20', '2026-01-24'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1438077&pageId=526; position: https://gaziantepfk.org/branslar/futbol/profesyonel-a-futbol-takimi/mirza-cihan.
    (1463696, N'Gaziantep Futbol Kulübü A.Ş.', N'MİRZA CİHAN', '2000-10-26', N'TC', N'Left Winger', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2174480&pageId=526; position: https://www.tff.org/Default.aspx?ftxtId=45024&pageId=200.
    (2688719, N'Galatasaray A.Ş.', N'ADA YÜZGEÇ', '2009-04-03', N'TC', N'Centre-Forward', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1926586&pageId=526; position: https://arsiv.mackolik.com/Futbolcu/774733/Arda-Ozyar.
    (1187343, N'Kocaelispor', N'ARDA ÖZYAR', '2007-04-16', N'TC', N'Centre-Forward', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2017837&pageId=30; position: owner-provided 25/26 squad screenshot.
    (16755, N'Kocaelispor', N'YUSUF CİHAT ÇELİK', '1996-01-02', N'TC', N'Central Midfield', '2025-08-01', '2025-08-31'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1947884&pageId=526; position: owner-provided 25/26 squad screenshot.
    (1188856, N'Kocaelispor', N'ESAT YUSUF NARİN', '2007-03-22', N'TC', N'Attacking Midfield', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1954592&pageId=30; position: https://www.aksam.com.tr/canli-skor/futbol/oyuncu-profili/kusay-dagdevir-ahmet-NSvRSTxxdWpDgxd4nAynZY/.
    (4022476, N'Tümosan Konyaspor', N'AHMET KUSAY DAĞDEVİR', '2007-01-01', N'TC', N'Central Midfield', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2089921&pageId=30; position: https://www.konyaninsesi.com.tr/konyaspor-genc-sag-beki-3-lig-ekibine-kiraladi/187912.
    (3063055, N'Tümosan Konyaspor', N'AHMET TIRPANCI', '2007-03-19', N'TC', N'Right-Back', '2026-02-02', '2030-06-30'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2153973&pageId=30; position: https://www.transfermarkt.com.tr/ata-yanik/profil/spieler/1223318.
    (3570372, N'Tümosan Konyaspor', N'ATA YANIK', '2009-05-15', N'TC', N'Centre-Back', '2025-02-11', '2027-06-30'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1933579&pageId=30; position: owner-provided 25/26 squad screenshot.
    (3049361, N'Tümosan Konyaspor', N'ENES İLYAS SEVEN', '2007-02-21', N'TC', N'Centre-Forward', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2828176&pageId=526; position: https://arsiv.mackolik.com/Futbolcu/832595/Eren-Yagmur.
    (19631, N'Tümosan Konyaspor', N'EREN CEMALİ YAĞMUR', '2007-03-09', N'TC', N'Centre-Forward', '2025-09-12', '2028-06-30'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=1976320&pageId=30; position: https://www.transfermarkt.com/omer-cobanoglu/profil/spieler/1304052.
    (3052231, N'Tümosan Konyaspor', N'ÖMER ÇOBANOĞLU', '2007-07-04', N'TC', N'Defensive Midfield', '2026-02-02', '2030-06-30'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2688250&pageId=526; position: https://www.transfermarkt.us/muhammed-cham/profil/spieler/422281.
    (19065, N'Trabzonspor A.Ş.', N'MUHAMMED CHAM SARACEVIC', '2000-09-26', N'AUT', N'Attacking Midfield', '2024-08-24', '2028-06-30'),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2184443&pageId=526; position: https://www.transfermarkt.com.tr/oguzhan-ertem/profil/spieler/1189055.
    (1762433, N'Trabzonspor A.Ş.', N'OĞUZHAN ERTEM', '2008-01-01', N'TC', N'Attacking Midfield', NULL, NULL),
-- Source: TFF https://www.tff.org/Default.aspx?kisiId=2184438&pageId=30; position: https://www.transfermarkt.com.tr/yigithan-cubukcu/profil/spieler/1376717.
    (1762431, N'Trabzonspor A.Ş.', N'YİĞİTHAN ÇUBUKCU', '2008-09-09', N'TC', N'Central Midfield', NULL, NULL);

IF (SELECT COUNT(*) FROM @ParticipantInput) <> 18
    THROW 51300, 'Expected 18 sourced match participant profiles.', 1;

IF EXISTS (
    SELECT 1
    FROM @ParticipantInput
    WHERE (contract_start_date IS NULL AND contract_end_date IS NOT NULL)
        OR (contract_start_date IS NOT NULL AND contract_end_date IS NULL)
        OR (contract_start_date IS NOT NULL AND contract_end_date IS NOT NULL
            AND (contract_end_date < contract_start_date
                OR contract_start_date > '2026-06-30'
                OR contract_end_date < '2025-07-01'))
)
    THROW 51301, 'Participant contracts must be complete and overlap the season.', 1;

IF EXISTS (
    SELECT 1
    FROM @ParticipantInput AS input
    LEFT JOIN dbo.club AS club ON club.name = input.club_name
    WHERE club.club_id IS NULL
)
    THROW 51302, 'Load the season club reference rows before participant profiles.', 1;

IF EXISTS (
    SELECT 1
    FROM @ParticipantInput AS input
    INNER JOIN dbo.person AS person ON person.name = input.player_name
)
    THROW 51303, 'A match participant profile already exists; this seed is one-time.', 1;

DECLARE @PersonMap TABLE (
    tff_license_no BIGINT NOT NULL PRIMARY KEY,
    person_id INT NOT NULL
);

BEGIN TRY
    BEGIN TRANSACTION;

    MERGE dbo.person AS target
    USING @ParticipantInput AS source
        ON 1 = 0
    WHEN NOT MATCHED THEN
        INSERT (name, birth_date, nationality)
        VALUES (source.player_name, source.birth_date, source.nationality)
    OUTPUT source.tff_license_no, inserted.person_id
        INTO @PersonMap (tff_license_no, person_id);

    INSERT INTO dbo.player (person_id, [position])
    SELECT person_map.person_id, input.[position]
    FROM @ParticipantInput AS input
    INNER JOIN @PersonMap AS person_map
        ON person_map.tff_license_no = input.tff_license_no;

    INSERT INTO dbo.[contract] (player_id, club_id, start_date, end_date)
    SELECT
        person_map.person_id,
        club.club_id,
        input.contract_start_date,
        input.contract_end_date
    FROM @ParticipantInput AS input
    INNER JOIN @PersonMap AS person_map
        ON person_map.tff_license_no = input.tff_license_no
    INNER JOIN dbo.club AS club
        ON club.name = input.club_name
    WHERE input.contract_start_date IS NOT NULL;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;

SELECT
    COUNT(*) AS match_participant_profiles,
    SUM(CASE WHEN contract_start_date IS NOT NULL THEN 1 ELSE 0 END) AS sourced_contract_periods
FROM @ParticipantInput;
