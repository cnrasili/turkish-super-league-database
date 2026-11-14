-- Source: TFF first-window A-team lists published on 2025-09-19.
-- Source: TFF second-window A-team lists published on 2026-02-13.
-- Load verified player facts and available professional contract periods.
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @RosterInput TABLE (
    row_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    club_name NVARCHAR(120) NOT NULL,
    tff_license_no BIGINT NOT NULL,
    shirt_no INT NULL,
    player_name NVARCHAR(120) NOT NULL,
    birth_date DATE NULL,
    nationality NVARCHAR(80) NULL,
    [position] NVARCHAR(40) NULL,
    contract_start_date DATE NULL,
    contract_end_date DATE NULL,
    first_window_source_url NVARCHAR(300) NULL,
    second_window_source_url NVARCHAR(300) NULL
);

INSERT INTO @RosterInput (
    club_name,
    tff_license_no,
    shirt_no,
    player_name,
    birth_date,
    nationality,
    [position],
    contract_start_date,
    contract_end_date,
    first_window_source_url,
    second_window_source_url
)
VALUES
-- Beşiktaş A.Ş. post-winter 2025-2026 roster
        (N'Beşiktaş A.Ş.', 1753702, 80, N'AHMET SAMİ BİRCAN', '2007-01-24', N'TC', N'Centre-Forward', '2025-09-11', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19860, 12, N'BADOBRE EMMANUEL ELYSEE DJEDJE AGBADOU', '1997-06-17', N'CIV', N'Centre-Back', '2026-02-06', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1847932, 11, N'CENGİZ ÜNDER', '1997-07-14', N'TC', N'Right Winger', '2025-09-08', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19863, 32, N'DEVIS ESTIVEN VASQUEZ LLACH', '1998-05-12', N'COL', N'Goalkeeper', '2026-02-06', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2651181, 52, N'DEVRİM ŞAHİN', '2007-04-01', N'TC', N'Left Winger', '2025-09-11', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19555, 19, N'EL BILAL TOURE', '2001-10-03', N'MLI', N'Centre-Forward', '2025-08-26', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1735476, 53, N'EMİRHAN TOPÇU', '2000-10-11', N'TC', N'Centre-Back', '2024-08-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2581208, 99, N'EMRE BİLGİN', '2004-02-26', N'TC', N'Goalkeeper', '2025-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2557140, 30, N'ERSİN DESTANOĞLU', '2001-01-01', N'TC', N'Goalkeeper', '2023-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19063, 14, N'FELIX OHIS UDUOKHAI', '1997-09-09', N'GER', N'Centre-Back', '2024-08-26', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 959235, 25, N'GÖKHAN SAZDAĞI', '1994-09-20', N'TC', N'Right-Back', '2025-09-08', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19841, 9, N'HYEONGYU OH', '2001-04-12', N'KOR', N'Centre-Forward', '2026-02-04', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19481, 15, N'ISHOLA JUNIOR OLAITAN', '2002-05-09', N'BEN', N'Central Midfield', '2026-02-03', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19618, 26, N'JOAO PEDRO FERREIRA DA SILVA', '1999-08-01', N'POR', N'Left Winger', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1157750, 17, N'KARTAL KAYRA YILMAZ', '2000-11-04', N'TC', N'Defensive Midfield', '2025-09-10', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19825, 23, N'KRİSTJAN ASLLANİ', '2002-03-09', N'ITA', N'Defensive Midfield', '2026-01-30', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19861, 62, N'MICHAEL AMIR MURILLO BERMUDEZ', '1996-02-11', N'PAN', N'Right-Back', '2026-02-06', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 18318, 7, N'MILOT RASHICA', '1996-06-28', N'ALB', N'Right Winger', '2023-08-16', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2651662, 91, N'MUSTAFA ERHAN HEKİMOĞLU', '2007-04-22', N'TC', N'Centre-Forward', '2025-06-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 893977, 20, N'NECİP UYSAL', '1991-01-24', N'TC', N'Defensive Midfield', '2025-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19508, 4, N'ONYINYE WILFRED NDIDI', '1996-12-16', N'GBR', N'Defensive Midfield', '2025-08-07', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 17359, 10, N'ORKUN KÖKÇÜ', '2000-12-29', N'TC', N'Central Midfield', '2025-07-13', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2568369, 33, N'RIDVAN YILMAZ', '2001-05-21', N'TC', N'Left-Back', '2025-08-23', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1817537, 8, N'SALİH UÇAN', '1994-01-06', N'TC', N'Central Midfield', '2024-06-28', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19536, 22, N'TAYLAN BULUT', '2006-01-19', N'TC', N'Right-Back', '2025-08-16', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19556, 35, N'TIAGO EMANUEL EMBALO DJALO', '2000-04-09', N'POR', N'Centre-Back', '2025-08-27', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19575, 18, N'VACLAV CERNY', '1997-10-17', N'CZE', N'Right Winger', '2025-09-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1254261, 58, N'YASİN ÖZCAN', '2006-04-20', N'TC', N'Centre-Back', '2026-01-28', '2027-01-27', NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
-- Corendon Alanyaspor post-winter 2025-2026 roster
        (N'Corendon Alanyaspor', 18890, 58, N'ANTONIO SIMAO MUANZA', '2003-08-04', N'ANG', N'Defensive Midfield', '2025-07-02', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19244, 18, N'BARAN MOĞULTAY', '2004-05-18', N'TC', N'Left-Back', '2025-07-02', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19342, 2, N'BATUHAN YAVUZ', '2005-05-04', N'TC', N'Left-Back', '2025-02-08', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19032, 30, N'BRUNO VIANA WILLEMEM DA SILVA', '1995-02-05', N'BRA', N'Centre-Back', '2025-08-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 1686349, 25, N'BULUTHAN BULUT', '2002-07-21', N'TC', N'Central Midfield', '2022-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 3576560, 98, N'CİHAN MEMİK', '2007-08-31', N'TC', N'Goalkeeper', '2026-02-09', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 897833, 7, N'EFECAN KARACA', '1989-11-16', N'TC', N'Right Winger', '2025-06-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2571762, 8, N'ENES KESKİN', '2001-06-04', N'TC', N'Right Midfield', '2025-01-30', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 995034, 20, N'FATİH AKSOY', '1997-11-06', N'TC', N'Centre-Back', '2025-07-21', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18560, 5, N'FIDAN ALITI', '1993-10-03', N'RKS', N'Centre-Back', '2023-07-24', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 17440, 94, N'FLORENT HADERGJONAJ', '1994-07-31', N'SUI', N'Right Midfield', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18978, 42, N'GAİUS ABRAHAM JERED MAKOUTA', '1997-07-25', N'FRA', N'Defensive Midfield', '2024-07-23', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 16301, 10, N'GÜVEN YALÇIN', '1999-01-18', N'TC', N'Centre-Forward', '2025-07-12', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 4042435, 35, N'HÜSEYİN ŞEN', '2009-01-13', N'TC', N'Right Winger', '2025-10-22', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19589, 14, N'IANIS HAGI', '1998-10-22', N'ROM', N'Attacking Midfield', '2025-09-05', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2562284, 27, N'İBRAHİM KAYA', '2001-03-09', N'TC', N'Attacking Midfield', '2025-07-02', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 1482760, 6, N'İZZET ÇELİK', '2004-06-20', N'TC', N'Central Midfield', '2025-07-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 908371, 1, N'MAHMUT ERTUĞRUL TAŞKIRAN', '1989-11-05', N'TC', N'Goalkeeper', '2023-07-04', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19609, 12, N'MESCHACK ELIA LINA', '1997-08-06', N'CGO', N'Attacking Midfield', '2025-09-12', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18530, 17, N'NICOLAS JEAN PAUL NOEL JANVIER', '1998-08-11', N'FRA', N'Central Midfield', '2023-07-03', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18753, 3, N'NUNO MIGUEL REIS LIMA', '2001-03-16', N'POR', N'Centre-Back', '2023-09-14', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 16653, 48, N'PAULO VICTOR MILEO VIDOTTI', '1987-01-12', N'BRA', N'Goalkeeper', '2025-07-27', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19611, 11, N'RUAN PEREIRA DUARTE', '2005-05-03', N'BRA', N'Left Midfield', '2025-09-12', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19608, 9, N'STEVE MICHEL KEVİN MOUNIE', '1994-09-29', N'FRA', N'Centre-Forward', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18876, 16, N'UI JO HWANG', '1992-08-28', N'KOR', N'Attacking Midfield', '2025-07-02', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2050527, 50, N'ÜMİT AKDAĞ', '2003-10-06', N'TC', N'Centre-Back', '2026-06-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2044429, 38, N'YUSUF CAN KARADEMİR', '2008-01-04', N'TC', N'Attacking Midfield', '2025-02-10', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2576122, 88, N'YUSUF ÖZDEMİR', '2001-01-10', N'TC', N'Left Midfield', '2025-06-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
-- Çaykur Rizespor A.Ş. post-winter 2025-2026 roster
        (N'Çaykur Rizespor A.Ş.', 19795, 17, N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', '2004-05-28', N'GBR', N'Left Winger', '2026-01-14', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18165, 9, N'ALI SOWE', '1994-06-14', N'GAM', N'Centre-Forward', '2025-07-17', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18613, 77, N'ALTIN ZEQIRI', '2000-07-18', N'FIN', N'Left Winger', '2023-08-10', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18687, 4, N'ATTILA MOCSI', '2000-05-29', N'HUN', N'Centre-Back', '2023-08-25', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1758329, 90, N'BAYRAM BERK ÇAPOĞLU', '2008-07-28', N'TC', N'Centre-Back', '2025-09-12', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18724, 5, N'CASPER SOMMER HOJER', '1994-11-20', N'DEN', N'Left-Back', '2023-09-09', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 3524733, 35, N'EFE DOĞAN', '2004-08-20', N'TC', N'Goalkeeper', '2025-02-07', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1759839, 22, N'EMİR BORA ÇOBAN', '2008-05-01', N'TC', N'Right-Back', '2025-09-10', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 3035025, 65, N'EMİR ORTAKAYA', '2004-06-22', N'TC', N'Centre-Back', '2026-01-30', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 3529695, 99, N'EMRECAN BULUT', '2002-11-26', N'TC', N'Left Winger', '2024-08-05', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 17596, 1, N'ERDEM CANPOLAT', '2001-04-13', N'TC', N'Goalkeeper', '2025-07-03', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19868, 19, N'FRANTZDY PIERROT', '1995-03-29', N'USA', N'Centre-Forward', '2026-02-05', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1694906, 70, N'FURKAN ORAK', '2001-05-28', N'TC', N'Right-Back', '2025-07-04', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 16933, 11, N'HALİL İBRAHİM DERVİŞOĞLU', '1999-12-08', N'TC', N'Centre-Forward', '2025-07-08', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18952, 6, N'IOANNIS PAPANIKOLAOU', '1998-11-18', N'GRE', N'Defensive Midfield', '2024-07-01', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18585, 2, N'KHUSNIDDIN ALIKULOV', '1999-04-04', N'UZB', N'Centre-Back', '2023-08-05', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18528, 50, N'LOIDE ANTONIO AUGUSTO', '2000-02-26', N'ANG', N'Right Winger', '2025-09-12', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19464, 7, N'MIHAI-VALENTIN MIHAILA', '2000-02-02', N'ROM', N'Left Winger', '2025-07-18', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1163095, 54, N'MİTHAT PALA', '2000-08-15', N'TC', N'Left-Back', '2026-06-01', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19499, 27, N'MODIBO SAGNAN', '1999-04-14', N'FRA', N'Centre-Back', '2025-08-02', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18988, 18, N'MUHAMED BULJUBASIC', '2004-07-04', N'BIH', N'Central Midfield', '2024-07-30', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 2549379, 37, N'MUHAMMET TAHA ŞAHİN', '2000-10-22', N'TC', N'Left-Back', '2023-07-22', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 17885, 10, N'OLASUNKANMI IBRAHIM OLAWOYIN', '1997-12-01', N'NGR', N'Central Midfield', '2026-06-01', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19465, 20, N'QAZIM LACI', '1996-01-19', N'ALB', N'Central Midfield', '2025-07-19', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1709152, 3, N'SAMET AKAYDİN', '1994-03-13', N'TC', N'Centre-Back', '2025-01-24', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1833146, 14, N'TAYLAN ANTALYALI', '1995-01-08', N'TC', N'Defensive Midfield', '2025-08-20', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19573, 75, N'YAHIA FOFANA', '2000-08-21', N'FRA', N'Goalkeeper', '2025-09-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1765575, 94, N'YAKUP AYAN', '2008-04-23', N'TC', N'Centre-Back', '2025-09-16', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
-- Fenerbahçe A.Ş. post-winter 2025-2026 roster
        (N'Fenerbahçe A.Ş.', 1199084, 54, N'ALAETTİN EKİCİ', '2009-01-01', N'TC', N'Left Winger', '2025-11-20', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 16546, 94, N'ANDERSON SOUZA CONCEIÇAO', '1994-02-01', N'BRA', N'Attacking Midfield', '2025-01-28', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19446, 20, N'ANTHONY TİTE EMMANUEL MUSABA', '2000-12-06', N'NED', N'Left Winger', '2026-01-02', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19447, 3, N'ARCHIBALD NORMAN BROWN', '2002-05-28', N'GBR', N'Left-Back', '2025-07-12', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1831018, 4, N'ÇAĞLAR SÖYÜNCÜ', '1996-05-23', N'TC', N'Centre-Back', '2024-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19541, 45, N'DORGELES NENE', '2002-12-23', N'MLI', N'Right Winger', '2025-08-19', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19570, 31, N'EDERSON SANTANA DE MORAES', '1993-08-17', N'POR', N'Goalkeeper', '2025-09-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19553, 11, N'EDSON OMAR ALVAREZ VELAZQUEZ', '1997-10-24', N'MEX', N'Defensive Midfield', '2025-08-22', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 2664885, 39, N'ENGİN CAN BİTERGE', '2007-01-22', N'TC', N'Goalkeeper', '2025-07-14', '2028-06-30', NULL, NULL),
        (N'Fenerbahçe A.Ş.', 1105390, 34, N'FEHMİ MERT GÜNOK', '1989-03-01', N'TC', N'Goalkeeper', '2026-01-06', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 18636, 7, N'FREDERICO RODRIGUES DE PAULA SANTOS', '1993-03-05', N'BRA', N'Central Midfield', '2023-08-13', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1668300, 5, N'İSMAİL YÜKSEK', '1999-01-26', N'TC', N'Defensive Midfield', '2023-01-20', '2027-05-31', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 18422, 24, N'JAYDEN QUINN OOSTERWOLDE', '2001-04-26', N'NED', N'Centre-Back', '2023-01-30', '2027-05-31', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 4518741, 67, N'KAMİL EFE ÜREGEN', '2008-04-09', N'TC', N'Centre-Back', '2025-12-17', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19569, 21, N'MARCO ASENSIO WILLEMSEN', '1996-01-21', N'ESP', N'Attacking Midfield', '2025-09-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19773, 6, N'MATTEO ELIAS KENZO GUENDOUZI OLIE', '1999-04-14', N'FRA', N'Central Midfield', '2026-01-08', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1627312, 8, N'MERT HAKAN YANDAŞ', '1994-08-19', N'TC', N'Attacking Midfield', '2024-06-24', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 18578, 18, N'MERT MÜLDÜR', '1999-04-03', N'TC', N'Right-Back', '2023-08-02', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19321, 37, N'MILAN SKRINIAR', '1995-02-11', N'SVK', N'Centre-Back', '2025-07-31', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1154810, 9, N'MUHAMMED KEREM AKTÜRKOĞLU', '1998-10-21', N'TC', N'Left Winger', '2025-09-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 17894, 22, N'MÜNİR LEVENT MERCAN', '2000-12-10', N'TC', N'Left-Back', '2024-06-24', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19838, 17, N'N''GOLO KANTE', '1991-03-29', N'FRA', N'Defensive Midfield', '2026-02-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19485, 27, N'NELSON CABRAL SEMEDO', '1993-11-16', N'POR', N'Right-Back', '2025-07-31', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 3538921, 70, N'OĞUZ AYDIN', '2000-10-27', N'TC', N'Left Winger', '2024-07-13', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19831, 26, N'SIDIKI CHERIF', '2006-12-15', N'GUI', N'Centre-Forward', '2026-02-01', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1139318, 13, N'TARIK ÇETİN', '1997-01-08', N'TC', N'Goalkeeper', '2025-07-14', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 2581224, 14, N'YİĞİT EFE DEMİR', '2004-08-02', N'TC', N'Centre-Back', '2025-07-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
-- Source: TFF records and owner-provided 25/26 squad screenshots.
-- Galatasaray A.Ş. post-winter 2025-2026 roster
        (N'Galatasaray A.Ş.', 3066313, 91, N'ARDA ÜNYAY', '2007-01-18', N'TC', N'Centre-Back', '2025-02-11', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 815227, 42, N'ABDÜLKERİM BARDAKCI', '1994-09-07', N'TC', N'Centre-Back', '2022-06-26', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 16880, 21, N'AHMED KUTUCU', '2000-03-01', N'TC', N'Left Winger', '2025-01-23', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 1732358, 53, N'BARIŞ ALPER YILMAZ', '2000-05-23', N'TC', N'Left Winger', '2026-06-01', '2027-05-31', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 2533607, 12, N'BATUHAN AHMET ŞEN', '1999-09-03', N'TC', N'Goalkeeper', '2023-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=2292522&pageId=30.
        (N'Galatasaray A.Ş.', 19857, 27, N'CAN ARMANDO GÜNER', '2008-12-07', N'ARG', N'Right Winger', '2026-02-05', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18707, 6, N'DAVINSON SANCHEZ MINA', '1996-07-12', N'COL', N'Centre-Back', '2023-09-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1911614&pageId=30.
        (N'Galatasaray A.Ş.', 2639006, 70, N'ENES EMRE BÜYÜK', '2006-05-08', N'TC', N'Goalkeeper', '2025-07-17', '2027-06-30', NULL, NULL),
        (N'Galatasaray A.Ş.', 2543505, 17, N'EVREN EREN ELMALI', '2000-05-07', N'TC', N'Left-Back', '2025-02-11', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19006, 8, N'GABRIEL DAVI GOMES SARA', '1999-06-26', N'BRA', N'Central Midfield', '2024-08-03', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18361, 33, N'GÖKDENİZ GÜRPÜZ', '2006-02-25', N'TC', N'Attacking Midfield', '2023-09-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 15726, 19, N'GÜNAY GÜVENÇ', '1991-01-25', N'TC', N'Goalkeeper', '2023-08-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19082, 4, N'ISMAIL JOSHUA JAKOBS', '1999-08-17', N'SEN', N'Left-Back', '2024-09-02', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 15198, 20, N'İLKAY GÜNDOĞAN', '1990-10-24', N'GER', N'Central Midfield', '2025-09-02', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 15027, 23, N'KAAN AYHAN', '1994-11-10', N'TC', N'Centre-Back', '2023-01-30', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1790244&pageId=30.
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1564936&pageId=30.
        (N'Galatasaray A.Ş.', 19420, 10, N'LEROY AZIZ SANE', '1996-01-11', N'GER', N'Right Winger', '2025-07-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18215, 34, N'LUCAS SEBASTIAN TORREIRA DI PASCUA', '1996-06-11', N'URY', N'Defensive Midfield', '2026-06-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 17353, 99, N'MARIO RENE JUNIOR LEMINA', '1993-09-01', N'GAB', N'Defensive Midfield', '2025-02-05', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18314, 9, N'MAURO EMANUEL ICARDI', '1993-02-19', N'ARG', N'Centre-Forward', '2023-07-26', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 2561466, 3, N'METEHAN BALTACI', '2002-11-03', N'TC', N'Centre-Back', '2025-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF profile https://www.tff.org/Default.aspx?kisiId=2501727&pageId=30; screenshot confirms loan-out.
        (N'Galatasaray A.Ş.', 19812, 77, N'NOA NOËLL LANG', '1999-12-17', N'NED', N'Left Winger', '2026-01-23', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19848, 74, N'RENATO SAM-NA NHAGA', '2007-03-27', N'GNB', N'Central Midfield', '2026-02-03', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19192, 7, N'ROLAND SALLAI', '1997-05-22', N'HUN', N'Right-Back', '2024-09-13', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 17776, 93, N'SACHA BOEY', '2000-09-13', N'FRA', N'Right-Back', '2026-02-05', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 991785, 1, N'UĞURCAN ÇAKIR', '1996-04-05', N'TC', N'Goalkeeper', '2025-09-01', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19101, 45, N'VICTOR JAMES OSIMHEN', '1998-12-29', N'NGA', N'Centre-Forward', '2025-07-31', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19565, 90, N'WILFRIED STEPHANE SINGO', '2000-12-25', N'CIV', N'Right-Back', '2025-08-28', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19816, 22, N'YASER ESNEYDER ASPRILLA MARTINEZ', '2003-11-19', N'COL', N'Right Winger', '2026-01-25', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 2542908, 11, N'YUNUS AKGÜN', '2000-07-07', N'TC', N'Right Winger', '2026-06-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Gaziantep Futbol Kulübü A.Ş. roster
        (N'Gaziantep Futbol Kulübü A.Ş.', 17427, 44, N'ALEXANDRU IULIAN MAXIM', '1990-07-08', N'ROM', N'Attacking Midfield', '2025-07-01', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1494070, 16, N'ALİ MEVRAN ABLAK', '2003-07-27', N'TC', N'Right Winger', '2024-08-08', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1943333, 26, N'ALİ OSMAN KALIN', '2008-03-23', N'TC', N'Left Winger', '2025-03-19', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 821324, 4, N'ARDA KIZILDAĞ', '1998-10-15', N'TC', N'Centre-Back', '2022-06-17', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 4525508, 81, N'CEMİLHAN ASLAN', '2008-05-07', N'TC', N'Goalkeeper', '2025-12-19', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19133, 11, N'CHRISTOPHER LUNGOYI', '2000-07-04', N'SUI', N'Left Winger', '2024-09-02', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18838, 18, N'DEIAN CRISTIAN SORESCU', '1997-08-29', N'ROM', N'Right Winger', '2024-08-09', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18745, 70, N'DENIS MIHAI DRAGUS', '1999-07-06', N'ROM', N'Centre-Forward', '2026-01-09', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19583, 3, N'DRISSA CAMARA', '2002-02-18', N'CIV', N'Central Midfield', '2025-08-31', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18969, 10, N'KACPER SZYMON KOZLOWSKI', '2003-10-16', N'POL', N'Attacking Midfield', '2024-07-19', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19778, 17, N'KARAMBA GASSAMA', '2005-01-02', N'GAM', N'Central Midfield', '2026-01-08', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18137, 77, N'KEVIN MANUEL RODRIGUES', '1994-03-05', N'FRA', N'Left-Back', '2025-07-10', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19427, 14, N'LEO MYENTY JANNA ABENA', '1994-12-12', N'NED', N'Centre-Back', '2025-07-01', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19544, 2, N'LUIS JESUS PEREZ MAQUEDA', '1995-02-04', N'ESP', N'Right-Back', '2025-08-20', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 4524332, 88, N'MEHMET SAMET KALKAN', '2007-06-18', N'TC', N'Centre-Back', '2025-03-03', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1024433, 6, N'MELİH KABASAKAL', '1996-02-18', N'TC', N'Defensive Midfield', '2025-08-28', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19585, 9, N'MOHAMED LAMINE BAYO', '1998-06-04', N'FRA', N'Centre-Forward', '2025-08-29', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 4545949, 85, N'MUHAMMET AKMELEK', '2009-06-06', N'TC', N'Centre-Forward', '2025-10-22', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1469308, 71, N'MUSTAFA BURAK BOZAN', '2000-08-23', N'TC', N'Goalkeeper', '2024-06-01', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 16856, 30, N'NAZIM SANGARE', '1994-05-30', N'TC', N'Centre-Back', '2025-08-07', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18199, 5, N'NIHAD MUJAKIC', '1998-04-15', N'BIH', N'Centre-Back', '2026-01-08', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1733617, 61, N'OGÜN ÖZÇİÇEK', '1999-01-24', N'TC', N'Defensive Midfield', '2024-08-08', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18609, 22, N'SALEM M''BAKATA', '1998-04-19', N'FRA', N'Right-Back', '2023-08-08', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 841983, 23, N'TAYYİP TALHA SANUÇ', '1999-12-17', N'TC', N'Centre-Back', '2025-09-07', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19765, 8, N'VICTOR NTINO-EMO GIDADO', '2004-07-14', N'NGR', N'Attacking Midfield', '2026-01-08', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 17202, 32, N'YUSUF KARHAN KABADAYI', '2004-02-02', N'TC', N'Left Winger', '2025-09-12', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 3501109, 20, N'ZAFER GÖRGEN', '2000-06-21', N'TC', N'Goalkeeper', '2025-08-15', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
-- Gençlerbirliği roster
        (N'Gençlerbirliği', 235431, 77, N'ABDURRAHİM DURSUN', '1998-04-01', N'TC', N'Left-Back', '2025-08-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19534, 20, N'ADAMA TRAORE', '1995-06-05', N'MLI', N'Right Winger', '2025-08-15', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3055675, 44, N'ARDA ÇAĞAN ÇELİK', '2005-03-29', N'TC', N'Centre-Back', '2023-08-17', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19634, 15, N'AYOTOMIWA SHERIF DELE BASHIRU', '1999-09-17', N'NGA', N'Defensive Midfield', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18774, 99, N'CİHAN ÇANAK', '2005-01-24', N'TC', N'Right Winger', '2026-01-30', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18621, 53, N'DAL VARESANOVIC', '2001-05-23', N'BIH', N'Attacking Midfield', '2025-09-11', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 17774, 6, N'DIMITRIOS GOUTAS', '1994-04-04', N'GRE', N'Centre-Back', '2025-07-11', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1668491, 33, N'EBRAR YİĞİT AYDIN', '2000-09-03', N'TC', N'Goalkeeper', '2023-01-12', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19138, 27, N'EMİRHAN ÜNAL', '2005-02-04', N'TC', N'Right-Back', '2024-08-15', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 2600611, 61, N'ENSAR KEMALOĞLU', '1998-10-05', N'TC', N'Central Midfield', '2024-08-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1853012, 18, N'ERHAN ERENTÜRK', '1995-05-30', N'TC', N'Goalkeeper', '2025-07-08', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1662364, 88, N'FIRATCAN ÜZÜM', '1999-01-04', N'TC', N'Right-Back', '2024-06-25', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19584, 70, N'FRANCO DARYL TONGYA HEUBANG', '2002-03-13', N'ITA', N'Central Midfield', '2025-09-05', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3072107, 16, N'FURKAN AYAZ ÖZCAN', '2009-10-01', N'TC', N'Centre-Forward', '2025-08-04', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 17147, 11, N'GÖKTAN GÜRPÜZ', '2003-01-22', N'TC', N'Attacking Midfield', '2025-07-31', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 16956, 7, N'HENRY CHUKWUEMEKA ONYEKURU', '1997-06-05', N'NGA', N'Left Winger', '2025-07-21', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19640, 24, N'MARIO RICARDO DA SILVA VELHO', '1998-08-20', N'POR', N'Goalkeeper', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18176, 23, N'MATEJ HANOUSEK', '1993-06-02', N'CZE', N'Left-Back', '2025-01-17', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18607, 29, N'MBAYE HAMADY NIANG', '1994-04-19', N'SEN', N'Centre-Forward', '2025-08-30', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 947992, 10, N'METEHAN MİMAROĞLU', '1994-07-07', N'TC', N'Left Winger', '2025-07-08', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1847884, 35, N'OĞULCAN ÜLGÜN', '1998-05-11', N'TC', N'Central Midfield', '2025-08-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3140109, 42, N'OUSMANE DIABATE', '2007-09-24', N'GUI', N'Defensive Midfield', '2026-01-22', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18255, 13, N'PEDRO MIGUEL DE ALMEIDA LOPES PEREIRA', '1998-08-22', N'POR', N'Right-Back', '2025-07-25', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 17184, 8, N'SAMED ONUR', '2002-09-15', N'TC', N'Central Midfield', '2024-07-24', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19543, 22, N'SEKOU KOITA', '1999-11-28', N'MLI', N'Centre-Forward', '2025-08-19', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18998, 2, N'THALISSON KELVEN DA SILVA', '1998-05-07', N'BRA', N'Centre-Back', '2025-07-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3057184, 93, N'YİĞİT HAMZA AYDAR', '2008-09-20', N'TC', N'Centre-Back', '2025-08-04', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19029, 4, N'ZAN ZUZEK', '1997-01-26', N'SLO', N'Centre-Back', '2024-08-08', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
-- Göztepe A.Ş. post-winter 2025-2026 roster
        (N'Göztepe A.Ş.', 19762, 8, N'ALEXIS ANTUNES GOMEZ', '2000-07-31', N'SUI', N'Attacking Midfield', '2026-01-05', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19461, 3, N'ALLAN GODOI SANTOS', '1993-04-04', N'BRA', N'Centre-Back', '2025-06-30', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 18416, 30, N'ANTHONY JUNIOR DENNIS', '2004-06-21', N'NGR', N'Defensive Midfield', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 2588565, 2, N'ARDA OKAN KURTULAN', '2002-11-19', N'TC', N'Right Midfield', '2025-06-30', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 17489, 11, N'EFKAN BEKİROĞLU', '1995-09-14', N'TC', N'Attacking Midfield', '2025-08-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 3544105, 45, N'EGE YILDIRIM', '2007-04-18', N'TC', N'Centre-Back', '2023-07-31', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1640973, 17, N'EKREM KILIÇARSLAN', '1997-08-22', N'TC', N'Goalkeeper', '2024-07-12', '2026-05-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19850, 10, N'FILIP YAVOROV KRASTEV', '2001-10-15', N'BUL', N'Attacking Midfield', '2026-02-04', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1887994, 23, N'FURKAN BAYIR', '2000-02-09', N'TC', N'Centre-Back', '2025-01-27', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19764, 14, N'GUILERME LUIZ OLIVEIRA DA SILVA', '2005-04-25', N'BRA', N'Centre-Forward', '2026-01-02', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 18821, 5, N'HELITON JORGE TITO DOS SANTOS', '1995-11-13', N'BRA', N'Centre-Back', '2024-01-11', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1416732, 12, N'İSMAİL KÖYBAŞI', '1989-07-10', N'TC', N'Left-Back', '2025-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19454, 39, N'JANDERSON DE CARVALHO COSTA', '1999-05-06', N'BRA', N'Centre-Forward', '2025-06-30', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19796, 19, N'JEFERSON MARINHO DOS SANTOS', '1999-10-24', N'BRA', N'Centre-Forward', '2026-01-16', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19048, 9, N'JUAN SANTOS DA SILVA', '2002-03-07', N'BRA', N'Centre-Forward', '2025-08-24', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19045, 26, N'MALCOM NARCISSE BOKELE MPUTU', '2000-02-12', N'FRA', N'Centre-Back', '2024-08-13', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 17861, 1, N'MATEUSZ LIS', '1997-02-27', N'POL', N'Goalkeeper', '2024-08-21', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1262946, 33, N'MEHMET ŞAMİL ÖZTÜRK', '2005-05-09', N'TC', N'Goalkeeper', '2026-01-14', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19479, 15, N'MOHAMMED AMIN CHERNI', '2001-07-07', N'FRA', N'Left-Back', '2025-07-23', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 17718, 6, N'MUSAH MOHAMMED', '2002-01-05', N'GHA', N'Defensive Midfield', '2026-02-05', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 4526270, 21, N'NEVZAT TAN ÜZEL', '2007-03-07', N'TC', N'Goalkeeper', '2025-08-09', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', NULL),
        (N'Göztepe A.Ş.', 18979, 20, N'NOVATUS DISMAS MIROSHI', '2002-09-02', N'TAN', N'Defensive Midfield', '2024-07-22', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1656504, 77, N'OGÜN BAYRAK', '1998-10-10', N'TC', N'Right Midfield', '2023-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1688340, 4, N'TAHA ALTIKARDEŞ', '2003-08-22', N'TC', N'Centre-Back', '2023-07-03', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 2563899, 22, N'UĞUR KAAN YILDIZ', '2002-08-06', N'TC', N'Right Winger', '2022-07-14', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
-- Hesap.com Antalyaspor roster
        (N'Hesap.com Antalyaspor', 1517676, 21, N'ABDULLAH YİĞİTER', '2000-08-20', N'TC', N'Goalkeeper', '2024-07-25', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 1731006, 10, N'ABDÜLKADİR ÖMÜR', '1999-07-25', N'TC', N'Right Winger', '2025-07-29', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 18656, 22, N'ALEXANDER GERARD VAN DE STREEK', '1993-03-24', N'NED', N'Attacking Midfield', '2025-07-14', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2021055, 5, N'BAHADIR ÖZTÜRK', '1995-10-01', N'TC', N'Centre-Back', '2021-06-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2014032, 7, N'BÜNYAMİN BALCI', '2000-05-31', N'TC', N'Right-Back', '2025-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 18689, 88, N'DARIO SARIC', '1997-05-30', N'ITA', N'Central Midfield', '2025-08-18', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2003142, 70, N'DOĞUKAN SİNİK', '1999-01-21', N'TC', N'Left Winger', '2023-01-12', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2038434, 98, N'EGE İZMİRLİ', '2008-10-23', N'TC', N'Centre-Back', '2026-02-04', '2029-06-30', NULL, NULL),
        (N'Hesap.com Antalyaspor', 15995, 17, N'ERDOĞAN YEŞİLYURT', '1993-11-06', N'TC', N'Right-Back', '2023-07-13', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19514, 14, N'GEORGII DZHIKIIA', '1993-05-21', N'RUS', N'Centre-Back', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 1716713, 4, N'HÜSEYİN TÜRKMEN', '1998-01-01', N'TC', N'Centre-Back', '2025-07-09', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19525, 23, N'JESPER ISMAILA CEESAY', '2001-10-20', N'SWE', N'Defensive Midfield', '2025-08-12', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19558, 1, N'JULIAN CUESTA DIAZ', '1991-03-28', N'ESP', N'Goalkeeper', '2025-08-25', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2032387, 96, N'KAĞAN ARICAN', '2006-03-10', N'TC', N'Goalkeeper', '2025-06-01', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19482, 3, N'KENNETH IMMANUEL PAAL', '1997-06-24', N'NED', N'Left-Back', '2025-07-14', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2630092, 90, N'KEREM KAYAARASI', '2006-03-18', N'TC', N'Centre-Forward', '2025-08-04', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19522, 30, N'LAUTARO DANIEL GIANNETTI', '1993-05-13', N'ARG', N'Centre-Back', '2025-08-11', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19633, 24, N'MOUHAMED EL BACHIR GUEYE', '2003-03-08', N'SEN', N'Centre-Forward', '2025-09-11', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19501, 26, N'NIKOLA STORM', '1994-09-30', N'BEL', N'Left Winger', '2025-08-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 18761, 8, N'RAMZI SAFURI', '1995-10-21', N'ISR', N'Attacking Midfield', '2025-07-07', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2559200, 2, N'SAMET KARAKOÇ', '2002-10-22', N'TC', N'Left-Back', '2025-09-12', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19629, 11, N'SAMUEL LEO BEAT BALLET', '2001-03-12', N'SUI', N'Centre-Forward', '2025-09-11', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 802632, 6, N'SONER DİKMEN', '1993-09-01', N'TC', N'Central Midfield', '2024-07-06', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 873639, 89, N'VEYSEL SARI', '1988-07-25', N'TC', N'Centre-Back', '2025-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19602, 77, N'YOHAN ALEXANDRE MADY BOLI', '1993-11-17', N'CIV', N'Centre-Forward', '2025-09-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
-- İstanbul Başakşehir FK post-winter 2025-2026 roster
        (N'İstanbul Başakşehir FK', 19492, 11, N'ABBOSBEK FAYZULLAYEV', '2003-10-03', N'UZB', N'Left Winger', '2025-07-30', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19639, 25, N'AMINE HARIT', '1997-06-18', N'FRA', N'Right Winger', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 821331, 2, N'BERAT AYBERK ÖZDEMİR', '1998-05-23', N'TC', N'Defensive Midfield', '2024-08-10', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18783, 45, N'BERKAY ASLAN', '2007-01-05', N'TC', N'Left Winger', '2025-07-03', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 2576523, 91, N'BERTUĞ ÖZGÜR YILDIRIM', '2002-07-12', N'TC', N'Centre-Forward', '2025-09-11', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19255, 21, N'CHRİSTOPHER TEA DOMORAUD OPERI', '1997-04-29', N'CIV', N'Left-Back', '2025-01-13', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19456, 9, N'DAVIE SELKE', '1995-01-20', N'GER', N'Centre-Forward', '2025-07-11', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 1244810, 80, N'DOĞAN ALEMDAR', '2002-10-29', N'TC', N'Goalkeeper', '2025-09-11', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19448, 14, N'ELDOR SHOMURODOV', '1995-06-29', N'UZB', N'Centre-Forward', '2025-07-08', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19320, 36, N'FESTY OSEIWE EBOSELE', '2002-08-02', N'IRL', N'Left-Back', '2025-01-31', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 2687812, 24, N'GÜVEN ATALAY', '2009-08-19', N'TC', N'Goalkeeper', '2025-10-08', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 2623704, 15, N'HAMZA GÜRELER', '2006-04-10', N'TC', N'Centre-Back', '2023-11-13', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19349, 77, N'IVAN BRNIC', '2001-08-23', N'CRO', N'Left Winger', '2025-02-08', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18604, 18, N'JAKUB KALUZINSKI', '2002-10-31', N'POL', N'Defensive Midfield', '2025-09-11', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18763, 3, N'JEROME OPOKU', '1998-10-14', N'GBR', N'Centre-Back', '2023-09-15', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1564936&pageId=30.
        (N'İstanbul Başakşehir FK', 3501493, 88, N'KAZIMCAN KARATAŞ', '2003-01-16', N'TC', N'Left-Back', '2026-02-06', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17665, 5, N'LEONARDO CAMPOS DUARTE DA SILVA', '1996-07-17', N'BRA', N'Centre-Back', '2022-07-14', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17954, 13, N'MIGUEL CRESPO DA SILVA', '1996-09-11', N'POR', N'Central Midfield', '2024-08-22', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 1632520, 16, N'MUHAMMED ŞENGEZER', '1997-01-05', N'TC', N'Goalkeeper', '2026-06-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18719, 10, N'NUNO MIGUEL DA COSTA JOIA', '1991-02-10', N'CPV', N'Centre-Forward', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17847, 8, N'OLIVER MICHEL KEMEN', '1996-07-20', N'FRA', N'Central Midfield', '2024-01-30', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 15622, 6, N'ONUR BULUT', '1994-04-16', N'TC', N'Right-Back', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 1810160, 4, N'ONUR ERGÜN', '1992-11-15', N'TC', N'Defensive Midfield', '2023-08-25', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18698, 27, N'OUSSEYNOU BA', '1995-11-11', N'SEN', N'Centre-Back', '2024-07-15', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 791105, 42, N'ÖMER ALİ ŞAHİNER', '1992-01-02', N'TC', N'Right-Back', '2021-01-26', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17309, 20, N'UMUT GÜNEŞ', '2000-03-16', N'TC', N'Central Midfield', '2025-02-11', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 182384, 1, N'VOLKAN BABACAN', '1988-08-11', N'TC', N'Goalkeeper', '2025-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 16934, 7, N'YUSUF SARI', '1998-11-20', N'TC', N'Right Winger', '2025-01-13', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
-- İkas Eyüpspor post-winter 2025-2026 roster
        (N'İkas Eyüpspor', 19832, 25, N'ABDOU KHADRE SY', '2007-12-15', N'SEN', N'Centre-Forward', '2026-02-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19798, 10, N'ANGEL YESID TORRES QUINONES', '2000-04-09', N'COL', N'Right Winger', '2026-01-15', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 3533021, 88, N'ARDA YAVUZ', '2006-05-20', N'TC', N'Left-Back', '2025-09-01', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 1487530, 55, N'BARAN ALİ GEZEK', '2005-08-26', N'TC', N'Defensive Midfield', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2568096, 5, N'BEDİRHAN ÖZYURT', '2003-03-25', N'TC', N'Centre-Back', '2026-02-06', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2683345, 43, N'BURAK IŞIK', '2008-03-07', N'TC', N'Right-Back', '2025-09-11', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 999588, 77, N'CENGİZ UMUT MERAŞ', '1995-12-20', N'TC', N'Left-Back', '2024-08-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19782, 15, N'CHARLES ANDRE RAUX YAO', '2001-11-15', N'FRA', N'Central Midfield', '2026-01-09', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19784, 22, N'DENIS RAZVAN RADU', '2003-03-25', N'ROM', N'Right Winger', '2026-01-08', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19834, 14, N'DIABEL NDOYE', '2007-08-27', N'SEN', N'Centre-Back', '2026-02-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19077, 7, N'DORIN ROTARIU', '1995-06-29', N'ROM', N'Right Winger', '2026-02-06', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2017795, 8, N'EMRE AKBABA', '1992-10-04', N'TC', N'Attacking Midfield', '2024-07-07', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19833, 27, N'ISMAILA MANGA', '2007-05-15', N'SEN', N'Attacking Midfield', '2026-02-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2027795, 24, N'JANKAT YILMAZ', '2004-08-16', N'TC', N'Goalkeeper', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19788, 68, N'JEROME JUNIOR ONGUENE', '1997-12-22', N'FRA', N'Centre-Back', '2026-01-13', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19783, 23, N'LENNY JEAN PIERRE PINTOR', '2000-08-05', N'FRA', N'Left Winger', '2026-01-09', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19515, 2, N'LUCAS FELIPE CALEGARI', '2002-02-27', N'BRA', N'Right-Back', '2025-08-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 16606, 4, N'LUCCAS CLARO DOS SANTOS', '1991-10-02', N'BRA', N'Centre-Back', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19533, 1, N'MARCOS FELIPE DE FREITAS MONTEIRO', '1996-04-13', N'BRA', N'Goalkeeper', '2025-08-15', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19603, 20, N'MATEUSZ JACEK LEGOWSKI', '2003-01-29', N'POL', N'Defensive Midfield', '2025-09-10', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 1680635, 26, N'METEHAN ALTUNBAŞ', '2003-01-07', N'TC', N'Centre-Forward', '2025-07-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2689661, 94, N'ÖMER FARUK UĞURLU', '2006-12-22', N'TC', N'Left Winger', '2025-09-11', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 18545, 40, N'PRINCE OBENG AMPEM', '1998-04-13', N'GHA', N'Left Winger', '2023-07-19', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 1688041, 16, N'SEYFETTİN ANIL YAŞAR', '2002-07-01', N'TC', N'Centre-Back', '2026-02-05', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 17656, 17, N'TALHA ÜLVAN', '2001-04-20', N'TC', N'Right-Back', '2025-07-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 16578, 28, N'TAŞKIN İLTER', '1994-07-05', N'TC', N'Defensive Midfield', '2025-06-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 15648, 19, N'UMUT DİLAN BOZOK', '1996-09-19', N'TC', N'Centre-Forward', '2025-02-03', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 3520603, 31, N'UMUT KESECİ', '2004-02-05', N'TC', N'Goalkeeper', '2026-02-06', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
-- Kasımpaşa A.Ş. post-winter 2025-2026 roster
        (N'Kasımpaşa A.Ş.', 19579, 4, N'ADAM AROUS', '2004-07-17', N'TUN', N'Centre-Back', '2025-09-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19840, 19, N'ADRIAN DAWID BENEDYCZAK', '2000-11-24', N'POL', N'Centre-Forward', '2026-02-03', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 17765, 12, N'AHMED MORTADHA BEN OUANES', '1994-07-02', N'TUN', N'Left Winger', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 3522291, 30, N'AHMET TAHA DAĞBAŞI', '2005-04-01', N'TC', N'Centre-Back', '2026-02-06', '2030-06-30', NULL, NULL),
        (N'Kasımpaşa A.Ş.', 1847163, 25, N'ALİ EMRE YANAR', '1998-05-15', N'TC', N'Goalkeeper', '2023-07-31', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2019040, 11, N'ALİ YAVUZ KOL', '2001-01-29', N'TC', N'Left Winger', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 18586, 1, N'ANDREAS GIANNIOTIS', '1992-12-18', N'GRE', N'Goalkeeper', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19478, 16, N'ANDRI FANNAR BALDURSSON', '2002-01-10', N'ISL', N'Defensive Midfield', '2025-07-29', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2664496, 47, N'BERKAY MURATOĞLU', '2008-01-02', N'TC', N'Centre-Back', '2024-07-05', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 15302, 23, N'CENK TOSUN', '1991-06-07', N'TC', N'Centre-Forward', '2026-01-15', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 18522, 2, N'CLAUDIO WINCK NETO', '1994-04-15', N'BRA', N'Right-Back', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2631978, 42, N'EMİRHAN YİĞİT', '2006-04-30', N'TC', N'Right Winger', '2025-07-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 814191, 33, N'EMRE TAŞDEMİR', '1995-08-08', N'TC', N'Left-Back', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 1756032, 61, N'EGE ALBAYRAK', '2007-08-20', N'TC', N'Goalkeeper', '2025-09-03', '2028-06-30', NULL, NULL),
        (N'Kasımpaşa A.Ş.', 18767, 5, N'EYÜP AYDIN', '2004-08-02', N'TC', N'Defensive Midfield', '2026-02-03', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 17122, 34, N'FOUSSENI DIABATE', '1995-10-18', N'FRA', N'Right Winger', '2025-09-08', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19506, 21, N'GODFRİED AYESU OWUSU FRİMPONG', '1999-04-21', N'NED', N'Left-Back', '2025-08-06', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 802431, 71, N'İRFAN CAN KAHVECİ', '1995-07-15', N'TC', N'Attacking Midfield', '2026-01-08', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19824, 18, N'JİM EMİLLEN NGOWET ALLEVINAH', '1995-02-27', N'FRA', N'Right Winger', '2026-01-29', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 14646, 22, N'KAMİL AHMET ÇÖREKÇİ', '1992-02-01', N'TC', N'Right-Back', '2026-01-06', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 15458, 26, N'KEREM DEMİRBAY', '1993-07-03', N'GER', N'Central Midfield', '2026-01-15', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 1636101, 17, N'KUBİLAY KANATSIZKUŞ', '1997-03-28', N'TC', N'Centre-Forward', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19050, 20, N'NICHOLAS OPOKU', '1997-08-11', N'GHA', N'Centre-Back', '2024-08-16', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19487, 77, N'PAPE HABIB GUEYE', '1999-09-20', N'SEN', N'Centre-Forward', '2025-08-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19036, 8, N'RIBEIRO DIAS CARLOS MIGUEL', '1993-02-26', N'POR', N'Central Midfield', '2024-08-10', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 18546, 50, N'RODRIGO NASCIMENTO FRANCA', '1996-01-19', N'BRA', N'Centre-Back', '2026-01-15', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2672434, 98, N'ŞANT KAZANCI', '2008-12-18', N'TC', N'Goalkeeper', '2024-05-08', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2633455, 29, N'TAYLAN UTKU AYDIN', '2006-02-10', N'TC', N'Centre-Back', '2024-07-03', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 17657, 9, N'YUSUF BARASI', '2003-03-31', N'TC', N'Centre-Forward', '2025-07-11', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
-- Kocaelispor roster
        (N'Kocaelispor', 791137, 22, N'AHMET OĞUZ', '1993-01-16', N'TC', N'Right-Back', '2024-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 17852, 11, N'AHMET SAĞAT', '1996-05-27', N'TC', N'Centre-Forward', '2024-08-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19401, 1, N'ALEKSANDAR JOVANOVIC', '1992-12-06', N'SRB', N'Goalkeeper', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19474, 2, N'ANFERNEE JAMAL DIJKSTEEL', '1996-10-27', N'NED', N'Right-Back', '2025-07-28', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19591, 5, N'BOTOND BALOGH', '2002-06-06', N'HUN', N'Centre-Back', '2025-09-07', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19451, 9, N'BRUNO PETKOVIC', '1994-09-16', N'CRO', N'Centre-Forward', '2025-07-17', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 18525, 70, N'CAN KELEŞ', '2001-09-02', N'TC', N'Right Winger', '2025-08-14', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19403, 7, N'DANIEL EBENEZER KWASI AGYEI', '1997-06-01', N'GBR', N'Right Winger', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19568, 17, N'DARKO CHURLINOV', '2000-07-11', N'MAK', N'Right Winger', '2025-09-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 1162813, 18, N'FURKAN GEDİK', '2002-07-12', N'TC', N'Left Winger', '2024-08-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 434452, 35, N'GÖKHAN DEĞİRMENCİ', '1989-03-21', N'TC', N'Goalkeeper', '2022-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19616, 8, N'HABIB ALI KEITA', '2002-02-05', N'MLI', N'Central Midfield', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19577, 6, N'HRVOJE SMOLCIC', '2000-08-17', N'CRO', N'Centre-Back', '2025-09-05', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19425, 98, N'JOSEPH NONGE BOENDE', '2005-05-15', N'BEL', N'Central Midfield', '2025-07-07', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19524, 10, N'KAROL LINETTY', '1995-02-02', N'POL', N'Defensive Midfield', '2025-08-14', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19821, 20, N'MAHAMADOU SUSOHO SISSOHO', '2005-01-20', N'ESP', N'Defensive Midfield', '2026-01-31', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19406, 14, N'MANUEL LUIS DA SILVA CAFUMANA', '1999-03-06', N'ANG', N'Defensive Midfield', '2025-07-10', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19421, 21, N'MASSADIO HAIDARA', '1992-12-02', N'FRA', N'Left-Back', '2025-07-09', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 1665440, 3, N'MUHARREM CİNAN', '1998-05-13', N'TC', N'Left-Back', '2024-08-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 18716, 99, N'RIGOBERTO MANUEL RIVAS VINDEL', '1998-07-31', N'HON', N'Left Winger', '2025-02-10', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 935664, 23, N'SAMET YALÇIN', '1994-03-03', N'TC', N'Central Midfield', '2025-01-15', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 15422, 19, N'SERDAR DURSUN', '1991-10-19', N'TC', N'Centre-Forward', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 3512079, 83, N'SERHAT ÖZTAŞDELEN', '2004-12-09', N'TC', N'Goalkeeper', '2025-08-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 785192, 75, N'TAYFUR BİNGÖL', '1993-01-11', N'TC', N'Central Midfield', '2025-08-22', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
-- Mısırlı.com.tr Fatih Karagümrük roster
        (N'Mısırlı.com.tr Fatih Karagümrük', 19768, 15, N'ABDUL KADER MOUSSA KONE', '2007-12-30', N'CIV', N'Centre-Forward', '2026-01-05', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19753, 88, N'AHMED TRAORE', '2007-04-13', N'CIV', N'Right Winger', '2026-01-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2658456, 17, N'AHMET SİVRİ', '1999-07-06', N'TC', N'Left Winger', '2024-07-16', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2592624, 94, N'ANIL YİĞİT ÇINAR', '2003-07-10', N'TC', N'Centre-Back', '2024-07-16', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18366, 72, N'BARIŞ JAKOB KALAYCI', '2005-08-30', N'TC', N'Left Winger', '2024-08-30', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2567473, 6, N'BARTUĞ ELMAZ', '2003-02-19', N'TC', N'Defensive Midfield', '2026-01-23', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17352, 8, N'BERKAY ÖZCAN', '1998-02-15', N'TC', N'Central Midfield', '2025-08-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 4544526, 24, N'BURHAN ERSOY', '2003-06-13', N'TC', N'Centre-Back', '2025-09-12', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19590, 5, N'CLAUDIO MATIAS KRANEVITTER', '1993-05-21', N'ARG', N'Defensive Midfield', '2025-09-03', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2599675, 33, N'ÇAĞTAY KURUKALIP', '2002-02-24', N'TC', N'Left-Back', '2024-08-09', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19084, 11, N'DANIEL ANTHONY JOHNSON', '1992-10-08', N'GBR', N'Central Midfield', '2024-09-02', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19862, 10, N'DANIELE VERDE', '1996-06-20', N'ITA', N'Left Winger', '2026-02-06', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18027, 4, N'DAVIDE BIRASCHI', '1994-04-02', N'ITA', N'Centre-Back', '2026-01-22', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 1854021, 22, N'FATİH KURUCUK', '1998-01-21', N'TC', N'Centre-Back', '2025-07-17', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19858, 25, N'FILIP MLADENOVIC', '1991-08-15', N'SRB', N'Left-Back', '2026-02-06', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 3004110, 99, N'FURKAN BEKLEVİÇ', '1999-01-31', N'TC', N'Goalkeeper', '2023-08-04', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19853, 3, N'IGOR LICHNOVSKY OSORIO', '1994-03-07', N'CHI', N'Centre-Back', '2026-02-05', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19158, 13, N'IVO GRBIC', '1996-01-18', N'CRO', N'Goalkeeper', '2025-08-06', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2633453, 96, N'KEREM YANDAL', '2006-05-09', N'TC', N'Goalkeeper', '2024-07-16', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2714304, 32, N'MUHAMMED İYYAD KADIOĞLU', '2007-01-01', N'TC', N'Centre-Back', '2025-01-19', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19576, 47, N'RICARDO DE SOUSA ESGAIO', '1993-05-16', N'POR', N'Right-Back', '2025-09-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18157, 23, N'SAM ANDREAS LARSSON', '1993-06-10', N'SWE', N'Attacking Midfield', '2025-09-11', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17571, 70, N'SERGIO ANTONIO DA LUZ JUNIOR', '1995-06-06', N'BRA', N'Left Winger', '2025-01-29', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19823, 80, N'SHAVY WARREN BABICKA', '2000-06-01', N'GAB', N'Left Winger', '2026-01-28', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2703053, 20, N'TARIK BUĞRA KALPAKLI', '2009-04-06', N'TC', N'Right Winger', '2024-10-25', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17205, 21, N'TİAGO SÜER BARBAROS ÇUKUR', '2002-11-30', N'TC', N'Centre-Forward', '2025-07-17', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 1687963, 16, N'TUĞBEY AKGÜN', '2003-04-09', N'TC', N'Central Midfield', '2025-01-24', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19854, 19, N'YAYA ONOGO', '2007-04-19', N'CIV', N'Defensive Midfield', '2026-02-05', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
-- Samsunspor A.Ş. post-winter 2025-2026 roster
        (N'Samsunspor A.Ş.', 19526, 77, N'AFONSO GAMELAS DE PINHO SOUSA', '2000-05-03', N'POR', N'Attacking Midfield', '2025-08-15', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19752, 15, N'ALI BADRA DIABATE', '2006-12-05', N'CIV', N'Centre-Back', '2026-01-02', '2029-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19428, 29, N'ANTOINE MAKOUMBOU', '1998-07-18', N'FRA', N'Defensive Midfield', '2025-07-02', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1048832, 96, N'BEDİRHAN ÇETİN', '2006-06-29', N'TC', N'Centre-Back', '2025-06-01', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18705, 21, N'CARL JOHAN HOLSE JUSTESEN', '1999-06-02', N'DEN', N'Attacking Midfield', '2023-09-04', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 979517, 5, N'CELİL YÜKSEL', '1998-01-01', N'TC', N'Central Midfield', '2025-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 3541127, 48, N'EFE BERAT TÖRUZ', '2006-09-08', N'TC', N'Goalkeeper', '2023-09-18', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19791, 7, N'ELAYİS TAVSAN', '2001-04-30', N'TC', N'Right Winger', '2026-01-16', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1137925, 11, N'EMRE KILINÇ', '1994-08-23', N'TC', N'Left Winger', '2025-07-01', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1047860, 23, N'ENES ALBAK', '2005-05-16', N'TC', N'Left-Back', '2023-05-26', '2027-05-31', NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1061426, 73, N'EYÜP DEĞİRMENCİ', '2007-04-16', N'TC', N'Defensive Midfield', '2025-07-09', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1435208, 71, N'İRFAN CAN EĞRİBAYAT', '1998-06-30', N'TC', N'Goalkeeper', '2026-01-13', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19444, 2, N'JOSAFAT WOODING MENDES', '2002-12-31', N'SWE', N'Right-Back', '2025-07-11', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18594, 10, N'JULES OLIVIER NTCHAM', '1996-02-09', N'FRA', N'Central Midfield', '2023-08-08', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19802, 47, N'KOUADOU JAURES ASSOUMOU', '2002-10-17', N'CIV', N'Left Winger', '2026-01-21', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19426, 17, N'LOGI TOMASSON', '2000-09-13', N'ISL', N'Left-Back', '2025-07-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18505, 37, N'LUBOMİR SATKA', '1995-12-02', N'SVK', N'Centre-Back', '2023-08-04', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18504, 9, N'MARIUS MOUNDILMADJI', '1998-01-22', N'CHA', N'Centre-Forward', '2025-07-22', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1627508, 1, N'OKAN KOCUK', '1995-07-27', N'TC', N'Goalkeeper', '2025-07-14', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 17488, 19, N'PAPE CHERIF NDIAYE', '1996-01-23', N'SEN', N'Centre-Forward', '2025-09-12', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18518, 4, N'RİCK VAN DRONGELEN', '1998-12-20', N'NED', N'Centre-Back', '2025-07-03', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1716961, 28, N'SONER GÖNÜL', '1997-06-11', N'TC', N'Left-Back', '2021-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1054760, 16, N'TAHSİN BÜLBÜL', '2006-06-09', N'TC', N'Right Winger', '2025-09-01', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19572, 70, N'TANGUY BEMIN COULIBALY', '2001-02-18', N'FRA', N'Right Winger', '2025-09-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19530, 24, N'TONI BOREVKOVIC', '1997-06-18', N'CRO', N'Centre-Back', '2025-08-15', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1877063, 20, N'YALÇIN KAYAN', '1999-01-30', N'TC', N'Central Midfield', '2026-01-09', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1041978, 55, N'YUNUS EMRE ÇİFT', '2003-09-01', N'TC', N'Centre-Back', '2022-06-01', '2027-05-31', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1701095, 18, N'ZEKİ YAVRU', '1991-09-05', N'TC', N'Right-Back', '2025-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
-- Trabzonspor A.Ş. post-winter 2025-2026 roster
        (N'Trabzonspor A.Ş.', 1189984, 88, N'AHMET DOĞAN YILDIRIM', '2006-11-01', N'TC', N'Goalkeeper', '2024-08-07', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19604, 24, N'ANDRE ONANA ONANA', '1996-04-02', N'CMR', N'Goalkeeper', '2025-09-08', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 17025, 9, N'ANTHONY NNADUZOR NWAKAEME', '1989-03-21', N'NGR', N'Left Winger', '2024-07-01', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1532359, 21, N'ARDA ÖZTÜRK', '2007-03-10', N'TC', N'Centre-Back', '2025-04-17', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19016, 44, N'ARSENII BATAHOV', '2002-03-05', N'UKR', N'Centre-Back', '2024-08-06', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19581, 8, N'BENJAMIN BOUCHOUARI', '2001-11-13', N'BEL', N'Central Midfield', '2025-09-04', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1751808, 80, N'BORAN BAŞKAN', '2006-03-29', N'TC', N'Central Midfield', '2025-04-17', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19769, 27, N'CHIBUIKE GODFREY NWAIWU', '2003-07-23', N'NGR', N'Centre-Back', '2026-01-07', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19542, 42, N'CHRIST RAVYNEL INAO OULAI', '2006-04-06', N'CIV', N'Central Midfield', '2025-08-20', '2030-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 18726, 30, N'EBERE PAUL ONUACHU', '1994-05-28', N'NGR', N'Centre-Forward', '2025-07-02', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 18902, 10, N'ERNEST MUÇİ', '2001-03-19', N'ALB', N'Attacking Midfield', '2025-09-06', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 2648624, 91, N'ESAT YİĞİT ALKURT', '2007-02-22', N'TC', N'Right Winger', '2025-05-23', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1749340, 96, N'EROL CAN ÇOLAK', '2006-01-02', N'TC', N'Goalkeeper', '2025-05-23', '2028-06-30', NULL, NULL),
        (N'Trabzonspor A.Ş.', 19445, 99, N'FELIPE AUGUSTO DA SILVA', '2004-02-18', N'BRA', N'Centre-Forward', '2025-07-12', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19801, 14, N'MATHIAS JOHAN FJORTOFT LOVIK', '2003-12-06', N'NOR', N'Left-Back', '2026-01-20', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 997605, 18, N'MEHMET UMUT NAYİR', '1993-06-28', N'TC', N'Centre-Forward', '2026-01-29', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1716198, 19, N'MUSTAFA ESKİHELLAÇ', '1997-05-05', N'TC', N'Left-Back', '2025-02-07', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1820481, 5, N'OKAY YOKUŞLU', '1994-03-09', N'TC', N'Defensive Midfield', '2024-07-31', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19329, 22, N'OLEKSANDR ZUBKOV', '1996-08-03', N'UKR', N'Right Winger', '2025-02-03', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1755939, 17, N'ONURALP ÇAKIROĞLU', '2007-12-05', N'TC', N'Right Winger', '2025-04-17', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 3538291, 25, N'ONURALP ÇEVİKKAN', '2006-01-02', N'TC', N'Goalkeeper', '2023-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1621253, 11, N'OZAN TUFAN', '1995-03-23', N'TC', N'Central Midfield', '2024-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1748288, 74, N'SALİH MALKOÇOĞLU', '2005-02-23', N'TC', N'Central Midfield', '2023-07-03', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 18981, 15, N'STEFAN SAVIC', '1991-01-08', N'MNE', N'Centre-Back', '2024-07-26', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1755930, 92, N'TAHA EMRE İNCE', '2007-07-26', N'TC', N'Centre-Back', '2025-04-17', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19361, 26, N'TIM LUCA PACO JABOL - FOLCARELLI', '1999-12-06', N'FRA', N'Central Midfield', '2025-02-11', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19402, 20, N'WAGNER FABRICIO CARDOSO DE PINA', '2002-11-03', N'POR', N'Right-Back', '2025-07-01', '2029-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
-- Tümosan Konyaspor post-winter 2025-2026 roster
        (N'Tümosan Konyaspor', 19826, 39, N'ADAMO NAGALO', '2002-09-22', N'CIV', N'Centre-Back', '2026-01-30', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1905970, 4, N'ADİL DEMİRBAĞ', '1997-12-10', N'TC', N'Centre-Back', '2025-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1741833, 24, N'ARİF BOŞLUK', '2003-06-06', N'TC', N'Left-Back', '2026-01-02', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1030507, 13, N'BAHADIR HAN GÜNGÖRDÜ', '1996-01-16', N'TC', N'Goalkeeper', '2025-01-16', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=2292522&pageId=30.
        (N'Tümosan Konyaspor', 17492, 18, N'BERKAN İSMAİL KUTLU', '1998-01-25', N'TC', N'Central Midfield', '2026-01-05', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19177, 99, N'BLAZ KRAMER', '1996-06-01', N'SLO', N'Centre-Forward', '2024-09-12', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 3525618, 1, N'DENİZ ERTAŞ', '2005-03-20', N'TC', N'Goalkeeper', '2024-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 16212, 9, N'DENİZ TÜRÜÇ', '1993-01-29', N'TC', N'Right Winger', '2026-01-02', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19851, 17, N'DIOGO ANTONIO CUPIDO GONÇALVES', '1997-02-06', N'POR', N'Attacking Midfield', '2026-02-05', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 4019447, 29, N'EGEMEN AYDIN', '2007-05-12', N'TC', N'Goalkeeper', '2025-01-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 18231, 10, N'ENIS BARDHI', '1995-07-02', N'MAK', N'Attacking Midfield', '2025-07-14', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 17417, 12, N'GUILHERME HAUBERT SITYA', '1990-04-01', N'POR', N'Left-Back', '2024-06-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 3047299, 30, N'İSMAİL ESAT BUĞA', '2006-08-08', N'TC', N'Central Midfield', '2025-10-01', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 18070, 40, N'JACKSON KYANVUBU MULEKA', '1999-10-05', N'CGO', N'Centre-Forward', '2025-08-20', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 2728934, 21, N'JINHO JO', '2003-07-10', N'PRK', N'Defensive Midfield', '2025-07-17', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1136941, 3, N'KARAHAN YASİR SUBAŞI', '1996-01-01', N'TC', N'Left-Back', '2025-07-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19504, 70, N'KAZEEM ADEREMI J. OLAIGBE', '2003-01-02', N'BEL', N'Left Winger', '2026-02-04', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19484, 11, N'MARIUS STEFANESCU', '1998-08-14', N'ROM', N'Right Winger', '2025-07-29', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 16986, 16, N'MARKO JEVTOVIC', '1993-07-24', N'SRB', N'Defensive Midfield', '2024-07-18', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 17652, 77, N'MELİH İBRAHİMOĞLU', '2000-07-17', N'TC', N'Central Midfield', '2024-07-23', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19363, 42, N'MORTEN BJORLO', '1995-10-03', N'NOR', N'Central Midfield', '2025-02-11', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 18974, 7, N'MUHAMMET TUNAHAN TAŞCI', '2002-04-29', N'TC', N'Right Winger', '2024-07-24', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 17780, 22, N'RAYYAN BANİYA', '1999-02-18', N'TC', N'Centre-Back', '2026-02-04', '2030-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19169, 20, N'RIECHEDLY GUILLERMO BAZOER', '1996-10-12', N'NED', N'Centre-Back', '2024-09-11', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19756, 32, N'SANDER SVENDSEN', '1997-08-06', N'NOR', N'Left Winger', '2026-01-02', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 16582, 19, N'UFUK AKYOL', '1997-08-27', N'TC', N'Defensive Midfield', '2024-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1508782, 5, N'UĞURCAN YAZĞILI', '1999-04-09', N'TC', N'Centre-Back', '2022-01-28', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19438, 23, N'YHOAN MANY ANDZOUANA', '1996-12-13', N'FRA', N'Right-Back', '2025-07-09', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
-- Zecorner Kayserispor roster
        (N'Zecorner Kayserispor', 17848, 25, N'BİLAL BAYAZIT', '1999-04-08', N'TC', N'Goalkeeper', '2024-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1674857, 17, N'BURAK KAPACAK', '1999-12-08', N'TC', N'Right Winger', '2025-07-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17867, 20, N'CARLOS MANUEL CARDOSO MANE', '1994-03-11', N'POR', N'Right Winger', '2024-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19819, 18, N'DENIS MAKAROV', '1998-02-18', N'RUS', N'Right Winger', '2026-01-26', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 4516275, 27, N'DENİZ EREN DÖNMEZER', '2008-09-21', N'TC', N'Goalkeeper', '2025-09-12', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1650151, 24, N'DORUKHAN TOKÖZ', '1996-05-21', N'TC', N'Defensive Midfield', '2025-07-20', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19847, 63, N'FEDOR CHALOV', '1998-04-10', N'RUS', N'Centre-Forward', '2026-02-04', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 815947, 33, N'FURKAN SOYALP', '1995-06-12', N'TC', N'Central Midfield', '2025-09-08', '2026-06-26', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19630, 9, N'GERMAN ONUGKHA', '1996-07-06', N'RUS', N'Centre-Forward', '2025-09-12', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 18294, 61, N'GÖRKEM SAĞLAM', '1998-04-11', N'TC', N'Central Midfield', '2026-01-16', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19498, 22, N'INDRIT TUCI', '2000-09-14', N'ALB', N'Centre-Forward', '2025-08-08', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19792, 2, N'JADEL CHANDA KATONGO', '2004-09-14', N'GBR', N'Centre-Back', '2026-01-16', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19495, 10, N'JOAO SABINO MENDES NETO SARAIVA', '1994-10-21', N'POR', N'Attacking Midfield', '2025-08-08', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19867, 30, N'JOSHUA BENJAMIN BRENET', '1994-03-20', N'NED', N'Right-Back', '2026-02-06', '2027-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1267432, 38, N'KAYRA CİHAN', '2007-09-30', N'TC', N'Centre-Back', '2025-07-04', '2028-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19535, 8, N'LASZLO BENES', '1997-09-09', N'SVK', N'Central Midfield', '2025-08-16', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 16191, 23, N'LIONEL JULES CAROLE', '1994-03-11', N'FRA', N'Left-Back', '2025-07-01', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1248453, 16, N'MEHMET ERAY ÖZBEK', '2003-01-09', N'TC', N'Attacking Midfield', '2022-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17845, 7, N'MIGUEL FILIPE NUNES CARDOSO', '1994-06-19', N'POR', N'Left Winger', '2024-06-01', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1245621, 77, N'NURETTİN KORKMAZ', '2002-06-27', N'TC', N'Left Winger', '2025-07-07', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1710422, 1, N'ONURCAN PİRİ', '1994-09-28', N'TC', N'Goalkeeper', '2023-09-15', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 953111, 28, N'RAMAZAN CİVELEK', '1996-01-22', N'TC', N'Right-Back', '2021-01-20', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19793, 11, N'SAMUEL JAMES MATHER', '2004-09-03', N'GBR', N'Left Winger', '2026-01-16', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 16052, 6, N'SEMİH GÜLER', '1994-11-30', N'TC', N'Centre-Back', '2026-01-16', '2028-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17899, 4, N'STEFANO WILFRED DENSWIL', '1993-05-07', N'NED', N'Centre-Back', '2025-08-08', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1248888, 99, N'TALHA SARIARSLAN', '2004-01-18', N'TC', N'Centre-Forward', '2024-06-01', '2026-05-31', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 3508914, 21, N'YİĞİT EMRE ÇELTİK', '2003-04-07', N'TC', N'Central Midfield', '2023-09-15', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17967, 15, N'YOUSSEF AIT BENASSER', '1996-07-07', N'FRA', N'Defensive Midfield', '2025-09-05', '2027-06-30', N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf')
IF (SELECT COUNT(*) FROM @RosterInput) <> 493
    THROW 50009, 'Expected 493 curated roster registrations.', 1;

IF (SELECT COUNT(DISTINCT tff_license_no) FROM @RosterInput) <> 493
    THROW 50010, 'Expected 493 distinct TFF player licenses.', 1;

IF (SELECT COUNT(DISTINCT club_name) FROM @RosterInput) <> 18
    THROW 50011, 'Expected roster records for 18 clubs.', 1;

IF EXISTS (
    SELECT 1
    FROM @RosterInput
    WHERE birth_date IS NULL
        OR nationality IS NULL
        OR [position] IS NULL
)
BEGIN
    SELECT
        club_name,
        tff_license_no,
        shirt_no,
        player_name,
        birth_date,
        nationality,
        [position],
        contract_start_date,
        contract_end_date,
        first_window_source_url,
        second_window_source_url
    FROM @RosterInput
    WHERE birth_date IS NULL
        OR nationality IS NULL
        OR [position] IS NULL
    ORDER BY club_name, player_name;

    THROW 50012, 'Complete the required source-backed player profile values before running this seed.', 1;
END;

IF EXISTS (
    SELECT 1
    FROM @RosterInput
    WHERE (contract_start_date IS NULL AND contract_end_date IS NOT NULL)
        OR (contract_start_date IS NOT NULL AND contract_end_date IS NULL)
        OR (contract_start_date IS NOT NULL AND contract_end_date IS NOT NULL
            AND (contract_end_date < contract_start_date
                OR contract_start_date > '2026-06-30'
                OR contract_end_date < '2025-07-01'))
)
BEGIN
    SELECT
        club_name,
        tff_license_no,
        player_name,
        contract_start_date,
        contract_end_date
    FROM @RosterInput
    WHERE (contract_start_date IS NULL AND contract_end_date IS NOT NULL)
        OR (contract_start_date IS NOT NULL AND contract_end_date IS NULL)
        OR (contract_start_date IS NOT NULL AND contract_end_date IS NOT NULL
            AND (contract_end_date < contract_start_date
                OR contract_start_date > '2026-06-30'
                OR contract_end_date < '2025-07-01'));

    THROW 50016, 'Contract dates must be complete, ordered, and overlap the 2025-2026 season.', 1;
END;

IF EXISTS (
    SELECT 1
    FROM @RosterInput
    GROUP BY tff_license_no
    HAVING MIN(player_name) <> MAX(player_name)
        OR MIN(birth_date) <> MAX(birth_date)
        OR MIN(nationality) <> MAX(nationality)
        OR MIN([position]) <> MAX([position])
)
    THROW 50013, 'Repeated TFF licenses must use consistent person values.', 1;

IF EXISTS (
    SELECT 1
    FROM @RosterInput AS input
    LEFT JOIN dbo.club AS club
        ON club.name = input.club_name
    WHERE club.club_id IS NULL
)
    THROW 50014, 'Load the 2025-2026 club reference data before player data.', 1;

IF EXISTS (SELECT 1 FROM dbo.person)
    OR EXISTS (SELECT 1 FROM dbo.player)
    OR EXISTS (SELECT 1 FROM dbo.[contract])
    THROW 50015, 'Person, player, and contract tables must be empty before this one-time seed.', 1;

DECLARE @PersonMap TABLE (
    tff_license_no BIGINT NOT NULL PRIMARY KEY,
    person_id INT NOT NULL
);

BEGIN TRY
    BEGIN TRANSACTION;

    MERGE dbo.person AS target
    USING (
        SELECT
            source.tff_license_no,
            source.player_name,
            source.birth_date,
            source.nationality
        FROM @RosterInput AS source
        WHERE source.row_id = (
            SELECT MIN(first_row.row_id)
            FROM @RosterInput AS first_row
            WHERE first_row.tff_license_no = source.tff_license_no
        )
    ) AS source
    ON 1 = 0
    WHEN NOT MATCHED THEN
        INSERT (name, birth_date, nationality)
        VALUES (source.player_name, source.birth_date, source.nationality)
    OUTPUT source.tff_license_no, inserted.person_id
        INTO @PersonMap (tff_license_no, person_id);

    INSERT INTO dbo.player (person_id, [position])
    SELECT
        person_map.person_id,
        MAX(roster.[position])
    FROM @RosterInput AS roster
    INNER JOIN @PersonMap AS person_map
        ON person_map.tff_license_no = roster.tff_license_no
    GROUP BY person_map.person_id;

    INSERT INTO dbo.[contract] (player_id, club_id, start_date, end_date)
    SELECT
        person_map.person_id,
        club.club_id,
        roster.contract_start_date,
        roster.contract_end_date
    FROM @RosterInput AS roster
    INNER JOIN @PersonMap AS person_map
        ON person_map.tff_license_no = roster.tff_license_no
    INNER JOIN dbo.club AS club
        ON club.name = roster.club_name
    WHERE roster.contract_start_date IS NOT NULL
        AND roster.contract_end_date IS NOT NULL;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;

SELECT
    COUNT(*) AS roster_registrations,
    COUNT(DISTINCT tff_license_no) AS unique_players,
    COUNT(DISTINCT club_name) AS clubs
FROM @RosterInput;

