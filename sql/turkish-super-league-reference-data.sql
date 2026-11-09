SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

-- Seed TFF-backed 2025-2026 reference data.
BEGIN TRY
    BEGIN TRANSACTION;

    IF EXISTS (SELECT 1 FROM dbo.stadium)
        OR EXISTS (SELECT 1 FROM dbo.club)
        OR EXISTS (SELECT 1 FROM dbo.club_colour)
        OR EXISTS (SELECT 1 FROM dbo.season)
        OR EXISTS (SELECT 1 FROM dbo.season_club)
    BEGIN
        THROW 50001, 'Reference-data tables must be empty before seeding.', 1;
    END;

    INSERT INTO dbo.stadium (name, city, capacity)
    VALUES
        (N'Beşiktaş Park', N'İstanbul', 42684),
        (N'Chobani Stadyumu FB Şükrü Saracoğlu Spor Kompleksi', N'İstanbul', 47911),
        (N'Ali Sami Yen Spor Kompleksi RAMS Park', N'İstanbul', 53387),
        (N'Papara Park', N'Trabzon', 41061),
        (N'Başakşehir Fatih Terim', N'İstanbul', 17067),
        (N'Samsun Yeni 19 Mayıs', N'Samsun', 34346),
        (N'ISONEM Park Gürsel Aksel Spor ve Sağlıklı Yaşam M.', N'İzmir', 23376),
        (N'Çaykur Didi', N'Rize', 13905),
        (N'Alanya Oba Stadyumu', N'Antalya', 9785),
        (N'Medaş Konya Büyükşehir Stadyumu', N'Konya', 41135),
        (N'Gaziantep Stadyumu', N'Gaziantep', 30320),
        (N'Antalya Stadyumu', N'Antalya', 29307),
        (N'Recep Tayyip Erdoğan Stadyumu', N'İstanbul', 13797),
        (N'Kayseri Büyükşehir Belediyesi Kadir Has Stadyumu', N'Kayseri', 31856),
        (N'Kocaeli Stadyumu', N'Kocaeli', 34829),
        (N'Eryaman Stadyumu', N'Ankara', 20000),
        (N'Atatürk Olimpiyat', N'İstanbul', 77563);

    INSERT INTO dbo.club (name, city, founded, stadium_id)
    SELECT
        source.club_name,
        source.city,
        source.founded,
        stadium.stadium_id
    FROM (VALUES
        (N'Beşiktaş A.Ş.', N'İstanbul', 1903, N'Beşiktaş Park'),
        (N'Fenerbahçe A.Ş.', N'İstanbul', 1907, N'Chobani Stadyumu FB Şükrü Saracoğlu Spor Kompleksi'),
        (N'Galatasaray A.Ş.', N'İstanbul', 1905, N'Ali Sami Yen Spor Kompleksi RAMS Park'),
        (N'Trabzonspor A.Ş.', N'Trabzon', 1967, N'Papara Park'),
        (N'İstanbul Başakşehir FK', N'İstanbul', 2014, N'Başakşehir Fatih Terim'),
        (N'Samsunspor A.Ş.', N'Samsun', 1965, N'Samsun Yeni 19 Mayıs'),
        (N'Göztepe A.Ş.', N'İzmir', 1925, N'ISONEM Park Gürsel Aksel Spor ve Sağlıklı Yaşam M.'),
        (N'Çaykur Rizespor A.Ş.', N'Rize', 1953, N'Çaykur Didi'),
        (N'Corendon Alanyaspor', N'Antalya', 1948, N'Alanya Oba Stadyumu'),
        (N'Tümosan Konyaspor', N'Konya', 1922, N'Medaş Konya Büyükşehir Stadyumu'),
        (N'Gaziantep Futbol Kulübü A.Ş.', N'Gaziantep', 1988, N'Gaziantep Stadyumu'),
        (N'Hesap.com Antalyaspor', N'Antalya', 1966, N'Antalya Stadyumu'),
        (N'Kasımpaşa A.Ş.', N'İstanbul', 1921, N'Recep Tayyip Erdoğan Stadyumu'),
        (N'Zecorner Kayserispor', N'Kayseri', 1966, N'Kayseri Büyükşehir Belediyesi Kadir Has Stadyumu'),
        (N'Kocaelispor', N'Kocaeli', 1966, N'Kocaeli Stadyumu'),
        (N'Gençlerbirliği', N'Ankara', 1923, N'Eryaman Stadyumu'),
        (N'Mısırlı.com.tr Fatih Karagümrük', N'İstanbul', 1926, N'Atatürk Olimpiyat'),
        (N'İkas Eyüpspor', N'İstanbul', 1919, N'Recep Tayyip Erdoğan Stadyumu')
    ) AS source (club_name, city, founded, stadium_name)
    INNER JOIN dbo.stadium AS stadium
        ON stadium.name = source.stadium_name;

    IF @@ROWCOUNT <> 18
    BEGIN
        THROW 50002, 'Expected 18 club rows.', 1;
    END;

    INSERT INTO dbo.club_colour (club_id, colour)
    SELECT
        club.club_id,
        source.colour
    FROM (VALUES
        (N'Beşiktaş A.Ş.', N'Black'),
        (N'Beşiktaş A.Ş.', N'White'),
        (N'Fenerbahçe A.Ş.', N'Yellow'),
        (N'Fenerbahçe A.Ş.', N'Navy'),
        (N'Galatasaray A.Ş.', N'Yellow'),
        (N'Galatasaray A.Ş.', N'Red'),
        (N'Trabzonspor A.Ş.', N'Burgundy'),
        (N'Trabzonspor A.Ş.', N'Blue'),
        (N'İstanbul Başakşehir FK', N'Orange'),
        (N'İstanbul Başakşehir FK', N'Navy'),
        (N'Samsunspor A.Ş.', N'Red'),
        (N'Samsunspor A.Ş.', N'White'),
        (N'Göztepe A.Ş.', N'Yellow'),
        (N'Göztepe A.Ş.', N'Red'),
        (N'Çaykur Rizespor A.Ş.', N'Green'),
        (N'Çaykur Rizespor A.Ş.', N'Blue'),
        (N'Corendon Alanyaspor', N'Orange'),
        (N'Corendon Alanyaspor', N'Green'),
        (N'Tümosan Konyaspor', N'Green'),
        (N'Tümosan Konyaspor', N'White'),
        (N'Gaziantep Futbol Kulübü A.Ş.', N'Red'),
        (N'Gaziantep Futbol Kulübü A.Ş.', N'Black'),
        (N'Gaziantep Futbol Kulübü A.Ş.', N'White'),
        (N'Hesap.com Antalyaspor', N'Red'),
        (N'Hesap.com Antalyaspor', N'White'),
        (N'Kasımpaşa A.Ş.', N'Navy'),
        (N'Kasımpaşa A.Ş.', N'White'),
        (N'Zecorner Kayserispor', N'Yellow'),
        (N'Zecorner Kayserispor', N'Red'),
        (N'Kocaelispor', N'Green'),
        (N'Kocaelispor', N'Black'),
        (N'Gençlerbirliği', N'Red'),
        (N'Gençlerbirliği', N'Black'),
        (N'Mısırlı.com.tr Fatih Karagümrük', N'Red'),
        (N'Mısırlı.com.tr Fatih Karagümrük', N'Black'),
        (N'İkas Eyüpspor', N'Purple'),
        (N'İkas Eyüpspor', N'Yellow')
    ) AS source (club_name, colour)
    INNER JOIN dbo.club AS club
        ON club.name = source.club_name;

    IF @@ROWCOUNT <> 37
    BEGIN
        THROW 50003, 'Expected 37 club-colour rows.', 1;
    END;

    INSERT INTO dbo.season (name)
    VALUES (N'2025-2026');

    INSERT INTO dbo.season_club (season_id, club_id)
    SELECT
        season.season_id,
        club.club_id
    FROM dbo.season AS season
    CROSS JOIN dbo.club AS club
    WHERE season.name = N'2025-2026';

    IF @@ROWCOUNT <> 18
    BEGIN
        THROW 50004, 'Expected 18 season-club rows.', 1;
    END;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
    BEGIN
        ROLLBACK TRANSACTION;
    END;

    THROW;
END CATCH;
GO
