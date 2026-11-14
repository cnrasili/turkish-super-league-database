-- Load source-backed 2025-2026 coaches, season coaching periods, and referees.
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @CoachInput TABLE (
    coach_name NVARCHAR(120) NOT NULL PRIMARY KEY,
    birth_date DATE NOT NULL,
    nationality NVARCHAR(80) NOT NULL,
    license_level NVARCHAR(50) NOT NULL,
    profile_source_url NVARCHAR(300) NOT NULL
);

INSERT INTO @CoachInput (coach_name, birth_date, nationality, license_level, profile_source_url)
VALUES
    (N'ATİLA GERİN', '1968-03-03', N'TC', N'UEFA A Licence', N'https://www.transfermarkt.com/atila-gerin/profil/trainer/19158'),
    -- UEFA A reflects Pro-course prerequisites, not proof of a completed Pro award.
    (N'BURAK YILMAZ', '1985-07-15', N'TC', N'UEFA A Licence', N'https://www.transfermarkt.com/burak-yilmaz/profil/trainer/117405'),
    (N'ÇAĞDAŞ ATAN', '1980-02-28', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/cagdas-atan/profil/trainer/46594'),
    (N'EMRE BELÖZOĞLU', '1980-09-07', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/emre-belozoglu/profil/trainer/82796'),
    (N'EROL BULUT', '1975-01-31', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/erol-bulut/profil/trainer/40285'),
    (N'FATİH TEKKE', '1977-09-09', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/fatih-tekke/profil/trainer/29046'),
    (N'HÜSEYİN EROĞLU', '1972-11-02', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/huseyin-eroglu/profil/trainer/26856'),
    (N'İLHAN PALUT', '1976-11-12', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/ilhan-palut/profil/trainer/41916'),
    (N'İSMET TAŞDEMİR', '1974-01-01', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/ismet-tasdemir/profil/trainer/18920'),
    (N'LEVENT ŞAHİN', '1973-09-20', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/levent-sahin/profil/trainer/2628'),
    (N'METİN DİYADİN', '1968-02-16', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/diyadin-metin/profil/trainer/5199'),
    (N'NURİ ŞAHİN', '1988-09-05', N'TC', N'UEFA A Licence', N'https://www.transfermarkt.com/nuri--ahin/profil/trainer/96813'),
    (N'OKAN BURUK', '1973-10-19', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/okan-buruk/profil/trainer/23531'),
    (N'ONUR CAN KORKMAZ', '1991-07-17', N'TC', N'UEFA A Licence', N'https://www.transfermarkt.co.uk/onur-can-korkmaz/profil/trainer/138254'),
    (N'ORHAN AK', '1979-09-29', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/orhan-ak/profil/trainer/62361'),
    (N'RECEP UÇAR', '1975-09-22', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/recep-ucar/profil/trainer/22369'),
    (N'SAMİ UĞURLU', '1978-04-27', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/sami-ugurlu/profil/trainer/90166'),
    (N'SELÇUK İNAN', '1985-02-10', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/selcuk-inan/profil/trainer/83535'),
    -- UEFA A reflects the TFF Pro-course prerequisite, not course completion.
    (N'SELÇUK ŞAHİN', '1981-01-31', N'TC', N'UEFA A Licence', N'https://www.transfermarkt.com/selcuk-sahin/profil/trainer/87864'),
    (N'SERGEN YALÇIN', '1972-11-05', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/sergen-yal%C3%A7%C4%B1n/profil/trainer/32128'),
    (N'VOLKAN DEMİREL', '1981-10-27', N'TC', N'UEFA Pro Licence', N'https://www.transfermarkt.com/volkan-demirel/profil/trainer/72485'),
    (N'ALEKSANDAR STANOJEVIC', '1973-10-28', N'SRB', N'UEFA Pro Licence', N'https://www.transfermarkt.com/aleksandar-stanojevic/profil/trainer/4183'),
    (N'DOMENICO TEDESCO', '1985-09-12', N'ITA', N'UEFA Pro Licence', N'https://www.transfermarkt.com/domenico-tedesco/profil/trainer/30857'),
    (N'ERLING MOE', '1970-07-22', N'NOR', N'UEFA Pro Licence', N'https://www.transfermarkt.com/erling-moe/profil/trainer/41529'),
    (N'JOÃO PEREIRA', '1984-02-25', N'POR', N'UEFA B Licence', N'https://www.transfermarkt.com/joao-pereira/profil/trainer/93770'),
    (N'JOSE MOURINHO', '1963-01-26', N'POR', N'UEFA Pro Licence', N'https://www.transfermarkt.com/-/profil/trainer/781'),
    (N'MARCEL LIČKA', '1977-07-17', N'CZE', N'UEFA Pro Licence', N'https://www.transfermarkt.com/marcel-licka/profil/trainer/46373'),
    (N'MARKUS GISDOL', '1969-08-17', N'GER', N'UEFA Pro Licence', N'https://www.transfermarkt.com/markus-gisdol/profil/trainer/4849'),
    (N'MATEI-MIREL RADOI', '1981-03-22', N'ROM', N'UEFA Pro Licence', N'https://www.transfermarkt.com/mirel-radoi/profil/trainer/40857'),
    (N'OLE GUNNAR SOLSKJAER', '1973-02-26', N'NOR', N'UEFA Pro Licence', N'https://www.transfermarkt.com/ole-gunnar-solskjaer/profil/trainer/7286'),
    (N'RADOMIR DJALOVIC', '1982-10-29', N'MNE', N'UEFA Pro Licence', N'https://www.transfermarkt.com/radomir-djalovic/profil/trainer/104976'),
    (N'STANIMIR STOILOV', '1967-02-13', N'BUL', N'UEFA Pro Licence', N'https://www.transfermarkt.com/stanimir-stoilov/profil/trainer/2934'),
    (N'ŞOTA ARVELADZE', '1973-02-22', N'GEO', N'UEFA Pro Licence', N'https://www.transfermarkt.com/shota-arveladze/profil/trainer/7849'),
    (N'THOMAS REIS', '1973-10-04', N'GER', N'UEFA Pro Licence', N'https://www.transfermarkt.com/thomas-reis/profil/trainer/19735'),
    (N'THORSTEN FINK', '1967-10-29', N'GER', N'UEFA Pro Licence', N'https://www.transfermarkt.com/thorsten-fink/profil/trainer/3770');

DECLARE @CoachingInput TABLE (
    coach_name NVARCHAR(120) NOT NULL,
    club_name NVARCHAR(120) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    source_url NVARCHAR(300) NOT NULL,
    PRIMARY KEY (coach_name, club_name, start_date),
    CHECK (end_date >= start_date)
);

INSERT INTO @CoachingInput (coach_name, club_name, start_date, end_date, source_url)
VALUES
    (N'EMRE BELÖZOĞLU', N'Hesap.com Antalyaspor', '2025-07-01', '2025-10-08', N'https://www.tff.org/Default.aspx?antId=26323&pageId=219'),
    (N'OLE GUNNAR SOLSKJAER', N'Beşiktaş A.Ş.', '2025-07-01', '2025-08-28', N'https://www.transfermarkt.com/ole-gunnar-solskjaer/profil/trainer/7286'),
    (N'JOÃO PEREIRA', N'Corendon Alanyaspor', '2025-07-01', '2026-05-17', N'https://www.transfermarkt.com/joao-pereira/profil/trainer/93770'),
    (N'İLHAN PALUT', N'Çaykur Rizespor A.Ş.', '2025-07-01', '2025-11-29', N'https://www.tff.org/Default.aspx?antId=28280&pageId=219'),
    (N'MARCEL LIČKA', N'Mısırlı.com.tr Fatih Karagümrük', '2025-07-01', '2025-10-31', N'https://www.transfermarkt.com/marcel-licka/profil/trainer/46373'),
    (N'JOSE MOURINHO', N'Fenerbahçe A.Ş.', '2025-07-01', '2025-08-29', N'https://www.transfermarkt.com/-/profil/trainer/781'),
    (N'OKAN BURUK', N'Galatasaray A.Ş.', '2025-07-01', '2026-05-17', N'https://www.tff.org/Default.aspx?antId=25358&pageId=219'),
    (N'İSMET TAŞDEMİR', N'Gaziantep Futbol Kulübü A.Ş.', '2025-07-01', '2025-08-18', N'https://www.tff.org/Default.aspx?antId=24695&pageId=219'),
    (N'HÜSEYİN EROĞLU', N'Gençlerbirliği', '2025-07-01', '2025-10-28', N'https://www.tff.org/Default.aspx?antId=25228&pageId=219'),
    (N'STANIMIR STOILOV', N'Göztepe A.Ş.', '2025-07-01', '2026-05-17', N'https://www.transfermarkt.com/stanimir-stoilov/profil/trainer/2934'),
    (N'SELÇUK ŞAHİN', N'İkas Eyüpspor', '2025-07-01', '2025-10-05', N'https://www.transfermarkt.com/selcuk-sahin/profil/trainer/87864'),
    (N'ŞOTA ARVELADZE', N'Kasımpaşa A.Ş.', '2025-07-01', '2025-12-04', N'https://www.transfermarkt.com/shota-arveladze/profil/trainer/7849'),
    (N'MARKUS GISDOL', N'Zecorner Kayserispor', '2025-07-01', '2025-10-07', N'https://www.transfermarkt.com/markus-gisdol/profil/trainer/4849'),
    (N'SELÇUK İNAN', N'Kocaelispor', '2025-07-01', '2026-05-17', N'https://www.tff.org/Default.aspx?antID=53537&pageID=219'),
    (N'RECEP UÇAR', N'Tümosan Konyaspor', '2025-07-01', '2025-11-03', N'https://www.transfermarkt.com/recep-ucar/profil/trainer/22369'),
    (N'ÇAĞDAŞ ATAN', N'İstanbul Başakşehir FK', '2025-07-01', '2025-09-08', N'https://www.tff.org/Default.aspx?antID=280386&pageID=219'),
    (N'THOMAS REIS', N'Samsunspor A.Ş.', '2025-07-01', '2026-02-14', N'https://www.transfermarkt.com/thomas-reis/profil/trainer/19735'),
    (N'FATİH TEKKE', N'Trabzonspor A.Ş.', '2025-07-01', '2026-05-17', N'https://www.tff.org/Default.aspx?antID=26351&pageID=219'),
    (N'EROL BULUT', N'Hesap.com Antalyaspor', '2025-10-15', '2025-12-17', N'https://www.tff.org/Default.aspx?antId=26488&pageId=219'),
    (N'SAMİ UĞURLU', N'Hesap.com Antalyaspor', '2026-01-02', '2026-05-17', N'https://www.transfermarkt.com/sami-ugurlu/profil/trainer/90166'),
    (N'SERGEN YALÇIN', N'Beşiktaş A.Ş.', '2025-08-30', '2026-05-17', N'https://www.transfermarkt.com/sergen-yal%C3%A7%C4%B1n/profil/trainer/32128'),
    (N'ONUR CAN KORKMAZ', N'Mısırlı.com.tr Fatih Karagümrük', '2025-10-31', '2025-12-23', N'https://www.transfermarkt.co.uk/onur-can-korkmaz/profil/trainer/138254'),
    (N'ALEKSANDAR STANOJEVIC', N'Mısırlı.com.tr Fatih Karagümrük', '2026-01-01', '2026-05-17', N'https://www.transfermarkt.com/aleksandar-stanojevic/profil/trainer/4183'),
    (N'DOMENICO TEDESCO', N'Fenerbahçe A.Ş.', '2025-09-09', '2026-04-27', N'https://www.transfermarkt.com/domenico-tedesco/profil/trainer/30857'),
    (N'NURİ ŞAHİN', N'İstanbul Başakşehir FK', '2025-09-15', '2026-05-17', N'https://www.transfermarkt.com/nuri--ahin/profil/trainer/96813'),
    (N'ORHAN AK', N'İkas Eyüpspor', '2025-10-15', '2026-01-04', N'https://www.tff.org/Default.aspx?antId=27671&pageId=219'),
    (N'ATİLA GERİN', N'İkas Eyüpspor', '2026-01-04', '2026-05-17', N'https://www.transfermarkt.com/atila-gerin/profil/trainer/19158'),
    (N'RADOMIR DJALOVIC', N'Zecorner Kayserispor', '2025-10-12', '2026-02-24', N'https://www.transfermarkt.com/radomir-djalovic/profil/trainer/104976'),
    (N'ERLING MOE', N'Zecorner Kayserispor', '2026-02-25', '2026-05-17', N'https://www.transfermarkt.com/erling-moe/profil/trainer/41529'),
    (N'BURAK YILMAZ', N'Gaziantep Futbol Kulübü A.Ş.', '2025-08-19', '2025-12-15', N'https://www.transfermarkt.com/burak-yilmaz/profil/trainer/117405'),
    (N'BURAK YILMAZ', N'Gaziantep Futbol Kulübü A.Ş.', '2025-12-19', '2026-04-13', N'https://www.transfermarkt.com/burak-yilmaz/profil/trainer/117405'),
    (N'MATEI-MIREL RADOI', N'Gaziantep Futbol Kulübü A.Ş.', '2026-04-22', '2026-05-17', N'https://www.tff.org/Default.aspx?antId=2916235&pageId=219'),
    (N'VOLKAN DEMİREL', N'Gençlerbirliği', '2025-10-31', '2025-12-07', N'https://www.tff.org/Default.aspx?antId=463760&pageId=219'),
    (N'METİN DİYADİN', N'Gençlerbirliği', '2025-12-12', '2026-02-14', N'https://www.transfermarkt.com/diyadin-metin/profil/trainer/5199'),
    (N'LEVENT ŞAHİN', N'Gençlerbirliği', '2026-02-17', '2026-03-06', N'https://www.tff.org/Default.aspx?antId=8067&pageId=219'),
    (N'VOLKAN DEMİREL', N'Gençlerbirliği', '2026-03-06', '2026-05-04', N'https://www.tff.org/Default.aspx?antId=463760&pageId=219'),
    (N'METİN DİYADİN', N'Gençlerbirliği', '2026-05-05', '2026-05-17', N'https://www.transfermarkt.com/diyadin-metin/profil/trainer/5199'),
    (N'ÇAĞDAŞ ATAN', N'Tümosan Konyaspor', '2025-11-06', '2026-02-04', N'https://www.tff.org/Default.aspx?antID=280386&pageID=219'),
    (N'EMRE BELÖZOĞLU', N'Kasımpaşa A.Ş.', '2025-12-05', '2026-05-17', N'https://www.tff.org/Default.aspx?antId=26323&pageId=219'),
    (N'RECEP UÇAR', N'Çaykur Rizespor A.Ş.', '2025-12-03', '2026-05-17', N'https://www.transfermarkt.com/recep-ucar/profil/trainer/22369'),
    (N'İLHAN PALUT', N'Tümosan Konyaspor', '2026-02-06', '2026-05-17', N'https://www.tff.org/Default.aspx?antId=28280&pageId=219'),
    (N'THORSTEN FINK', N'Samsunspor A.Ş.', '2026-02-16', '2026-05-17', N'https://www.transfermarkt.com/thorsten-fink/profil/trainer/3770');

DECLARE @RefereeInput TABLE (
    referee_name NVARCHAR(120) NOT NULL PRIMARY KEY,
    birth_date DATE NOT NULL,
    nationality NVARCHAR(80) NOT NULL,
    referee_class NVARCHAR(40) NOT NULL,
    profile_source_url NVARCHAR(300) NOT NULL
);

INSERT INTO @RefereeInput (referee_name, birth_date, nationality, referee_class, profile_source_url)
VALUES
    (N'YASİN KOL', '1987-12-15', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/yasin-kol/profil/schiedsrichter/9968'),
    (N'ALİ YILMAZ', '1994-01-01', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/ali-yilmaz/profil/schiedsrichter/32320'),
    (N'CİHAN AYDIN', '1992-08-30', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/cihan-aydin/profil/schiedsrichter/17012'),
    (N'ADNAN DENİZ KAYATEPE', '1992-02-17', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/adnan-deniz-kayatepe/profil/schiedsrichter/17274'),
    (N'OĞUZHAN ÇAKIR', '1998-01-01', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/oguzhan-cakir/profil/schiedsrichter/37834'),
    (N'MEHMET TÜRKMEN', '1994-10-22', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/mehmet-turkmen/profil/schiedsrichter/27440'),
    (N'HALİL UMUT MELER', '1986-08-01', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/halil-umut-meler/profil/schiedsrichter/10014'),
    (N'ATİLLA KARAOĞLAN', '1986-06-22', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/atilla-karaoglan/profil/schiedsrichter/12534'),
    (N'ALİ ŞANSALAN', '1988-03-17', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/ali-sansalan/profil/schiedsrichter/12426'),
    (N'BATUHAN KOLAK', '1996-03-25', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/batuhan-kolak/profil/schiedsrichter/38142'),
    (N'KADİR SAĞLAM', '1986-04-08', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/kadir-saglam/profil/schiedsrichter/9806'),
    (N'ÇAĞDAŞ ALTAY', '1986-03-22', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/cagdas-altay/profil/schiedsrichter/9821'),
    (N'ALPER AKARSU', '1995-10-09', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/alper-akarsu/profil/schiedsrichter/32189'),
    (N'YİĞİT ARSLAN', '1984-05-30', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/yigit-arslan/profil/schiedsrichter/9934'),
    (N'ÖMER TOLGA GÜLDİBİ', '1990-06-26', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/omer-tolga-guldibi/profil/schiedsrichter/12719'),
    (N'ÜMİT ÖZTÜRK', '1983-10-12', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/umit-ozturk/profil/schiedsrichter/9552'),
    (N'GÜRCAN HASOVA', '1992-08-19', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/gurcan-hasova/profil/schiedsrichter/32165'),
    (N'ZORBAY KÜÇÜK', '1992-09-14', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/zorbay-kucuk/profil/schiedsrichter/17151'),
    (N'REŞAT ONUR COŞKUNSES', '1996-01-01', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/resat-onur-coskunses/profil/schiedsrichter/37769'),
    (N'ÖMER FARUK TURTAY', '1996-01-02', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/omer-faruk-turtay/profil/schiedsrichter/37817'),
    (N'ARDA KARDEŞLER', '1988-01-03', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/arda-kardesler/profil/schiedsrichter/9930'),
    (N'ABDULLAH BUĞRA TAŞKINSOY', '1992-05-29', N'TC', N'Üst Klasman Hakemi', N'https://www.transfermarkt.com/abdullah-bugra-taskinsoy/profil/schiedsrichter/26990');

IF (SELECT COUNT(*) FROM @CoachInput) <> 35
    THROW 50030, 'Expected 35 2025-2026 coach profiles.', 1;

IF (SELECT COUNT(*) FROM @CoachingInput) <> 42
    THROW 50031, 'Expected 42 2025-2026 coaching periods.', 1;

IF (SELECT COUNT(*) FROM @RefereeInput) <> 22
    THROW 50032, 'Expected 22 referee profiles with verified birth dates.', 1;

IF EXISTS (
    SELECT 1
    FROM @CoachingInput AS assignment
    LEFT JOIN @CoachInput AS coach
        ON coach.coach_name = assignment.coach_name
    WHERE coach.coach_name IS NULL
)
    THROW 50033, 'Every coaching period must reference a sourced coach profile.', 1;

IF EXISTS (
    SELECT 1
    FROM @CoachingInput AS assignment
    LEFT JOIN dbo.club AS club
        ON club.name = assignment.club_name
    WHERE club.club_id IS NULL
)
    THROW 50034, 'Load the 2025-2026 club reference data before official data.', 1;

IF (SELECT COUNT(*) FROM dbo.player) <> 493
    THROW 50035, 'Load the 493-player season roster before official data.', 1;

IF EXISTS (SELECT 1 FROM dbo.coach)
    OR EXISTS (SELECT 1 FROM dbo.referee)
    OR EXISTS (SELECT 1 FROM dbo.coaching)
    THROW 50036, 'Coach, referee, and coaching tables must be empty before seeding.', 1;

IF EXISTS (
    SELECT 1
    FROM dbo.person AS existing_person
    INNER JOIN @CoachInput AS coach
        ON existing_person.name = coach.coach_name
)
    OR EXISTS (
        SELECT 1
        FROM dbo.person AS existing_person
        INNER JOIN @RefereeInput AS referee
            ON existing_person.name = referee.referee_name
    )
    THROW 50037, 'Official names must not already exist in dbo.person.', 1;

DECLARE @CoachMap TABLE (
    coach_name NVARCHAR(120) NOT NULL PRIMARY KEY,
    person_id INT NOT NULL
);

DECLARE @RefereeMap TABLE (
    referee_name NVARCHAR(120) NOT NULL PRIMARY KEY,
    person_id INT NOT NULL
);

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.person (name, birth_date, nationality)
    OUTPUT inserted.name, inserted.person_id
        INTO @CoachMap (coach_name, person_id)
    SELECT coach_name, birth_date, nationality
    FROM @CoachInput;

    INSERT INTO dbo.coach (person_id, license_level)
    SELECT coach_map.person_id, coach.license_level
    FROM @CoachInput AS coach
    INNER JOIN @CoachMap AS coach_map
        ON coach_map.coach_name = coach.coach_name;

    INSERT INTO dbo.coaching (coach_id, club_id, start_date, end_date)
    SELECT coach_map.person_id, club.club_id, assignment.start_date, assignment.end_date
    FROM @CoachingInput AS assignment
    INNER JOIN @CoachMap AS coach_map
        ON coach_map.coach_name = assignment.coach_name
    INNER JOIN dbo.club AS club
        ON club.name = assignment.club_name;

    INSERT INTO dbo.person (name, birth_date, nationality)
    OUTPUT inserted.name, inserted.person_id
        INTO @RefereeMap (referee_name, person_id)
    SELECT referee_name, birth_date, nationality
    FROM @RefereeInput;

    INSERT INTO dbo.referee (person_id, referee_class)
    SELECT referee_map.person_id, referee.referee_class
    FROM @RefereeInput AS referee
    INNER JOIN @RefereeMap AS referee_map
        ON referee_map.referee_name = referee.referee_name;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;

SELECT
    (SELECT COUNT(*) FROM @CoachInput) AS coach_count,
    (SELECT COUNT(*) FROM @CoachingInput) AS coaching_period_count,
    (SELECT COUNT(*) FROM @RefereeInput) AS referee_count;
