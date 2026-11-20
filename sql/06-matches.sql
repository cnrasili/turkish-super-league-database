-- Load 2025-2026 match fixtures with sourced referee profiles.
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @MatchInput TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    week INT NOT NULL,
    home_club_name NVARCHAR(120) NOT NULL,
    away_club_name NVARCHAR(120) NOT NULL,
    referee_name NVARCHAR(120) NOT NULL,
    CHECK (home_club_name <> away_club_name)
);

INSERT INTO @MatchInput (source_match_id, week, home_club_name, away_club_name, referee_name)
VALUES
    (283554, 1, N'İkas Eyüpspor', N'Tümosan Konyaspor', N'BATUHAN KOLAK'),
    (283555, 1, N'Hesap.com Antalyaspor', N'Kasımpaşa A.Ş.', N'ALPER AKARSU'),
    (283556, 1, N'Trabzonspor A.Ş.', N'Kocaelispor', N'ÇAĞDAŞ ALTAY'),
    (283557, 1, N'Samsunspor A.Ş.', N'Gençlerbirliği', N'ALİ YILMAZ'),
    (283558, 1, N'Mısırlı.com.tr Fatih Karagümrük', N'İstanbul Başakşehir FK', N'ALİ YILMAZ'),
    (283559, 1, N'Gaziantep Futbol Kulübü A.Ş.', N'Galatasaray A.Ş.', N'ALİ ŞANSALAN'),
    (283560, 1, N'Fenerbahçe A.Ş.', N'Corendon Alanyaspor', N'CİHAN AYDIN'),
    (283561, 1, N'Çaykur Rizespor A.Ş.', N'Göztepe A.Ş.', N'MEHMET TÜRKMEN'),
    (283562, 1, N'Zecorner Kayserispor', N'Beşiktaş A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283563, 2, N'Kasımpaşa A.Ş.', N'Trabzonspor A.Ş.', N'CİHAN AYDIN'),
    (283564, 2, N'Tümosan Konyaspor', N'Gaziantep Futbol Kulübü A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283565, 2, N'Beşiktaş A.Ş.', N'İkas Eyüpspor', N'HALİL UMUT MELER'),
    (283566, 2, N'Corendon Alanyaspor', N'Çaykur Rizespor A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283567, 2, N'İstanbul Başakşehir FK', N'Zecorner Kayserispor', N'KADİR SAĞLAM'),
    (283568, 2, N'Göztepe A.Ş.', N'Fenerbahçe A.Ş.', N'YASİN KOL'),
    (283569, 2, N'Galatasaray A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'OZAN ERGÜN'),
    (283570, 2, N'Gençlerbirliği', N'Hesap.com Antalyaspor', N'OĞUZHAN AKSU'),
    (283571, 2, N'Kocaelispor', N'Samsunspor A.Ş.', N'ZORBAY KÜÇÜK'),
    (283572, 3, N'İkas Eyüpspor', N'Corendon Alanyaspor', N'ARDA KARDEŞLER'),
    (283573, 3, N'Tümosan Konyaspor', N'Beşiktaş A.Ş.', N'OZAN ERGÜN'),
    (283574, 3, N'Trabzonspor A.Ş.', N'Hesap.com Antalyaspor', N'ALİ YILMAZ'),
    (283575, 3, N'Samsunspor A.Ş.', N'Kasımpaşa A.Ş.', N'ALİ ŞANSALAN'),
    (283576, 3, N'Mısırlı.com.tr Fatih Karagümrük', N'Göztepe A.Ş.', N'BATUHAN KOLAK'),
    (283577, 3, N'Gaziantep Futbol Kulübü A.Ş.', N'Gençlerbirliği', N'ATİLLA KARAOĞLAN'),
    (283578, 3, N'Fenerbahçe A.Ş.', N'Kocaelispor', N'MEHMET TÜRKMEN'),
    (283579, 3, N'Çaykur Rizespor A.Ş.', N'İstanbul Başakşehir FK', N'ALİ YILMAZ'),
    (283580, 3, N'Zecorner Kayserispor', N'Galatasaray A.Ş.', N'ALPER AKARSU'),
    (283581, 4, N'Kasımpaşa A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'OZAN ERGÜN'),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük', N'CİHAN AYDIN'),
    (283583, 4, N'Trabzonspor A.Ş.', N'Samsunspor A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283584, 4, N'Corendon Alanyaspor', N'Beşiktaş A.Ş.', N'KADİR SAĞLAM'),
    (283585, 4, N'İstanbul Başakşehir FK', N'İkas Eyüpspor', N'ZORBAY KÜÇÜK'),
    (283586, 4, N'Göztepe A.Ş.', N'Tümosan Konyaspor', N'ALİ ŞANSALAN'),
    (283587, 4, N'Galatasaray A.Ş.', N'Çaykur Rizespor A.Ş.', N'ALİ YILMAZ'),
    (283588, 4, N'Gençlerbirliği', N'Fenerbahçe A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283589, 4, N'Kocaelispor', N'Zecorner Kayserispor', N'YASİN KOL'),
    (283590, 5, N'İkas Eyüpspor', N'Galatasaray A.Ş.', N'BATUHAN KOLAK'),
    (283591, 5, N'Tümosan Konyaspor', N'Corendon Alanyaspor', N'HALİL UMUT MELER'),
    (283592, 5, N'Beşiktaş A.Ş.', N'İstanbul Başakşehir FK', N'ALPER AKARSU'),
    (283593, 5, N'Samsunspor A.Ş.', N'Hesap.com Antalyaspor', N'ARDA KARDEŞLER'),
    (283594, 5, N'Mısırlı.com.tr Fatih Karagümrük', N'Kasımpaşa A.Ş.', N'OĞUZHAN AKSU'),
    (283595, 5, N'Gaziantep Futbol Kulübü A.Ş.', N'Kocaelispor', N'YİĞİT ARSLAN'),
    (283596, 5, N'Fenerbahçe A.Ş.', N'Trabzonspor A.Ş.', N'OZAN ERGÜN'),
    (283597, 5, N'Çaykur Rizespor A.Ş.', N'Gençlerbirliği', N'ZORBAY KÜÇÜK'),
    (283598, 5, N'Zecorner Kayserispor', N'Göztepe A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283599, 6, N'Kasımpaşa A.Ş.', N'Fenerbahçe A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283600, 6, N'Hesap.com Antalyaspor', N'Zecorner Kayserispor', N'KADİR SAĞLAM'),
    (283601, 6, N'Trabzonspor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'ARDA KARDEŞLER'),
    (283602, 6, N'Samsunspor A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'ÇAĞDAŞ ALTAY'),
    (283603, 6, N'İstanbul Başakşehir FK', N'Corendon Alanyaspor', N'ADNAN DENİZ KAYATEPE'),
    (283604, 6, N'Göztepe A.Ş.', N'Beşiktaş A.Ş.', N'MEHMET TÜRKMEN'),
    (283605, 6, N'Galatasaray A.Ş.', N'Tümosan Konyaspor', N'YASİN KOL'),
    (283606, 6, N'Gençlerbirliği', N'İkas Eyüpspor', N'ÖMER TOLGA GÜLDİBİ'),
    (283607, 6, N'Kocaelispor', N'Çaykur Rizespor A.Ş.', N'ÜMİT ÖZTÜRK'),
    (283608, 7, N'İkas Eyüpspor', N'Göztepe A.Ş.', N'KADİR SAĞLAM'),
    (283609, 7, N'Tümosan Konyaspor', N'İstanbul Başakşehir FK', N'OĞUZHAN ÇAKIR'),
    (283610, 7, N'Beşiktaş A.Ş.', N'Kocaelispor', N'ALİ ŞANSALAN'),
    (283611, 7, N'Corendon Alanyaspor', N'Galatasaray A.Ş.', N'ZORBAY KÜÇÜK'),
    (283612, 7, N'Mısırlı.com.tr Fatih Karagümrük', N'Trabzonspor A.Ş.', N'MEHMET TÜRKMEN'),
    (283613, 7, N'Gaziantep Futbol Kulübü A.Ş.', N'Samsunspor A.Ş.', N'BATUHAN KOLAK'),
    (283614, 7, N'Fenerbahçe A.Ş.', N'Hesap.com Antalyaspor', N'ALİ YILMAZ'),
    (283615, 7, N'Çaykur Rizespor A.Ş.', N'Kasımpaşa A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283616, 7, N'Zecorner Kayserispor', N'Gençlerbirliği', N'YİĞİT ARSLAN'),
    (283617, 8, N'Kasımpaşa A.Ş.', N'Tümosan Konyaspor', N'ALPER AKARSU'),
    (283618, 8, N'Hesap.com Antalyaspor', N'Çaykur Rizespor A.Ş.', N'OZAN ERGÜN'),
    (283619, 8, N'Trabzonspor A.Ş.', N'Zecorner Kayserispor', N'ALİ ŞANSALAN'),
    (283620, 8, N'Samsunspor A.Ş.', N'Fenerbahçe A.Ş.', N'HALİL UMUT MELER'),
    (283621, 8, N'Mısırlı.com.tr Fatih Karagümrük', N'Gaziantep Futbol Kulübü A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283622, 8, N'Göztepe A.Ş.', N'İstanbul Başakşehir FK', N'CİHAN AYDIN'),
    (283623, 8, N'Galatasaray A.Ş.', N'Beşiktaş A.Ş.', N'YASİN KOL'),
    (283624, 8, N'Gençlerbirliği', N'Corendon Alanyaspor', N'ATİLLA KARAOĞLAN'),
    (283625, 8, N'Kocaelispor', N'İkas Eyüpspor', N'ADNAN DENİZ KAYATEPE'),
    (283626, 9, N'İkas Eyüpspor', N'Kasımpaşa A.Ş.', N'CİHAN AYDIN'),
    (283627, 9, N'Tümosan Konyaspor', N'Kocaelispor', N'KADİR SAĞLAM'),
    (283628, 9, N'Beşiktaş A.Ş.', N'Gençlerbirliği', N'OĞUZHAN ÇAKIR'),
    (283629, 9, N'Corendon Alanyaspor', N'Göztepe A.Ş.', N'ALİ YILMAZ'),
    (283630, 9, N'İstanbul Başakşehir FK', N'Galatasaray A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283631, 9, N'Gaziantep Futbol Kulübü A.Ş.', N'Hesap.com Antalyaspor', N'ERDEM MERTOĞLU'),
    (283632, 9, N'Fenerbahçe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'ALİ ŞANSALAN'),
    (283633, 9, N'Çaykur Rizespor A.Ş.', N'Trabzonspor A.Ş.', N'HALİL UMUT MELER'),
    (283634, 9, N'Zecorner Kayserispor', N'Samsunspor A.Ş.', N'ÜMİT ÖZTÜRK'),
    (283635, 10, N'Kasımpaşa A.Ş.', N'Beşiktaş A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283636, 10, N'Hesap.com Antalyaspor', N'İstanbul Başakşehir FK', N'ÜMİT ÖZTÜRK'),
    (283637, 10, N'Trabzonspor A.Ş.', N'İkas Eyüpspor', N'ZORBAY KÜÇÜK'),
    (283638, 10, N'Samsunspor A.Ş.', N'Çaykur Rizespor A.Ş.', N'CİHAN AYDIN'),
    (283639, 10, N'Mısırlı.com.tr Fatih Karagümrük', N'Zecorner Kayserispor', N'YASİN KOL'),
    (283640, 10, N'Gaziantep Futbol Kulübü A.Ş.', N'Fenerbahçe A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283641, 10, N'Galatasaray A.Ş.', N'Göztepe A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283642, 10, N'Gençlerbirliği', N'Tümosan Konyaspor', N'HALİL UMUT MELER'),
    (283643, 10, N'Kocaelispor', N'Corendon Alanyaspor', N'MEHMET TÜRKMEN'),
    (283644, 11, N'İkas Eyüpspor', N'Hesap.com Antalyaspor', N'ALPER AKARSU'),
    (283645, 11, N'Tümosan Konyaspor', N'Samsunspor A.Ş.', N'ALİ ŞANSALAN'),
    (283646, 11, N'Beşiktaş A.Ş.', N'Fenerbahçe A.Ş.', N'ALİ YILMAZ'),
    (283647, 11, N'Corendon Alanyaspor', N'Gaziantep Futbol Kulübü A.Ş.', N'OĞUZHAN AKSU'),
    (283648, 11, N'İstanbul Başakşehir FK', N'Kocaelispor', N'BATUHAN KOLAK'),
    (283649, 11, N'Göztepe A.Ş.', N'Gençlerbirliği', N'YASİN KOL'),
    (283650, 11, N'Galatasaray A.Ş.', N'Trabzonspor A.Ş.', N'CİHAN AYDIN'),
    (283651, 11, N'Çaykur Rizespor A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'ÖMER TOLGA GÜLDİBİ'),
    (283652, 11, N'Zecorner Kayserispor', N'Kasımpaşa A.Ş.', N'KADİR SAĞLAM'),
    (283653, 12, N'Kasımpaşa A.Ş.', N'Göztepe A.Ş.', N'ÖMER TOLGA GÜLDİBİ'),
    (283654, 12, N'Hesap.com Antalyaspor', N'Beşiktaş A.Ş.', N'CİHAN AYDIN'),
    (283655, 12, N'Trabzonspor A.Ş.', N'Corendon Alanyaspor', N'ALİ ŞANSALAN'),
    (283656, 12, N'Samsunspor A.Ş.', N'İkas Eyüpspor', N'YASİN KOL'),
    (283657, 12, N'Mısırlı.com.tr Fatih Karagümrük', N'Tümosan Konyaspor', N'ADNAN DENİZ KAYATEPE'),
    (283658, 12, N'Gaziantep Futbol Kulübü A.Ş.', N'Çaykur Rizespor A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283659, 12, N'Fenerbahçe A.Ş.', N'Zecorner Kayserispor', N'OZAN ERGÜN'),
    (283660, 12, N'Gençlerbirliği', N'İstanbul Başakşehir FK', N'DİRENÇ TONUSLUOĞLU'),
    (283661, 12, N'Kocaelispor', N'Galatasaray A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283662, 13, N'İkas Eyüpspor', N'Mısırlı.com.tr Fatih Karagümrük', N'CİHAN AYDIN'),
    (283663, 13, N'Tümosan Konyaspor', N'Hesap.com Antalyaspor', N'OĞUZHAN AKSU'),
    (283664, 13, N'Beşiktaş A.Ş.', N'Samsunspor A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283665, 13, N'Corendon Alanyaspor', N'Kasımpaşa A.Ş.', N'YİĞİT ARSLAN'),
    (283666, 13, N'İstanbul Başakşehir FK', N'Trabzonspor A.Ş.', N'HALİL UMUT MELER'),
    (283667, 13, N'Göztepe A.Ş.', N'Kocaelispor', N'ALİ YILMAZ'),
    (283668, 13, N'Galatasaray A.Ş.', N'Gençlerbirliği', N'OZAN ERGÜN'),
    (283669, 13, N'Çaykur Rizespor A.Ş.', N'Fenerbahçe A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283670, 13, N'Zecorner Kayserispor', N'Gaziantep Futbol Kulübü A.Ş.', N'MEHMET TÜRKMEN'),
    (283671, 14, N'Kasımpaşa A.Ş.', N'İstanbul Başakşehir FK', N'ATİLLA KARAOĞLAN'),
    (283672, 14, N'Hesap.com Antalyaspor', N'Göztepe A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283673, 14, N'Trabzonspor A.Ş.', N'Tümosan Konyaspor', N'ALPER AKARSU'),
    (283674, 14, N'Samsunspor A.Ş.', N'Corendon Alanyaspor', N'KADİR SAĞLAM'),
    (283675, 14, N'Mısırlı.com.tr Fatih Karagümrük', N'Beşiktaş A.Ş.', N'HALİL UMUT MELER'),
    (283676, 14, N'Gaziantep Futbol Kulübü A.Ş.', N'İkas Eyüpspor', N'ÖMER TOLGA GÜLDİBİ'),
    (283677, 14, N'Fenerbahçe A.Ş.', N'Galatasaray A.Ş.', N'YASİN KOL'),
    (283678, 14, N'Çaykur Rizespor A.Ş.', N'Zecorner Kayserispor', N'CİHAN AYDIN'),
    (283679, 14, N'Kocaelispor', N'Gençlerbirliği', N'OĞUZHAN ÇAKIR'),
    (283680, 15, N'İkas Eyüpspor', N'Zecorner Kayserispor', N'YASİN KOL'),
    (283681, 15, N'Tümosan Konyaspor', N'Çaykur Rizespor A.Ş.', N'ÜMİT ÖZTÜRK'),
    (283682, 15, N'Beşiktaş A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'KADİR SAĞLAM'),
    (283683, 15, N'Corendon Alanyaspor', N'Hesap.com Antalyaspor', N'OĞUZHAN ÇAKIR'),
    (283684, 15, N'İstanbul Başakşehir FK', N'Fenerbahçe A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283685, 15, N'Göztepe A.Ş.', N'Trabzonspor A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283686, 15, N'Galatasaray A.Ş.', N'Samsunspor A.Ş.', N'MEHMET TÜRKMEN'),
    (283687, 15, N'Gençlerbirliği', N'Mısırlı.com.tr Fatih Karagümrük', N'ALİ YILMAZ'),
    (283688, 15, N'Kocaelispor', N'Kasımpaşa A.Ş.', N'ALİ ŞANSALAN'),
    (283689, 16, N'Kasımpaşa A.Ş.', N'Gençlerbirliği', N'OĞUZHAN ÇAKIR'),
    (283690, 16, N'Hesap.com Antalyaspor', N'Galatasaray A.Ş.', N'ALİ YILMAZ'),
    (283691, 16, N'Trabzonspor A.Ş.', N'Beşiktaş A.Ş.', N'ALİ ŞANSALAN'),
    (283692, 16, N'Samsunspor A.Ş.', N'İstanbul Başakşehir FK', N'OĞUZHAN AKSU'),
    (283693, 16, N'Mısırlı.com.tr Fatih Karagümrük', N'Kocaelispor', N'ÇAĞDAŞ ALTAY'),
    (283694, 16, N'Gaziantep Futbol Kulübü A.Ş.', N'Göztepe A.Ş.', N'CİHAN AYDIN'),
    (283695, 16, N'Fenerbahçe A.Ş.', N'Tümosan Konyaspor', N'OZAN ERGÜN'),
    (283696, 16, N'Çaykur Rizespor A.Ş.', N'İkas Eyüpspor', N'YİĞİT ARSLAN'),
    (283697, 16, N'Zecorner Kayserispor', N'Corendon Alanyaspor', N'ERDEM MERTOĞLU'),
    (283698, 17, N'İkas Eyüpspor', N'Fenerbahçe A.Ş.', N'ALİ YILMAZ'),
    (283699, 17, N'Tümosan Konyaspor', N'Zecorner Kayserispor', N'ÖMER TOLGA GÜLDİBİ'),
    (283700, 17, N'Beşiktaş A.Ş.', N'Çaykur Rizespor A.Ş.', N'CİHAN AYDIN'),
    (283701, 17, N'Corendon Alanyaspor', N'Mısırlı.com.tr Fatih Karagümrük', N'ADNAN DENİZ KAYATEPE'),
    (283702, 17, N'İstanbul Başakşehir FK', N'Gaziantep Futbol Kulübü A.Ş.', N'ALİ ŞANSALAN'),
    (283703, 17, N'Göztepe A.Ş.', N'Samsunspor A.Ş.', N'YASİN KOL'),
    (283704, 17, N'Galatasaray A.Ş.', N'Kasımpaşa A.Ş.', N'ALPER AKARSU'),
    (283705, 17, N'Gençlerbirliği', N'Trabzonspor A.Ş.', N'HALİL UMUT MELER'),
    (283706, 17, N'Kocaelispor', N'Hesap.com Antalyaspor', N'GÜRCAN HASOVA'),
    (283707, 18, N'Tümosan Konyaspor', N'İkas Eyüpspor', N'ÖMER FARUK TURTAY'),
    (283708, 18, N'Kasımpaşa A.Ş.', N'Hesap.com Antalyaspor', N'HALİL UMUT MELER'),
    (283709, 18, N'Kocaelispor', N'Trabzonspor A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283710, 18, N'Gençlerbirliği', N'Samsunspor A.Ş.', N'KADİR SAĞLAM'),
    (283711, 18, N'İstanbul Başakşehir FK', N'Mısırlı.com.tr Fatih Karagümrük', N'YASİN KOL'),
    (283712, 18, N'Galatasaray A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283713, 18, N'Corendon Alanyaspor', N'Fenerbahçe A.Ş.', N'MEHMET TÜRKMEN'),
    (283714, 18, N'Göztepe A.Ş.', N'Çaykur Rizespor A.Ş.', N'ALİ ŞANSALAN'),
    (283715, 18, N'Beşiktaş A.Ş.', N'Zecorner Kayserispor', N'OZAN ERGÜN'),
    (283716, 19, N'Trabzonspor A.Ş.', N'Kasımpaşa A.Ş.', N'ALİ YILMAZ'),
    (283717, 19, N'Gaziantep Futbol Kulübü A.Ş.', N'Tümosan Konyaspor', N'KADİR SAĞLAM'),
    (283718, 19, N'İkas Eyüpspor', N'Beşiktaş A.Ş.', N'YASİN KOL'),
    (283719, 19, N'Çaykur Rizespor A.Ş.', N'Corendon Alanyaspor', N'HALİL UMUT MELER'),
    (283720, 19, N'Zecorner Kayserispor', N'İstanbul Başakşehir FK', N'BATUHAN KOLAK'),
    (283721, 19, N'Fenerbahçe A.Ş.', N'Göztepe A.Ş.', N'CİHAN AYDIN'),
    (283722, 19, N'Mısırlı.com.tr Fatih Karagümrük', N'Galatasaray A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283723, 19, N'Hesap.com Antalyaspor', N'Gençlerbirliği', N'REŞAT ONUR COŞKUNSES'),
    (283724, 19, N'Samsunspor A.Ş.', N'Kocaelispor', N'YİĞİT ARSLAN'),
    (283725, 20, N'Corendon Alanyaspor', N'İkas Eyüpspor', N'OĞUZHAN AKSU'),
    (283726, 20, N'Beşiktaş A.Ş.', N'Tümosan Konyaspor', N'BATUHAN KOLAK'),
    (283727, 20, N'Hesap.com Antalyaspor', N'Trabzonspor A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283728, 20, N'Kasımpaşa A.Ş.', N'Samsunspor A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283729, 20, N'Göztepe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'ÖMER TOLGA GÜLDİBİ'),
    (283730, 20, N'Gençlerbirliği', N'Gaziantep Futbol Kulübü A.Ş.', N'ERDEM MERTOĞLU'),
    (283731, 20, N'Kocaelispor', N'Fenerbahçe A.Ş.', N'ALPER AKARSU'),
    (283732, 20, N'İstanbul Başakşehir FK', N'Çaykur Rizespor A.Ş.', N'YİĞİT ARSLAN'),
    (283733, 20, N'Galatasaray A.Ş.', N'Zecorner Kayserispor', N'ADNAN DENİZ KAYATEPE'),
    (283734, 21, N'Gaziantep Futbol Kulübü A.Ş.', N'Kasımpaşa A.Ş.', N'MEHMET TÜRKMEN'),
    (283735, 21, N'Mısırlı.com.tr Fatih Karagümrük', N'Hesap.com Antalyaspor', N'CİHAN AYDIN'),
    (283736, 21, N'Samsunspor A.Ş.', N'Trabzonspor A.Ş.', N'ALPER AKARSU'),
    (283737, 21, N'Beşiktaş A.Ş.', N'Corendon Alanyaspor', N'OĞUZHAN ÇAKIR'),
    (283738, 21, N'İkas Eyüpspor', N'İstanbul Başakşehir FK', N'HALİL UMUT MELER'),
    (283739, 21, N'Tümosan Konyaspor', N'Göztepe A.Ş.', N'YASİN KOL'),
    (283740, 21, N'Çaykur Rizespor A.Ş.', N'Galatasaray A.Ş.', N'OZAN ERGÜN'),
    (283741, 21, N'Fenerbahçe A.Ş.', N'Gençlerbirliği', N'ALİ ŞANSALAN'),
    (283742, 21, N'Zecorner Kayserispor', N'Kocaelispor', N'KADİR SAĞLAM'),
    (283743, 22, N'Galatasaray A.Ş.', N'İkas Eyüpspor', N'ÇAĞDAŞ ALTAY'),
    (283744, 22, N'Corendon Alanyaspor', N'Tümosan Konyaspor', N'ALİ YILMAZ'),
    (283745, 22, N'İstanbul Başakşehir FK', N'Beşiktaş A.Ş.', N'MEHMET TÜRKMEN'),
    (283746, 22, N'Hesap.com Antalyaspor', N'Samsunspor A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283747, 22, N'Kasımpaşa A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'BATUHAN KOLAK'),
    (283748, 22, N'Kocaelispor', N'Gaziantep Futbol Kulübü A.Ş.', N'FATİH TOKAİL'),
    (283749, 22, N'Trabzonspor A.Ş.', N'Fenerbahçe A.Ş.', N'HALİL UMUT MELER'),
    (283750, 22, N'Gençlerbirliği', N'Çaykur Rizespor A.Ş.', N'ÖMER TOLGA GÜLDİBİ'),
    (283751, 22, N'Göztepe A.Ş.', N'Zecorner Kayserispor', N'ALPER AKARSU'),
    (283752, 23, N'Fenerbahçe A.Ş.', N'Kasımpaşa A.Ş.', N'YASİN KOL'),
    (283753, 23, N'Zecorner Kayserispor', N'Hesap.com Antalyaspor', N'HALİL UMUT MELER'),
    (283754, 23, N'Gaziantep Futbol Kulübü A.Ş.', N'Trabzonspor A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283755, 23, N'Mısırlı.com.tr Fatih Karagümrük', N'Samsunspor A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283756, 23, N'Corendon Alanyaspor', N'İstanbul Başakşehir FK', N'KADİR SAĞLAM'),
    (283757, 23, N'Beşiktaş A.Ş.', N'Göztepe A.Ş.', N'OZAN ERGÜN'),
    (283758, 23, N'Tümosan Konyaspor', N'Galatasaray A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283759, 23, N'İkas Eyüpspor', N'Gençlerbirliği', N'ÖMER FARUK TURTAY'),
    (283760, 23, N'Çaykur Rizespor A.Ş.', N'Kocaelispor', N'MEHMET TÜRKMEN'),
    (283761, 24, N'Göztepe A.Ş.', N'İkas Eyüpspor', N'BATUHAN KOLAK'),
    (283762, 24, N'İstanbul Başakşehir FK', N'Tümosan Konyaspor', N'OĞUZHAN AKSU'),
    (283763, 24, N'Kocaelispor', N'Beşiktaş A.Ş.', N'CİHAN AYDIN'),
    (283764, 24, N'Galatasaray A.Ş.', N'Corendon Alanyaspor', N'ALİ ŞANSALAN'),
    (283765, 24, N'Trabzonspor A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'ALİ YILMAZ'),
    (283766, 24, N'Samsunspor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'MEHMET TÜRKMEN'),
    (283767, 24, N'Hesap.com Antalyaspor', N'Fenerbahçe A.Ş.', N'ALPER AKARSU'),
    (283768, 24, N'Kasımpaşa A.Ş.', N'Çaykur Rizespor A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283769, 24, N'Gençlerbirliği', N'Zecorner Kayserispor', N'ÜMİT ÖZTÜRK'),
    (283770, 25, N'Tümosan Konyaspor', N'Kasımpaşa A.Ş.', N'ÜMİT ÖZTÜRK'),
    (283771, 25, N'Çaykur Rizespor A.Ş.', N'Hesap.com Antalyaspor', N'OĞUZHAN AKSU'),
    (283772, 25, N'Zecorner Kayserispor', N'Trabzonspor A.Ş.', N'CİHAN AYDIN'),
    (283773, 25, N'Fenerbahçe A.Ş.', N'Samsunspor A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283774, 25, N'Gaziantep Futbol Kulübü A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'ÖMER TOLGA GÜLDİBİ'),
    (283775, 25, N'İstanbul Başakşehir FK', N'Göztepe A.Ş.', N'YASİN KOL'),
    (283776, 25, N'Beşiktaş A.Ş.', N'Galatasaray A.Ş.', N'OZAN ERGÜN'),
    (283777, 25, N'Corendon Alanyaspor', N'Gençlerbirliği', N'REŞAT ONUR COŞKUNSES'),
    (283778, 25, N'İkas Eyüpspor', N'Kocaelispor', N'GÜRCAN HASOVA'),
    (283779, 26, N'Kasımpaşa A.Ş.', N'İkas Eyüpspor', N'ALİ YILMAZ'),
    (283780, 26, N'Kocaelispor', N'Tümosan Konyaspor', N'CİHAN AYDIN'),
    (283781, 26, N'Gençlerbirliği', N'Beşiktaş A.Ş.', N'YASİN KOL'),
    (283782, 26, N'Göztepe A.Ş.', N'Corendon Alanyaspor', N'ASEN ALBAYRAK'),
    (283783, 26, N'Galatasaray A.Ş.', N'İstanbul Başakşehir FK', N'BATUHAN KOLAK'),
    (283784, 26, N'Hesap.com Antalyaspor', N'Gaziantep Futbol Kulübü A.Ş.', N'GÜRCAN HASOVA'),
    (283785, 26, N'Mısırlı.com.tr Fatih Karagümrük', N'Fenerbahçe A.Ş.', N'MEHMET TÜRKMEN'),
    (283786, 26, N'Trabzonspor A.Ş.', N'Çaykur Rizespor A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283787, 26, N'Samsunspor A.Ş.', N'Zecorner Kayserispor', N'ADNAN DENİZ KAYATEPE'),
    (283788, 27, N'Beşiktaş A.Ş.', N'Kasımpaşa A.Ş.', N'BATUHAN KOLAK'),
    (283789, 27, N'İstanbul Başakşehir FK', N'Hesap.com Antalyaspor', N'REŞAT ONUR COŞKUNSES'),
    (283790, 27, N'İkas Eyüpspor', N'Trabzonspor A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283791, 27, N'Çaykur Rizespor A.Ş.', N'Samsunspor A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283792, 27, N'Zecorner Kayserispor', N'Mısırlı.com.tr Fatih Karagümrük', N'HALİL UMUT MELER'),
    (283793, 27, N'Fenerbahçe A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'KADİR SAĞLAM'),
    (283794, 27, N'Göztepe A.Ş.', N'Galatasaray A.Ş.', N'ALPER AKARSU'),
    (283795, 27, N'Tümosan Konyaspor', N'Gençlerbirliği', N'ALİ YILMAZ'),
    (283796, 27, N'Corendon Alanyaspor', N'Kocaelispor', N'YİĞİT ARSLAN'),
    (283797, 28, N'Hesap.com Antalyaspor', N'İkas Eyüpspor', N'KADİR SAĞLAM'),
    (283798, 28, N'Samsunspor A.Ş.', N'Tümosan Konyaspor', N'HALİL UMUT MELER'),
    (283799, 28, N'Fenerbahçe A.Ş.', N'Beşiktaş A.Ş.', N'YASİN KOL'),
    (283800, 28, N'Gaziantep Futbol Kulübü A.Ş.', N'Corendon Alanyaspor', N'ATİLLA KARAOĞLAN'),
    (283801, 28, N'Kocaelispor', N'İstanbul Başakşehir FK', N'ALİ YILMAZ'),
    (283802, 28, N'Gençlerbirliği', N'Göztepe A.Ş.', N'BATUHAN KOLAK'),
    (283803, 28, N'Trabzonspor A.Ş.', N'Galatasaray A.Ş.', N'CİHAN AYDIN'),
    (283804, 28, N'Mısırlı.com.tr Fatih Karagümrük', N'Çaykur Rizespor A.Ş.', N'YİĞİT ARSLAN'),
    (283805, 28, N'Kasımpaşa A.Ş.', N'Zecorner Kayserispor', N'MEHMET TÜRKMEN'),
    (283806, 29, N'Göztepe A.Ş.', N'Kasımpaşa A.Ş.', N'ÇAĞDAŞ ALTAY'),
    (283807, 29, N'Beşiktaş A.Ş.', N'Hesap.com Antalyaspor', N'ADNAN DENİZ KAYATEPE'),
    (283808, 29, N'Corendon Alanyaspor', N'Trabzonspor A.Ş.', N'MEHMET TÜRKMEN'),
    (283809, 29, N'İkas Eyüpspor', N'Samsunspor A.Ş.', N'YASİN KOL'),
    (283810, 29, N'Tümosan Konyaspor', N'Mısırlı.com.tr Fatih Karagümrük', N'OĞUZHAN AKSU'),
    (283811, 29, N'Çaykur Rizespor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'OZAN ERGÜN'),
    (283812, 29, N'Zecorner Kayserispor', N'Fenerbahçe A.Ş.', N'ALİ YILMAZ'),
    (283813, 29, N'İstanbul Başakşehir FK', N'Gençlerbirliği', N'ALİ ŞANSALAN'),
    (283814, 29, N'Galatasaray A.Ş.', N'Kocaelispor', N'OĞUZHAN ÇAKIR'),
    (283815, 30, N'Mısırlı.com.tr Fatih Karagümrük', N'İkas Eyüpspor', N'CİHAN AYDIN'),
    (283816, 30, N'Hesap.com Antalyaspor', N'Tümosan Konyaspor', N'ABDULLAH BUĞRA TAŞKINSOY'),
    (283817, 30, N'Samsunspor A.Ş.', N'Beşiktaş A.Ş.', N'GÜRCAN HASOVA'),
    (283818, 30, N'Kasımpaşa A.Ş.', N'Corendon Alanyaspor', N'OĞUZHAN AKSU'),
    (283819, 30, N'Trabzonspor A.Ş.', N'İstanbul Başakşehir FK', N'ALPER AKARSU'),
    (283820, 30, N'Kocaelispor', N'Göztepe A.Ş.', N'ALİ YILMAZ'),
    (283821, 30, N'Gençlerbirliği', N'Galatasaray A.Ş.', N'BATUHAN KOLAK'),
    (283822, 30, N'Fenerbahçe A.Ş.', N'Çaykur Rizespor A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283823, 30, N'Gaziantep Futbol Kulübü A.Ş.', N'Zecorner Kayserispor', N'ATİLLA KARAOĞLAN'),
    (283824, 31, N'İstanbul Başakşehir FK', N'Kasımpaşa A.Ş.', N'YİĞİT ARSLAN'),
    (283825, 31, N'Göztepe A.Ş.', N'Hesap.com Antalyaspor', N'OĞUZHAN ÇAKIR'),
    (283826, 31, N'Tümosan Konyaspor', N'Trabzonspor A.Ş.', N'HALİL UMUT MELER'),
    (283827, 31, N'Corendon Alanyaspor', N'Samsunspor A.Ş.', N'OZAN ERGÜN'),
    (283828, 31, N'Beşiktaş A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük', N'BATUHAN KOLAK'),
    (283829, 31, N'İkas Eyüpspor', N'Gaziantep Futbol Kulübü A.Ş.', N'REŞAT ONUR COŞKUNSES'),
    (283830, 31, N'Galatasaray A.Ş.', N'Fenerbahçe A.Ş.', N'YASİN KOL'),
    (283831, 31, N'Zecorner Kayserispor', N'Çaykur Rizespor A.Ş.', N'GÜRCAN HASOVA'),
    (283832, 31, N'Gençlerbirliği', N'Kocaelispor', N'MEHMET TÜRKMEN'),
    (283833, 32, N'Zecorner Kayserispor', N'İkas Eyüpspor', N'MEHMET TÜRKMEN'),
    (283834, 32, N'Çaykur Rizespor A.Ş.', N'Tümosan Konyaspor', N'ÖMER FARUK TURTAY'),
    (283835, 32, N'Gaziantep Futbol Kulübü A.Ş.', N'Beşiktaş A.Ş.', N'ABDULLAH BUĞRA TAŞKINSOY'),
    (283836, 32, N'Hesap.com Antalyaspor', N'Corendon Alanyaspor', N'ATİLLA KARAOĞLAN'),
    (283837, 32, N'Fenerbahçe A.Ş.', N'İstanbul Başakşehir FK', N'OĞUZHAN AKSU'),
    (283838, 32, N'Trabzonspor A.Ş.', N'Göztepe A.Ş.', N'OZAN ERGÜN'),
    (283839, 32, N'Samsunspor A.Ş.', N'Galatasaray A.Ş.', N'REŞAT ONUR COŞKUNSES'),
    (283840, 32, N'Mısırlı.com.tr Fatih Karagümrük', N'Gençlerbirliği', N'OĞUZHAN ÇAKIR'),
    (283841, 32, N'Kasımpaşa A.Ş.', N'Kocaelispor', N'YASİN KOL'),
    (283842, 33, N'Gençlerbirliği', N'Kasımpaşa A.Ş.', N'CİHAN AYDIN'),
    (283843, 33, N'Galatasaray A.Ş.', N'Hesap.com Antalyaspor', N'ÇAĞDAŞ ALTAY'),
    (283844, 33, N'Beşiktaş A.Ş.', N'Trabzonspor A.Ş.', N'OĞUZHAN ÇAKIR'),
    (283845, 33, N'İstanbul Başakşehir FK', N'Samsunspor A.Ş.', N'GÜRCAN HASOVA'),
    (283846, 33, N'Kocaelispor', N'Mısırlı.com.tr Fatih Karagümrük', N'ADNAN DENİZ KAYATEPE'),
    (283847, 33, N'Göztepe A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.', N'BATUHAN KOLAK'),
    (283848, 33, N'Tümosan Konyaspor', N'Fenerbahçe A.Ş.', N'ATİLLA KARAOĞLAN'),
    (283849, 33, N'İkas Eyüpspor', N'Çaykur Rizespor A.Ş.', N'HALİL UMUT MELER'),
    (283850, 33, N'Corendon Alanyaspor', N'Zecorner Kayserispor', N'YASİN KOL'),
    (283851, 34, N'Fenerbahçe A.Ş.', N'İkas Eyüpspor', N'MEHMET TÜRKMEN'),
    (283852, 34, N'Zecorner Kayserispor', N'Tümosan Konyaspor', N'MELEK DAKAN'),
    (283853, 34, N'Çaykur Rizespor A.Ş.', N'Beşiktaş A.Ş.', N'ASEN ALBAYRAK'),
    (283854, 34, N'Mısırlı.com.tr Fatih Karagümrük', N'Corendon Alanyaspor', N'OĞUZHAN AKSU'),
    (283855, 34, N'Gaziantep Futbol Kulübü A.Ş.', N'İstanbul Başakşehir FK', N'ÖMER FARUK TURTAY'),
    (283856, 34, N'Samsunspor A.Ş.', N'Göztepe A.Ş.', N'ÜMİT ÖZTÜRK'),
    (283857, 34, N'Kasımpaşa A.Ş.', N'Galatasaray A.Ş.', N'ADNAN DENİZ KAYATEPE'),
    (283858, 34, N'Trabzonspor A.Ş.', N'Gençlerbirliği', N'ATİLLA KARAOĞLAN'),
    (283859, 34, N'Hesap.com Antalyaspor', N'Kocaelispor', N'HALİL UMUT MELER');

IF (SELECT COUNT(*) FROM @MatchInput) <> 306
    THROW 50040, 'Expected all 306 source-backed 2025-2026 matches.', 1;

IF EXISTS (
    SELECT week, home_club_name, away_club_name
    FROM @MatchInput
    GROUP BY week, home_club_name, away_club_name
    HAVING COUNT(*) > 1
)
    THROW 50041, 'A fixture is duplicated in the match input.', 1;

DECLARE @SeasonId INT;

SELECT @SeasonId = season_id
FROM dbo.season
WHERE name = N'2025-2026';

IF @SeasonId IS NULL
    THROW 50042, 'Load the 2025-2026 season reference data first.', 1;

IF (SELECT COUNT(*) FROM dbo.season WHERE name = N'2025-2026') <> 1
    THROW 50043, 'Expected exactly one 2025-2026 season.', 1;

IF (SELECT COUNT(*) FROM dbo.season_club WHERE season_id = @SeasonId) <> 18
    THROW 50044, 'Load all 18 season-club rows before match data.', 1;

IF EXISTS (SELECT 1 FROM dbo.[match])
    THROW 50045, 'The match table must be empty before seeding.', 1;

IF EXISTS (
    SELECT 1
    FROM @MatchInput AS input
    LEFT JOIN dbo.club AS home_club
        ON home_club.name = input.home_club_name
    LEFT JOIN dbo.club AS away_club
        ON away_club.name = input.away_club_name
    WHERE home_club.club_id IS NULL
        OR away_club.club_id IS NULL
        OR home_club.club_id = away_club.club_id
)
    THROW 50046, 'Every fixture must map to two distinct source-backed clubs.', 1;

IF EXISTS (
    SELECT 1
    FROM @MatchInput AS input
    INNER JOIN dbo.club AS home_club
        ON home_club.name = input.home_club_name
    INNER JOIN dbo.club AS away_club
        ON away_club.name = input.away_club_name
    LEFT JOIN dbo.season_club AS home_participation
        ON home_participation.season_id = @SeasonId
        AND home_participation.club_id = home_club.club_id
    LEFT JOIN dbo.season_club AS away_participation
        ON away_participation.season_id = @SeasonId
        AND away_participation.club_id = away_club.club_id
    WHERE home_participation.club_id IS NULL
        OR away_participation.club_id IS NULL
)
    THROW 50047, 'Both fixture clubs must participate in the selected season.', 1;

IF EXISTS (
    SELECT 1
    FROM @MatchInput AS input
    LEFT JOIN dbo.person AS referee_person
        ON referee_person.name = input.referee_name
    LEFT JOIN dbo.referee AS referee
        ON referee.person_id = referee_person.person_id
    WHERE referee.person_id IS NULL
)
    THROW 50048, 'Load every referenced referee profile before match data.', 1;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.[match] (season_id, home_club_id, away_club_id, referee_id, week)
    SELECT
        @SeasonId,
        home_club.club_id,
        away_club.club_id,
        referee.person_id,
        input.week
    FROM @MatchInput AS input
    INNER JOIN dbo.club AS home_club
        ON home_club.name = input.home_club_name
    INNER JOIN dbo.club AS away_club
        ON away_club.name = input.away_club_name
    INNER JOIN dbo.person AS referee_person
        ON referee_person.name = input.referee_name
    INNER JOIN dbo.referee AS referee
        ON referee.person_id = referee_person.person_id;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;

SELECT
    input.source_match_id AS tff_match_id,
    match.match_id,
    match.week,
    home_club.name AS home_club,
    away_club.name AS away_club,
    referee_person.name AS referee
FROM @MatchInput AS input
INNER JOIN dbo.club AS home_club
    ON home_club.name = input.home_club_name
INNER JOIN dbo.club AS away_club
    ON away_club.name = input.away_club_name
INNER JOIN dbo.person AS referee_person
    ON referee_person.name = input.referee_name
INNER JOIN dbo.referee AS referee
    ON referee.person_id = referee_person.person_id
INNER JOIN dbo.[match] AS match
    ON match.season_id = @SeasonId
    AND match.home_club_id = home_club.club_id
    AND match.away_club_id = away_club.club_id
    AND match.referee_id = referee.person_id
    AND match.week = input.week
ORDER BY input.source_match_id;
