-- Source: TFF first-window A-team lists published on 2025-09-19.
-- Source: TFF second-window A-team lists published on 2026-02-13.
-- Complete verified player facts and contract dates before running this seed.
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
        (N'Beşiktaş A.Ş.', 1753702, 80, N'AHMET SAMİ BİRCAN', NULL, NULL, N'Centre-Forward', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19860, 12, N'BADOBRE EMMANUEL ELYSEE DJEDJE AGBADOU', NULL, NULL, N'Centre-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1847932, 11, N'CENGİZ ÜNDER', NULL, NULL, N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19863, 32, N'DEVIS ESTIVEN VASQUEZ LLACH', NULL, NULL, N'Goalkeeper', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2651181, 52, N'DEVRİM ŞAHİN', NULL, NULL, N'Left Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19555, 19, N'EL BILAL TOURE', NULL, NULL, N'Centre-Forward', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1735476, 53, N'EMİRHAN TOPÇU', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2581208, 99, N'EMRE BİLGİN', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2557140, 30, N'ERSİN DESTANOĞLU', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19063, 14, N'FELIX OHIS UDUOKHAI', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 959235, 25, N'GÖKHAN SAZDAĞI', NULL, NULL, N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19841, 9, N'HYEONGYU OH', NULL, NULL, N'Centre-Forward', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19481, 15, N'ISHOLA JUNIOR OLAITAN', NULL, NULL, N'Central Midfield', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19618, 26, N'JOAO PEDRO FERREIRA DA SILVA', NULL, NULL, N'Left Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1157750, 17, N'KARTAL KAYRA YILMAZ', NULL, NULL, N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19825, 23, N'KRİSTJAN ASLLANİ', NULL, NULL, N'Defensive Midfield', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19861, 62, N'MICHAEL AMIR MURILLO BERMUDEZ', NULL, NULL, N'Right-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 18318, 7, N'MILOT RASHICA', NULL, NULL, N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2651662, 91, N'MUSTAFA ERHAN HEKİMOĞLU', NULL, NULL, N'Centre-Forward', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 893977, 20, N'NECİP UYSAL', NULL, NULL, N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19508, 4, N'ONYINYE WILFRED NDIDI', NULL, NULL, N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 17359, 10, N'ORKUN KÖKÇÜ', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 2568369, 33, N'RIDVAN YILMAZ', NULL, NULL, N'Left-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1817537, 8, N'SALİH UÇAN', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19536, 22, N'TAYLAN BULUT', NULL, NULL, N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19556, 35, N'TIAGO EMANUEL EMBALO DJALO', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 19575, 18, N'VACLAV CERNY', NULL, NULL, N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/768b84e41bc34610973e6cd949a06319.pdf', N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
        (N'Beşiktaş A.Ş.', 1254261, 58, N'YASİN ÖZCAN', NULL, NULL, N'Centre-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/a3ee5188b7bb441bbeff5185d63a4666.pdf'),
-- Corendon Alanyaspor post-winter 2025-2026 roster
        (N'Corendon Alanyaspor', 18890, 58, N'ANTONIO SIMAO MUANZA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19244, 18, N'BARAN MOĞULTAY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19342, 2, N'BATUHAN YAVUZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19032, 30, N'BRUNO VIANA WILLEMEM DA SILVA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 1686349, 25, N'BULUTHAN BULUT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 3576560, 98, N'CİHAN MEMİK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 897833, 7, N'EFECAN KARACA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2571762, 8, N'ENES KESKİN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 995034, 20, N'FATİH AKSOY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18560, 5, N'FIDAN ALITI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 17440, 94, N'FLORENT HADERGJONAJ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18978, 42, N'GAİUS ABRAHAM JERED MAKOUTA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 16301, 10, N'GÜVEN YALÇIN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 4042435, 35, N'HÜSEYİN ŞEN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19589, 14, N'IANIS HAGI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2562284, 27, N'İBRAHİM KAYA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 1482760, 6, N'İZZET ÇELİK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 908371, 1, N'MAHMUT ERTUĞRUL TAŞKIRAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19609, 12, N'MESCHACK ELIA LINA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18530, 17, N'NICOLAS JEAN PAUL NOEL JANVIER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18753, 3, N'NUNO MIGUEL REIS LIMA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 16653, 48, N'PAULO VICTOR MILEO VIDOTTI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19611, 11, N'RUAN PEREIRA DUARTE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 19608, 9, N'STEVE MICHEL KEVİN MOUNIE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 18876, 16, N'UI JO HWANG', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2050527, 50, N'ÜMİT AKDAĞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2044429, 38, N'YUSUF CAN KARADEMİR', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
        (N'Corendon Alanyaspor', 2576122, 88, N'YUSUF ÖZDEMİR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/124bec23bb564c8ea9c8a6994948d345.pdf', N'https://www.tff.org/Resources/TFF/Auto/b1151d06dc904628a351242b2473bc21.pdf'),
-- Çaykur Rizespor A.Ş. post-winter 2025-2026 roster
        (N'Çaykur Rizespor A.Ş.', 19795, 17, N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18165, 9, N'ALI SOWE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18613, 77, N'ALTIN ZEQIRI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18687, 4, N'ATTILA MOCSI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1758329, 90, N'BAYRAM BERK ÇAPOĞLU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18724, 5, N'CASPER SOMMER HOJER', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 3524733, 35, N'EFE DOĞAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1759839, 22, N'EMİR BORA ÇOBAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 3035025, 65, N'EMİR ORTAKAYA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 3529695, 99, N'EMRECAN BULUT', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 17596, 1, N'ERDEM CANPOLAT', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19868, 19, N'FRANTZDY PIERROT', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1694906, 70, N'FURKAN ORAK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 16933, 11, N'HALİL İBRAHİM DERVİŞOĞLU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18952, 6, N'IOANNIS PAPANIKOLAOU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18585, 2, N'KHUSNIDDIN ALIKULOV', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18528, 50, N'LOIDE ANTONIO AUGUSTO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19464, 7, N'MIHAI-VALENTIN MIHAILA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1163095, 54, N'MİTHAT PALA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19499, 27, N'MODIBO SAGNAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 18988, 18, N'MUHAMED BULJUBASIC', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 2549379, 37, N'MUHAMMET TAHA ŞAHİN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 17885, 10, N'OLASUNKANMI IBRAHIM OLAWOYIN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19465, 20, N'QAZIM LACI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1709152, 3, N'SAMET AKAYDİN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1833146, 14, N'TAYLAN ANTALYALI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 19573, 75, N'YAHIA FOFANA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
        (N'Çaykur Rizespor A.Ş.', 1765575, 94, N'YAKUP AYAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8239628807c34b8297421b73e07a4824.pdf'),
-- Fenerbahçe A.Ş. post-winter 2025-2026 roster
        (N'Fenerbahçe A.Ş.', 1199084, 54, N'ALAETTİN EKİCİ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 16546, 94, N'ANDERSON SOUZA CONCEIÇAO', NULL, NULL, N'Attacking Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19446, 20, N'ANTHONY TİTE EMMANUEL MUSABA', NULL, NULL, N'Left Winger', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19447, 3, N'ARCHIBALD NORMAN BROWN', NULL, NULL, N'Left-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1831018, 4, N'ÇAĞLAR SÖYÜNCÜ', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19541, 45, N'DORGELES NENE', NULL, NULL, N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19570, 31, N'EDERSON SANTANA DE MORAES', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19553, 11, N'EDSON OMAR ALVAREZ VELAZQUEZ', NULL, NULL, N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 2664885, 39, N'ENGİN CAN BİTERGE', '2007-01-22', N'TC', N'Goalkeeper', '2025-07-14', '2028-06-30', NULL, NULL),
        (N'Fenerbahçe A.Ş.', 1105390, 34, N'FEHMİ MERT GÜNOK', NULL, NULL, N'Goalkeeper', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 18636, 7, N'FREDERICO RODRIGUES DE PAULA SANTOS', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1668300, 5, N'İSMAİL YÜKSEK', NULL, NULL, N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 18422, 24, N'JAYDEN QUINN OOSTERWOLDE', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 4518741, 67, N'KAMİL EFE ÜREGEN', NULL, NULL, N'Centre-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19569, 21, N'MARCO ASENSIO WILLEMSEN', NULL, NULL, N'Attacking Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19773, 6, N'MATTEO ELIAS KENZO GUENDOUZI OLIE', NULL, NULL, N'Central Midfield', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1627312, 8, N'MERT HAKAN YANDAŞ', NULL, NULL, N'Attacking Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 18578, 18, N'MERT MÜLDÜR', NULL, NULL, N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19321, 37, N'MILAN SKRINIAR', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1154810, 9, N'MUHAMMED KEREM AKTÜRKOĞLU', NULL, NULL, N'Left Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 17894, 22, N'MÜNİR LEVENT MERCAN', NULL, NULL, N'Left-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19838, 17, N'N''GOLO KANTE', NULL, NULL, N'Defensive Midfield', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19485, 27, N'NELSON CABRAL SEMEDO', NULL, NULL, N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 3538921, 70, N'OĞUZ AYDIN', NULL, NULL, N'Left Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 19831, 26, N'SIDIKI CHERIF', NULL, NULL, N'Centre-Forward', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 1139318, 13, N'TARIK ÇETİN', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
        (N'Fenerbahçe A.Ş.', 2581224, 14, N'YİĞİT EFE DEMİR', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/720a3e1ff14f42fd8863d2880d21f967.pdf', N'https://www.tff.org/Resources/TFF/Auto/2726d73512824ff9aef2f79bdd84a981.pdf'),
-- Source: TFF records and owner-provided 25/26 squad screenshots.
-- Galatasaray A.Ş. post-winter 2025-2026 roster
        (N'Galatasaray A.Ş.', 3066313, 91, N'ARDA ÜNYAY', NULL, NULL, N'Centre-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 815227, 42, N'ABDÜLKERİM BARDAKCI', '1994-09-07', N'TC', N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 16880, 21, N'AHMED KUTUCU', '2000-03-01', N'TC', N'Left Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 1732358, 53, N'BARIŞ ALPER YILMAZ', '2000-05-23', N'TC', N'Left Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 2533607, 12, N'BATUHAN AHMET ŞEN', '1999-09-03', N'TC', N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=2292522&pageId=30.
        (N'Galatasaray A.Ş.', 19857, 27, N'CAN ARMANDO GÜNER', '2008-12-07', N'ARG', N'Right Winger', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18707, 6, N'DAVINSON SANCHEZ MINA', '1996-07-12', N'COL', N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1911614&pageId=30.
        (N'Galatasaray A.Ş.', 2639006, 70, N'ENES EMRE BÜYÜK', '2006-05-08', N'TC', N'Goalkeeper', '2025-07-17', '2027-06-30', NULL, NULL),
        (N'Galatasaray A.Ş.', 2543505, 17, N'EVREN EREN ELMALI', '2000-05-07', N'TC', N'Left-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19006, 8, N'GABRIEL DAVI GOMES SARA', '1999-06-26', N'BRA', N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18361, 33, N'GÖKDENİZ GÜRPÜZ', '2006-02-25', N'TC', N'Attacking Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 15726, 19, N'GÜNAY GÜVENÇ', '1991-01-25', N'TC', N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19082, 4, N'ISMAIL JOSHUA JAKOBS', '1999-08-17', N'SEN', N'Left-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 15198, 20, N'İLKAY GÜNDOĞAN', '1990-10-24', N'GER', N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 15027, 23, N'KAAN AYHAN', NULL, NULL, N'Centre-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1790244&pageId=30.
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1564936&pageId=30.
        (N'Galatasaray A.Ş.', 19420, 10, N'LEROY AZIZ SANE', '1996-01-11', N'GER', N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18215, 34, N'LUCAS SEBASTIAN TORREIRA DI PASCUA', '1996-06-11', N'URY', N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 17353, 99, N'MARIO RENE JUNIOR LEMINA', '1993-09-01', N'GAB', N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 18314, 9, N'MAURO EMANUEL ICARDI', '1993-02-19', N'ARG', N'Centre-Forward', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 2561466, 3, N'METEHAN BALTACI', '2002-11-03', N'TC', N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Source: TFF profile https://www.tff.org/Default.aspx?kisiId=2501727&pageId=30; screenshot confirms loan-out.
        (N'Galatasaray A.Ş.', 19812, 77, N'NOA NOËLL LANG', '1999-12-17', N'NED', N'Left Winger', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19848, 74, N'RENATO SAM-NA NHAGA', '2007-03-27', N'GNB', N'Central Midfield', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19192, 7, N'ROLAND SALLAI', '1997-05-22', N'HUN', N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 17776, 93, N'SACHA BOEY', '2000-09-13', N'FRA', N'Right-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 991785, 1, N'UĞURCAN ÇAKIR', '1996-04-05', N'TC', N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19101, 45, N'VICTOR JAMES OSIMHEN', '1998-12-29', N'NGA', N'Centre-Forward', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19565, 90, N'WILFRIED STEPHANE SINGO', '2000-12-25', N'CIV', N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 19816, 22, N'YASER ESNEYDER ASPRILLA MARTINEZ', '2003-11-19', N'COL', N'Right Winger', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
        (N'Galatasaray A.Ş.', 2542908, 11, N'YUNUS AKGÜN', '2000-07-07', N'TC', N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/00eb8e951d9d42cfb5fa627826ca311e.pdf', N'https://www.tff.org/Resources/TFF/Auto/6fe2cb3e6b6f4a95a38512727c0e3d99.pdf'),
-- Gaziantep Futbol Kulübü A.Ş. roster
        (N'Gaziantep Futbol Kulübü A.Ş.', 17427, 44, N'ALEXANDRU IULIAN MAXIM', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1494070, 16, N'ALİ MEVRAN ABLAK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1943333, 26, N'ALİ OSMAN KALIN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 821324, 4, N'ARDA KIZILDAĞ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 4525508, 81, N'CEMİLHAN ASLAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19133, 11, N'CHRISTOPHER LUNGOYI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18838, 18, N'DEIAN CRISTIAN SORESCU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18745, 70, N'DENIS MIHAI DRAGUS', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19583, 3, N'DRISSA CAMARA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18969, 10, N'KACPER SZYMON KOZLOWSKI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19778, 17, N'KARAMBA GASSAMA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18137, 77, N'KEVIN MANUEL RODRIGUES', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19427, 14, N'LEO MYENTY JANNA ABENA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19544, 2, N'LUIS JESUS PEREZ MAQUEDA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 4524332, 88, N'MEHMET SAMET KALKAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1024433, 6, N'MELİH KABASAKAL', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19585, 9, N'MOHAMED LAMINE BAYO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 4545949, 85, N'MUHAMMET AKMELEK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1469308, 71, N'MUSTAFA BURAK BOZAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 16856, 30, N'NAZIM SANGARE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18199, 5, N'NIHAD MUJAKIC', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 1733617, 61, N'OGÜN ÖZÇİÇEK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 18609, 22, N'SALEM M''BAKATA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 841983, 23, N'TAYYİP TALHA SANUÇ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 19765, 8, N'VICTOR NTINO-EMO GIDADO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 17202, 32, N'YUSUF KARHAN KABADAYI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
        (N'Gaziantep Futbol Kulübü A.Ş.', 3501109, 20, N'ZAFER GÖRGEN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1ab9f534a1f1432dae6a723a0d99eeb7.pdf'),
-- Gençlerbirliği roster
        (N'Gençlerbirliği', 235431, 77, N'ABDURRAHİM DURSUN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19534, 20, N'ADAMA TRAORE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3055675, 44, N'ARDA ÇAĞAN ÇELİK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19634, 15, N'AYOTOMIWA SHERIF DELE BASHIRU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18774, 99, N'CİHAN ÇANAK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18621, 53, N'DAL VARESANOVIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 17774, 6, N'DIMITRIOS GOUTAS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19505, 21, N'DİLHAN DEMİR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', NULL),
        (N'Gençlerbirliği', 1668491, 33, N'EBRAR YİĞİT AYDIN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19138, 27, N'EMİRHAN ÜNAL', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 2600611, 61, N'ENSAR KEMALOĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1853012, 18, N'ERHAN ERENTÜRK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1662364, 88, N'FIRATCAN ÜZÜM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19584, 70, N'FRANCO DARYL TONGYA HEUBANG', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3072107, 16, N'FURKAN AYAZ ÖZCAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 802684, 1, N'GÖKHAN AKKAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', NULL),
        (N'Gençlerbirliği', 17147, 11, N'GÖKTAN GÜRPÜZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 16956, 7, N'HENRY CHUKWUEMEKA ONYEKURU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19620, 17, N'KEVIN CSOBOTH', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', NULL),
        (N'Gençlerbirliği', 19640, 24, N'MARIO RICARDO DA SILVA VELHO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18176, 23, N'MATEJ HANOUSEK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18607, 29, N'MBAYE HAMADY NIANG', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 947992, 10, N'METEHAN MİMAROĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 1847884, 35, N'OĞULCAN ÜLGÜN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3140109, 42, N'OUSMANE DIABATE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 18255, 13, N'PEDRO MIGUEL DE ALMEIDA LOPES PEREIRA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19531, 0, N'PRINCE MARTOR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', NULL),
        (N'Gençlerbirliği', 17184, 8, N'SAMED ONUR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19543, 22, N'SEKOU KOITA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 909361, 90, N'SİNAN OSMANOĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', NULL),
        (N'Gençlerbirliği', 18998, 2, N'THALISSON KELVEN DA SILVA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 3055959, 25, N'UMUT İSLAMOĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', NULL),
        (N'Gençlerbirliği', 3057184, 93, N'YİĞİT HAMZA AYDAR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
        (N'Gençlerbirliği', 19029, 4, N'ZAN ZUZEK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/64f221f3cdc443b683005c2081e7c8cb.pdf', N'https://www.tff.org/Resources/TFF/Auto/41bf688907f44e058baf55e172f87592.pdf'),
-- Göztepe A.Ş. post-winter 2025-2026 roster
        (N'Göztepe A.Ş.', 19762, 8, N'ALEXIS ANTUNES GOMEZ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19461, 3, N'ALLAN GODOI SANTOS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 18416, 30, N'ANTHONY JUNIOR DENNIS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 2588565, 2, N'ARDA OKAN KURTULAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 17489, 11, N'EFKAN BEKİROĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 3544105, 45, N'EGE YILDIRIM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1640973, 17, N'EKREM KILIÇARSLAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19850, 10, N'FILIP YAVOROV KRASTEV', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1887994, 23, N'FURKAN BAYIR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19764, 14, N'GUILERME LUIZ OLIVEIRA DA SILVA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 18821, 5, N'HELITON JORGE TITO DOS SANTOS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1416732, 12, N'İSMAİL KÖYBAŞI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19454, 39, N'JANDERSON DE CARVALHO COSTA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19796, 19, N'JEFERSON MARINHO DOS SANTOS', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19048, 9, N'JUAN SANTOS DA SILVA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19045, 26, N'MALCOM NARCISSE BOKELE MPUTU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 17861, 1, N'MATEUSZ LIS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1262946, 33, N'MEHMET ŞAMİL ÖZTÜRK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 19479, 15, N'MOHAMMED AMIN CHERNI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 17718, 6, N'MUSAH MOHAMMED', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 4526270, 21, N'NEVZAT TAN ÜZEL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', NULL),
        (N'Göztepe A.Ş.', 18979, 20, N'NOVATUS DISMAS MIROSHI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1656504, 77, N'OGÜN BAYRAK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 1688340, 4, N'TAHA ALTIKARDEŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
        (N'Göztepe A.Ş.', 2563899, 22, N'UĞUR KAAN YILDIZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/eabe7e0997e9466fa793dbe69023df49.pdf', N'https://www.tff.org/Resources/TFF/Auto/5b904d42573743508be9f15320280ce4.pdf'),
-- Hesap.com Antalyaspor roster
        (N'Hesap.com Antalyaspor', 1517676, 21, N'ABDULLAH YİĞİTER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 1731006, 10, N'ABDÜLKADİR ÖMÜR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 18656, 22, N'ALEXANDER GERARD VAN DE STREEK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2021055, 5, N'BAHADIR ÖZTÜRK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2014032, 7, N'BÜNYAMİN BALCI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 18689, 88, N'DARIO SARIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2003142, 70, N'DOĞUKAN SİNİK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 1756405, 99, N'ENGİN POYRAZ EFE YILDIRIM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', NULL),
        (N'Hesap.com Antalyaspor', 15995, 17, N'ERDOĞAN YEŞİLYURT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19514, 14, N'GEORGII DZHIKIIA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 1716713, 4, N'HÜSEYİN TÜRKMEN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19189, 0, N'ISMAIL TAIEB CHEHAIMA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19525, 23, N'JESPER ISMAILA CEESAY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19558, 1, N'JULIAN CUESTA DIAZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2032387, 96, N'KAĞAN ARICAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19482, 3, N'KENNETH IMMANUEL PAAL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2630092, 90, N'KEREM KAYAARASI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19522, 30, N'LAUTARO DANIEL GIANNETTI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 1663972, 16, N'MEHMET ATABERK DADAKDENİZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', NULL),
        (N'Hesap.com Antalyaspor', 19633, 24, N'MOUHAMED EL BACHIR GUEYE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19501, 26, N'NIKOLA STORM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 18761, 8, N'RAMZI SAFURI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 2559200, 2, N'SAMET KARAKOÇ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19629, 11, N'SAMUEL LEO BEAT BALLET', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 802632, 6, N'SONER DİKMEN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19483, 9, N'TOMAS CVANCARA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', NULL),
        (N'Hesap.com Antalyaspor', 873639, 89, N'VEYSEL SARI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
        (N'Hesap.com Antalyaspor', 19602, 77, N'YOHAN ALEXANDRE MADY BOLI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cdc23a185b064354a6ec6eb7eef8adfb.pdf', N'https://www.tff.org/Resources/TFF/Auto/5adb398cd2c1440ba88cdf50a0d0481d.pdf'),
-- İstanbul Başakşehir FK post-winter 2025-2026 roster
        (N'İstanbul Başakşehir FK', 19492, 11, N'ABBOSBEK FAYZULLAYEV', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19639, 25, N'AMINE HARIT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 821331, 2, N'BERAT AYBERK ÖZDEMİR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18783, 45, N'BERKAY ASLAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 2576523, 91, N'BERTUĞ ÖZGÜR YILDIRIM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19255, 21, N'CHRİSTOPHER TEA DOMORAUD OPERI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19456, 9, N'DAVIE SELKE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 1244810, 80, N'DOĞAN ALEMDAR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19448, 14, N'ELDOR SHOMURODOV', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19320, 36, N'FESTY OSEIWE EBOSELE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 2687812, 24, N'GÜVEN ATALAY', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 2623704, 15, N'HAMZA GÜRELER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 19349, 77, N'IVAN BRNIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18604, 18, N'JAKUB KALUZINSKI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18763, 3, N'JEROME OPOKU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=1564936&pageId=30.
        (N'İstanbul Başakşehir FK', 3501493, 88, N'KAZIMCAN KARATAŞ', '2003-01-16', N'TC', N'Left-Back', '2026-02-06', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17665, 5, N'LEONARDO CAMPOS DUARTE DA SILVA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17954, 13, N'MIGUEL CRESPO DA SILVA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 1632520, 16, N'MUHAMMED ŞENGEZER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18719, 10, N'NUNO MIGUEL DA COSTA JOIA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17847, 8, N'OLIVER MICHEL KEMEN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 15622, 6, N'ONUR BULUT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 1810160, 4, N'ONUR ERGÜN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 18698, 27, N'OUSSEYNOU BA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 791105, 42, N'ÖMER ALİ ŞAHİNER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 17309, 20, N'UMUT GÜNEŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 182384, 1, N'VOLKAN BABACAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
        (N'İstanbul Başakşehir FK', 16934, 7, N'YUSUF SARI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/cea5cb4f0cdd48a0b08c7d62b4602bbb.pdf', N'https://www.tff.org/Resources/TFF/Auto/4c0a80268be14ae28b60e08250d9e692.pdf'),
-- İkas Eyüpspor post-winter 2025-2026 roster
        (N'İkas Eyüpspor', 19832, 25, N'ABDOU KHADRE SY', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19798, 10, N'ANGEL YESID TORRES QUINONES', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 3533021, 88, N'ARDA YAVUZ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 1487530, 55, N'BARAN ALİ GEZEK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2568096, 5, N'BEDİRHAN ÖZYURT', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2683345, 43, N'BURAK IŞIK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 999588, 77, N'CENGİZ UMUT MERAŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19782, 15, N'CHARLES ANDRE RAUX YAO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19784, 22, N'DENIS RAZVAN RADU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19834, 14, N'DIABEL NDOYE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19077, 7, N'DORIN ROTARIU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2017795, 8, N'EMRE AKBABA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19833, 27, N'ISMAILA MANGA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2027795, 24, N'JANKAT YILMAZ', '2004-08-16', N'TC', N'Goalkeeper', '2025-09-12', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19788, 68, N'JEROME JUNIOR ONGUENE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19783, 23, N'LENNY JEAN PIERRE PINTOR', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19515, 2, N'LUCAS FELIPE CALEGARI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 16606, 4, N'LUCCAS CLARO DOS SANTOS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19533, 1, N'MARCOS FELIPE DE FREITAS MONTEIRO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 19603, 20, N'MATEUSZ JACEK LEGOWSKI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 1680635, 26, N'METEHAN ALTUNBAŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 2689661, 94, N'ÖMER FARUK UĞURLU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 18545, 40, N'PRINCE OBENG AMPEM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 1688041, 16, N'SEYFETTİN ANIL YAŞAR', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 17656, 17, N'TALHA ÜLVAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 16578, 28, N'TAŞKIN İLTER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 15648, 19, N'UMUT DİLAN BOZOK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/b24fac3ff12a40c199e2abef0ebac53b.pdf', N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
        (N'İkas Eyüpspor', 3520603, 31, N'UMUT KESECİ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/08ba8432fffa4d03a1c73c26109dbaf3.pdf'),
-- Kasımpaşa A.Ş. post-winter 2025-2026 roster
        (N'Kasımpaşa A.Ş.', 19579, 4, N'ADAM AROUS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19840, 19, N'ADRIAN DAWID BENEDYCZAK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 17765, 12, N'AHMED MORTADHA BEN OUANES', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 3522291, 30, N'AHMET TAHA DAĞBAŞI', '2005-04-01', N'TC', N'Centre-Back', '2026-02-06', '2030-06-30', NULL, NULL),
        (N'Kasımpaşa A.Ş.', 1847163, 25, N'ALİ EMRE YANAR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2019040, 11, N'ALİ YAVUZ KOL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 18586, 1, N'ANDREAS GIANNIOTIS', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19478, 16, N'ANDRI FANNAR BALDURSSON', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2664496, 47, N'BERKAY MURATOĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 15302, 23, N'CENK TOSUN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 18522, 2, N'CLAUDIO WINCK NETO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2631978, 42, N'EMİRHAN YİĞİT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 814191, 33, N'EMRE TAŞDEMİR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 1756032, 61, N'EGE ALBAYRAK', '2007-08-20', N'TC', N'Goalkeeper', '2025-09-03', '2028-06-30', NULL, NULL),
        (N'Kasımpaşa A.Ş.', 18767, 5, N'EYÜP AYDIN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 17122, 34, N'FOUSSENI DIABATE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19506, 21, N'GODFRİED AYESU OWUSU FRİMPONG', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 802431, 71, N'İRFAN CAN KAHVECİ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19824, 18, N'JİM EMİLLEN NGOWET ALLEVINAH', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 14646, 22, N'KAMİL AHMET ÇÖREKÇİ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 15458, 26, N'KEREM DEMİRBAY', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 1636101, 17, N'KUBİLAY KANATSIZKUŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19050, 20, N'NICHOLAS OPOKU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19487, 77, N'PAPE HABIB GUEYE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 19036, 8, N'RIBEIRO DIAS CARLOS MIGUEL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 18546, 50, N'RODRIGO NASCIMENTO FRANCA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2672434, 98, N'ŞANT KAZANCI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 2633455, 29, N'TAYLAN UTKU AYDIN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
        (N'Kasımpaşa A.Ş.', 17657, 9, N'YUSUF BARASI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1acc707ba24642078ecf7ae101a1c4e3.pdf', N'https://www.tff.org/Resources/TFF/Auto/caa53d55f920428e8e02acb7a5e2cc45.pdf'),
-- Kocaelispor roster
        (N'Kocaelispor', 791137, 22, N'AHMET OĞUZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 17852, 11, N'AHMET SAĞAT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19401, 1, N'ALEKSANDAR JOVANOVIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19474, 2, N'ANFERNEE JAMAL DIJKSTEEL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19591, 5, N'BOTOND BALOGH', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19451, 9, N'BRUNO PETKOVIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 18525, 70, N'CAN KELEŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19403, 7, N'DANIEL EBENEZER KWASI AGYEI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19568, 17, N'DARKO CHURLINOV', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 4030232, 16, N'DENİZ CEYLAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
        (N'Kocaelispor', 1162813, 18, N'FURKAN GEDİK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 434452, 35, N'GÖKHAN DEĞİRMENCİ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19616, 8, N'HABIB ALI KEITA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19577, 6, N'HRVOJE SMOLCIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19425, 98, N'JOSEPH NONGE BOENDE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19524, 10, N'KAROL LINETTY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19821, 20, N'MAHAMADOU SUSOHO SISSOHO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19406, 14, N'MANUEL LUIS DA SILVA CAFUMANA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 19421, 21, N'MASSADIO HAIDARA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 1665440, 3, N'MUHARREM CİNAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 18716, 99, N'RIGOBERTO MANUEL RIVAS VINDEL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 935664, 23, N'SAMET YALÇIN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 15422, 19, N'SERDAR DURSUN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 3512079, 83, N'SERHAT ÖZTAŞDELEN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
        (N'Kocaelispor', 785192, 75, N'TAYFUR BİNGÖL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/07df79610ed04073b5afd1de1720831a.pdf', N'https://www.tff.org/Resources/TFF/Auto/509115c9adfe4678ae02e5c2adb81fe2.pdf'),
-- Mısırlı.com.tr Fatih Karagümrük roster
        (N'Mısırlı.com.tr Fatih Karagümrük', 19768, 15, N'ABDUL KADER MOUSSA KONE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19753, 88, N'AHMED TRAORE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2658456, 17, N'AHMET SİVRİ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19360, 34, N'ALPER EMRE DEMİROL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19265, 91, N'ANDRE ANTHONY GRAY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2592624, 94, N'ANIL YİĞİT ÇINAR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 1853062, 6, N'ATAKAN RIDVAN ÇANKAYA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18366, 72, N'BARIŞ JAKOB KALAYCI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2567473, 6, N'BARTUĞ ELMAZ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17352, 8, N'BERKAY ÖZCAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 4544526, 24, N'BURHAN ERSOY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19590, 5, N'CLAUDIO MATIAS KRANEVITTER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2599675, 33, N'ÇAĞTAY KURUKALIP', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19084, 11, N'DANIEL ANTHONY JOHNSON', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19862, 10, N'DANIELE VERDE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19185, 0, N'DATRO DAVID FOFANA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18027, 4, N'DAVIDE BIRASCHI', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 16972, 3, N'ENZO PABLO ROCO ROCO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 1854021, 22, N'FATİH KURUCUK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19858, 25, N'FILIP MLADENOVIC', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 3004110, 99, N'FURKAN BEKLEVİÇ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19853, 3, N'IGOR LICHNOVSKY OSORIO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19158, 13, N'IVO GRBIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18964, 37, N'JOAO PEDRO GOMES CAMACHO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17587, 29, N'JURE BALKOVEC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2633453, 96, N'KEREM YANDAL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18993, 14, N'MARUIS TRESOR DOH', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2714304, 32, N'MUHAMMED İYYAD KADIOĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19455, 27, N'NIKOLOZ UGREKHELIDZE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2568396, 88, N'ÖMER FARUK GÜMÜŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', NULL),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19576, 47, N'RICARDO DE SOUSA ESGAIO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 18157, 23, N'SAM ANDREAS LARSSON', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17571, 70, N'SERGIO ANTONIO DA LUZ JUNIOR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19823, 80, N'SHAVY WARREN BABICKA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 2703053, 20, N'TARIK BUĞRA KALPAKLI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 17205, 21, N'TİAGO SÜER BARBAROS ÇUKUR', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 1687963, 16, N'TUĞBEY AKGÜN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/57c8efd2fa934f2baf1a7af8cf934ebf.pdf', N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
        (N'Mısırlı.com.tr Fatih Karagümrük', 19854, 19, N'YAYA ONOGO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bf0cb5e59d0f4d8ca1422cc2cdf9ab47.pdf'),
-- Samsunspor A.Ş. post-winter 2025-2026 roster
        (N'Samsunspor A.Ş.', 19526, 77, N'AFONSO GAMELAS DE PINHO SOUSA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19752, 15, N'ALI BADRA DIABATE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19428, 29, N'ANTOINE MAKOUMBOU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1048832, 96, N'BEDİRHAN ÇETİN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18705, 21, N'CARL JOHAN HOLSE JUSTESEN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 979517, 5, N'CELİL YÜKSEL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 3541127, 48, N'EFE BERAT TÖRUZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19791, 7, N'ELAYİS TAVSAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1137925, 11, N'EMRE KILINÇ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1047860, 23, N'ENES ALBAK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1061426, 73, N'EYÜP DEĞİRMENCİ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1435208, 71, N'İRFAN CAN EĞRİBAYAT', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19444, 2, N'JOSAFAT WOODING MENDES', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18594, 10, N'JULES OLIVIER NTCHAM', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19802, 47, N'KOUADOU JAURES ASSOUMOU', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19426, 17, N'LOGI TOMASSON', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18505, 37, N'LUBOMİR SATKA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18504, 9, N'MARIUS MOUNDILMADJI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1627508, 1, N'OKAN KOCUK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 17488, 19, N'PAPE CHERIF NDIAYE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 18518, 4, N'RİCK VAN DRONGELEN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1716961, 28, N'SONER GÖNÜL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1054760, 16, N'TAHSİN BÜLBÜL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19572, 70, N'TANGUY BEMIN COULIBALY', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 19530, 24, N'TONI BOREVKOVIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1877063, 20, N'YALÇIN KAYAN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1041978, 55, N'YUNUS EMRE ÇİFT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
        (N'Samsunspor A.Ş.', 1701095, 18, N'ZEKİ YAVRU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/6de0eaf827b74b46a8b7a95587b89eb6.pdf', N'https://www.tff.org/Resources/TFF/Auto/11a1d40e00804f77821b93bf9e124ee6.pdf'),
-- Trabzonspor A.Ş. post-winter 2025-2026 roster
        (N'Trabzonspor A.Ş.', 1189984, 88, N'AHMET DOĞAN YILDIRIM', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19604, 24, N'ANDRE ONANA ONANA', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 17025, 9, N'ANTHONY NNADUZOR NWAKAEME', NULL, NULL, N'Left Winger', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1532359, 21, N'ARDA ÖZTÜRK', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19016, 44, N'ARSENII BATAHOV', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19581, 8, N'BENJAMIN BOUCHOUARI', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1751808, 80, N'BORAN BAŞKAN', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19769, 27, N'CHIBUIKE GODFREY NWAIWU', NULL, NULL, N'Centre-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19542, 42, N'CHRIST RAVYNEL INAO OULAI', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 18726, 30, N'EBERE PAUL ONUACHU', NULL, NULL, N'Centre-Forward', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 18902, 10, N'ERNEST MUÇİ', '2001-03-19', N'ALB', N'Attacking Midfield', '2025-09-06', '2026-06-30', N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 2648624, 91, N'ESAT YİĞİT ALKURT', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1749340, 96, N'EROL CAN ÇOLAK', '2006-01-02', N'TC', N'Goalkeeper', '2025-05-23', '2028-06-30', NULL, NULL),
        (N'Trabzonspor A.Ş.', 19445, 99, N'FELIPE AUGUSTO DA SILVA', NULL, NULL, N'Centre-Forward', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19801, 14, N'MATHIAS JOHAN FJORTOFT LOVIK', NULL, NULL, N'Left-Back', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 997605, 18, N'MEHMET UMUT NAYİR', NULL, NULL, N'Centre-Forward', NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1716198, 19, N'MUSTAFA ESKİHELLAÇ', NULL, NULL, N'Left-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1820481, 5, N'OKAY YOKUŞLU', NULL, NULL, N'Defensive Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19329, 22, N'OLEKSANDR ZUBKOV', NULL, NULL, N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1755939, 17, N'ONURALP ÇAKIROĞLU', NULL, NULL, N'Right Winger', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 3538291, 25, N'ONURALP ÇEVİKKAN', NULL, NULL, N'Goalkeeper', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1621253, 11, N'OZAN TUFAN', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1748288, 74, N'SALİH MALKOÇOĞLU', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 18981, 15, N'STEFAN SAVIC', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 1755930, 92, N'TAHA EMRE İNCE', NULL, NULL, N'Centre-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19361, 26, N'TIM LUCA PACO JABOL - FOLCARELLI', NULL, NULL, N'Central Midfield', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
        (N'Trabzonspor A.Ş.', 19402, 20, N'WAGNER FABRICIO CARDOSO DE PINA', NULL, NULL, N'Right-Back', NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/67fce590900e4850a5ab3ca4c2c43f49.pdf', N'https://www.tff.org/Resources/TFF/Auto/1bba3674b9694f60a54231f2888e3cc9.pdf'),
-- Tümosan Konyaspor post-winter 2025-2026 roster
        (N'Tümosan Konyaspor', 19826, 39, N'ADAMO NAGALO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1905970, 4, N'ADİL DEMİRBAĞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1741833, 24, N'ARİF BOŞLUK', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1030507, 13, N'BAHADIR HAN GÜNGÖRDÜ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
-- Source: TFF player profile https://www.tff.org/Default.aspx?kisiId=2292522&pageId=30.
        (N'Tümosan Konyaspor', 17492, 18, N'BERKAN İSMAİL KUTLU', '1998-01-25', N'TC', N'Central Midfield', '2026-01-05', '2026-06-30', NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19177, 99, N'BLAZ KRAMER', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 3525618, 1, N'DENİZ ERTAŞ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 16212, 9, N'DENİZ TÜRÜÇ', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19851, 17, N'DIOGO ANTONIO CUPIDO GONÇALVES', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 4019447, 29, N'EGEMEN AYDIN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 18231, 10, N'ENIS BARDHI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 17417, 12, N'GUILHERME HAUBERT SITYA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 3047299, 30, N'İSMAİL ESAT BUĞA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 18070, 40, N'JACKSON KYANVUBU MULEKA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 2728934, 21, N'JINHO JO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1136941, 3, N'KARAHAN YASİR SUBAŞI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19504, 70, N'KAZEEM ADEREMI J. OLAIGBE', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19484, 11, N'MARIUS STEFANESCU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 16986, 16, N'MARKO JEVTOVIC', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 17652, 77, N'MELİH İBRAHİMOĞLU', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19363, 42, N'MORTEN BJORLO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 18974, 7, N'MUHAMMET TUNAHAN TAŞCI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 17780, 22, N'RAYYAN BANİYA', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19169, 20, N'RIECHEDLY GUILLERMO BAZOER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19756, 32, N'SANDER SVENDSEN', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 16582, 19, N'UFUK AKYOL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 1508782, 5, N'UĞURCAN YAZĞILI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
        (N'Tümosan Konyaspor', 19438, 23, N'YHOAN MANY ANDZOUANA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/9072e10b33234c0da0457860342bccca.pdf', N'https://www.tff.org/Resources/TFF/Auto/bd9f2eb579864b8baa7b620a27105420.pdf'),
-- Zecorner Kayserispor roster
        (N'Zecorner Kayserispor', 17848, 25, N'BİLAL BAYAZIT', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1674857, 17, N'BURAK KAPACAK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17867, 20, N'CARLOS MANUEL CARDOSO MANE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19819, 18, N'DENIS MAKAROV', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 4516275, 27, N'DENİZ EREN DÖNMEZER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1650151, 24, N'DORUKHAN TOKÖZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19847, 63, N'FEDOR CHALOV', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 815947, 33, N'FURKAN SOYALP', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19630, 9, N'GERMAN ONUGKHA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 18294, 61, N'GÖRKEM SAĞLAM', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19498, 22, N'INDRIT TUCI', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19792, 2, N'JADEL CHANDA KATONGO', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19495, 10, N'JOAO SABINO MENDES NETO SARAIVA', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19867, 30, N'JOSHUA BENJAMIN BRENET', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1267432, 38, N'KAYRA CİHAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19535, 8, N'LASZLO BENES', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 16191, 23, N'LIONEL JULES CAROLE', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1248453, 16, N'MEHMET ERAY ÖZBEK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17845, 7, N'MIGUEL FILIPE NUNES CARDOSO', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1245621, 77, N'NURETTİN KORKMAZ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1710422, 1, N'ONURCAN PİRİ', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 953111, 28, N'RAMAZAN CİVELEK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 19793, 11, N'SAMUEL JAMES MATHER', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 16052, 6, N'SEMİH GÜLER', NULL, NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17899, 4, N'STEFANO WILFRED DENSWIL', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 1248888, 99, N'TALHA SARIARSLAN', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 3508914, 21, N'YİĞİT EMRE ÇELTİK', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf'),
        (N'Zecorner Kayserispor', 17967, 15, N'YOUSSEF AIT BENASSER', NULL, NULL, NULL, NULL, NULL, N'https://www.tff.org/Resources/TFF/Auto/2e0aa61ccb124d5ba58674efb93953e1.pdf', N'https://www.tff.org/Resources/TFF/Auto/8a56c9944d4245008963937f80345d3c.pdf');
IF (SELECT COUNT(*) FROM @RosterInput) <> 513
    THROW 50009, 'Expected 513 curated roster registrations.', 1;

IF (SELECT COUNT(DISTINCT tff_license_no) FROM @RosterInput) <> 513
    THROW 50010, 'Expected 513 distinct TFF player licenses.', 1;

IF (SELECT COUNT(DISTINCT club_name) FROM @RosterInput) <> 18
    THROW 50011, 'Expected roster records for 18 clubs.', 1;

IF EXISTS (
    SELECT 1
    FROM @RosterInput
    WHERE birth_date IS NULL
        OR nationality IS NULL
        OR [position] IS NULL
        OR contract_start_date IS NULL
        OR contract_end_date IS NULL
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
        OR contract_start_date IS NULL
        OR contract_end_date IS NULL
    ORDER BY club_name, player_name;

    THROW 50012, 'Complete the missing source-backed player and contract values before running this seed.', 1;
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
        ON club.name = roster.club_name;

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

