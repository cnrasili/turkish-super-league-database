-- Source-matched one-in/one-out substitutions for 370 unambiguous TFF match-sheet records.
-- Same-minute groups with multiple players are paired in source-verified supplements.
-- TFF has no injury marker; set is_injury only when a report documents injury.
-- All positive injury flags were checked against match-specific reports.
-- Sahadan confirms Ianis Hagi's injury substitution and reports Luis Perez's injury before their exits in match 283800.
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
    (283555, 1, N'Hesap.com Antalyaspor', N'Kasımpaşa A.Ş.'),
    (283556, 1, N'Trabzonspor A.Ş.', N'Kocaelispor'),
    (283558, 1, N'Mısırlı.com.tr Fatih Karagümrük', N'İstanbul Başakşehir FK'),
    (283559, 1, N'Gaziantep Futbol Kulübü A.Ş.', N'Galatasaray A.Ş.'),
    (283561, 1, N'Çaykur Rizespor A.Ş.', N'Göztepe A.Ş.'),
    (283563, 2, N'Kasımpaşa A.Ş.', N'Trabzonspor A.Ş.'),
    (283564, 2, N'Tümosan Konyaspor', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283565, 2, N'Beşiktaş A.Ş.', N'İkas Eyüpspor'),
    (283566, 2, N'Corendon Alanyaspor', N'Çaykur Rizespor A.Ş.'),
    (283567, 2, N'İstanbul Başakşehir FK', N'Zecorner Kayserispor'),
    (283569, 2, N'Galatasaray A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283571, 2, N'Kocaelispor', N'Samsunspor A.Ş.'),
    (283573, 3, N'Tümosan Konyaspor', N'Beşiktaş A.Ş.'),
    (283577, 3, N'Gaziantep Futbol Kulübü A.Ş.', N'Gençlerbirliği'),
    (283578, 3, N'Fenerbahçe A.Ş.', N'Kocaelispor'),
    (283582, 4, N'Hesap.com Antalyaspor', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283589, 4, N'Kocaelispor', N'Zecorner Kayserispor'),
    (283595, 5, N'Gaziantep Futbol Kulübü A.Ş.', N'Kocaelispor'),
    (283600, 6, N'Hesap.com Antalyaspor', N'Zecorner Kayserispor'),
    (283602, 6, N'Samsunspor A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283605, 6, N'Galatasaray A.Ş.', N'Tümosan Konyaspor'),
    (283606, 6, N'Gençlerbirliği', N'İkas Eyüpspor'),
    (283614, 7, N'Fenerbahçe A.Ş.', N'Hesap.com Antalyaspor'),
    (283618, 8, N'Hesap.com Antalyaspor', N'Çaykur Rizespor A.Ş.'),
    (283621, 8, N'Mısırlı.com.tr Fatih Karagümrük', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283625, 8, N'Kocaelispor', N'İkas Eyüpspor'),
    (283626, 9, N'İkas Eyüpspor', N'Kasımpaşa A.Ş.'),
    (283632, 9, N'Fenerbahçe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283639, 10, N'Mısırlı.com.tr Fatih Karagümrük', N'Zecorner Kayserispor'),
    (283644, 11, N'İkas Eyüpspor', N'Hesap.com Antalyaspor'),
    (283647, 11, N'Corendon Alanyaspor', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283656, 12, N'Samsunspor A.Ş.', N'İkas Eyüpspor'),
    (283658, 12, N'Gaziantep Futbol Kulübü A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283661, 12, N'Kocaelispor', N'Galatasaray A.Ş.'),
    (283665, 13, N'Corendon Alanyaspor', N'Kasımpaşa A.Ş.'),
    (283669, 13, N'Çaykur Rizespor A.Ş.', N'Fenerbahçe A.Ş.'),
    (283673, 14, N'Trabzonspor A.Ş.', N'Tümosan Konyaspor'),
    (283676, 14, N'Gaziantep Futbol Kulübü A.Ş.', N'İkas Eyüpspor'),
    (283678, 14, N'Çaykur Rizespor A.Ş.', N'Zecorner Kayserispor'),
    (283681, 15, N'Tümosan Konyaspor', N'Çaykur Rizespor A.Ş.'),
    (283693, 16, N'Mısırlı.com.tr Fatih Karagümrük', N'Kocaelispor'),
    (283697, 16, N'Zecorner Kayserispor', N'Corendon Alanyaspor'),
    (283698, 17, N'İkas Eyüpspor', N'Fenerbahçe A.Ş.'),
    (283699, 17, N'Tümosan Konyaspor', N'Zecorner Kayserispor'),
    (283700, 17, N'Beşiktaş A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283701, 17, N'Corendon Alanyaspor', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283709, 18, N'Kocaelispor', N'Trabzonspor A.Ş.'),
    (283710, 18, N'Gençlerbirliği', N'Samsunspor A.Ş.'),
    (283714, 18, N'Göztepe A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283716, 19, N'Trabzonspor A.Ş.', N'Kasımpaşa A.Ş.'),
    (283717, 19, N'Gaziantep Futbol Kulübü A.Ş.', N'Tümosan Konyaspor'),
    (283718, 19, N'İkas Eyüpspor', N'Beşiktaş A.Ş.'),
    (283721, 19, N'Fenerbahçe A.Ş.', N'Göztepe A.Ş.'),
    (283722, 19, N'Mısırlı.com.tr Fatih Karagümrük', N'Galatasaray A.Ş.'),
    (283729, 20, N'Göztepe A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283733, 20, N'Galatasaray A.Ş.', N'Zecorner Kayserispor'),
    (283739, 21, N'Tümosan Konyaspor', N'Göztepe A.Ş.'),
    (283740, 21, N'Çaykur Rizespor A.Ş.', N'Galatasaray A.Ş.'),
    (283746, 22, N'Hesap.com Antalyaspor', N'Samsunspor A.Ş.'),
    (283747, 22, N'Kasımpaşa A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283751, 22, N'Göztepe A.Ş.', N'Zecorner Kayserispor'),
    (283753, 23, N'Zecorner Kayserispor', N'Hesap.com Antalyaspor'),
    (283755, 23, N'Mısırlı.com.tr Fatih Karagümrük', N'Samsunspor A.Ş.'),
    (283757, 23, N'Beşiktaş A.Ş.', N'Göztepe A.Ş.'),
    (283760, 23, N'Çaykur Rizespor A.Ş.', N'Kocaelispor'),
    (283765, 24, N'Trabzonspor A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283766, 24, N'Samsunspor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283771, 25, N'Çaykur Rizespor A.Ş.', N'Hesap.com Antalyaspor'),
    (283774, 25, N'Gaziantep Futbol Kulübü A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283775, 25, N'İstanbul Başakşehir FK', N'Göztepe A.Ş.'),
    (283779, 26, N'Kasımpaşa A.Ş.', N'İkas Eyüpspor'),
    (283782, 26, N'Göztepe A.Ş.', N'Corendon Alanyaspor'),
    (283784, 26, N'Hesap.com Antalyaspor', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283785, 26, N'Mısırlı.com.tr Fatih Karagümrük', N'Fenerbahçe A.Ş.'),
    (283786, 26, N'Trabzonspor A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283792, 27, N'Zecorner Kayserispor', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283794, 27, N'Göztepe A.Ş.', N'Galatasaray A.Ş.'),
    (283796, 27, N'Corendon Alanyaspor', N'Kocaelispor'),
    (283800, 28, N'Gaziantep Futbol Kulübü A.Ş.', N'Corendon Alanyaspor'),
    (283802, 28, N'Gençlerbirliği', N'Göztepe A.Ş.'),
    (283804, 28, N'Mısırlı.com.tr Fatih Karagümrük', N'Çaykur Rizespor A.Ş.'),
    (283806, 29, N'Göztepe A.Ş.', N'Kasımpaşa A.Ş.'),
    (283808, 29, N'Corendon Alanyaspor', N'Trabzonspor A.Ş.'),
    (283809, 29, N'İkas Eyüpspor', N'Samsunspor A.Ş.'),
    (283811, 29, N'Çaykur Rizespor A.Ş.', N'Gaziantep Futbol Kulübü A.Ş.'),
    (283816, 30, N'Hesap.com Antalyaspor', N'Tümosan Konyaspor'),
    (283818, 30, N'Kasımpaşa A.Ş.', N'Corendon Alanyaspor'),
    (283820, 30, N'Kocaelispor', N'Göztepe A.Ş.'),
    (283822, 30, N'Fenerbahçe A.Ş.', N'Çaykur Rizespor A.Ş.'),
    (283825, 31, N'Göztepe A.Ş.', N'Hesap.com Antalyaspor'),
    (283827, 31, N'Corendon Alanyaspor', N'Samsunspor A.Ş.'),
    (283828, 31, N'Beşiktaş A.Ş.', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283831, 31, N'Zecorner Kayserispor', N'Çaykur Rizespor A.Ş.'),
    (283832, 31, N'Gençlerbirliği', N'Kocaelispor'),
    (283834, 32, N'Çaykur Rizespor A.Ş.', N'Tümosan Konyaspor'),
    (283836, 32, N'Hesap.com Antalyaspor', N'Corendon Alanyaspor'),
    (283838, 32, N'Trabzonspor A.Ş.', N'Göztepe A.Ş.'),
    (283840, 32, N'Mısırlı.com.tr Fatih Karagümrük', N'Gençlerbirliği'),
    (283846, 33, N'Kocaelispor', N'Mısırlı.com.tr Fatih Karagümrük'),
    (283852, 34, N'Zecorner Kayserispor', N'Tümosan Konyaspor'),
    (283854, 34, N'Mısırlı.com.tr Fatih Karagümrük', N'Corendon Alanyaspor'),
    (283857, 34, N'Kasımpaşa A.Ş.', N'Galatasaray A.Ş.'),
    (283858, 34, N'Trabzonspor A.Ş.', N'Gençlerbirliği'),
    (283859, 34, N'Hesap.com Antalyaspor', N'Kocaelispor');

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
    (283555, 39, N'GEORGII DZHIKIIA', N'substituted_in_home', N'BAHADIR ÖZTÜRK', N'substituted_out_home', 0),
    (283555, 64, N'BÜNYAMİN BALCI', N'substituted_in_home', N'ABDÜLKADİR ÖMÜR', N'substituted_out_home', 0),
    (283555, 64, N'YUSUF BARASI', N'substituted_in_away', N'JHON JAIRO', N'substituted_out_away', 0),
    (283555, 87, N'ALİ YAVUZ KOL', N'substituted_in_away', N'MAMADOU FALL', N'substituted_out_away', 0),
    (283556, 62, N'DANYLO SIKAN', N'substituted_in_home', N'KAZEEM ADEREMI J. OLAIGBE', N'substituted_out_home', 0),
    (283556, 83, N'ARİF BOŞLUK', N'substituted_in_home', N'ANTHONY NNADUZOR NWAKAEME', N'substituted_out_home', 0),
    (283556, 21, N'ANFERNEE JAMAL DIJKSTEEL', N'substituted_in_away', N'MATEUSZ WIETESKA', N'substituted_out_away', 0),
    (283556, 62, N'DANIEL EBENEZER KWASI AGYEI', N'substituted_in_away', N'OĞULCAN ÇAĞLAYAN', N'substituted_out_away', 0),
    (283558, 66, N'MARUIS TRESOR DOH', N'substituted_in_home', N'ANDRE ANTHONY GRAY', N'substituted_out_home', 0),
    (283558, 59, N'IVAN BRNIC', N'substituted_in_away', N'DENİZ TÜRÜÇ', N'substituted_out_away', 0),
    (283558, 72, N'NUNO MIGUEL DA COSTA JOIA', N'substituted_in_away', N'OLIVER MICHEL KEMEN', N'substituted_out_away', 0),
    (283559, 35, N'ENVER KULASIN', N'substituted_in_home', N'SALEM M''BAKATA', N'substituted_out_home', 0),
    (283559, 45, N'PAPA ALIOUNE NDIAYE', N'substituted_in_home', N'CHRISTOPHER LUNGOYI', N'substituted_out_home', 0),
    (283559, 67, N'SOKRATIS DIOUDIS', N'substituted_in_home', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_home', 0),
    (283559, 73, N'NICOLO ZANIOLO', N'substituted_in_away', N'EVREN EREN ELMALI', N'substituted_out_away', 0),
    (283561, 68, N'DAL VARESANOVIC', N'substituted_in_home', N'QAZIM LACI', N'substituted_out_home', 0),
    (283561, 81, N'KHUSNIDDIN ALIKULOV', N'substituted_in_home', N'ATTILA MOCSI', N'substituted_out_home', 0),
    (283561, 73, N'EMERSONN', N'substituted_in_away', N'JANDERSON DE CARVALHO COSTA', N'substituted_out_away', 0),
    (283563, 67, N'CEM ÜSTÜNDAĞ', N'substituted_in_home', N'CLAUDIO WINCK NETO', N'substituted_out_home', 0),
    (283563, 87, N'KUBİLAY KANATSIZKUŞ', N'substituted_in_home', N'ANDRI FANNAR BALDURSSON', N'substituted_out_home', 0),
    (283563, 95, N'OZAN TUFAN', N'substituted_in_away', N'MUSTAFA ESKİHELLAÇ', N'substituted_out_away', 0),
    (283564, 72, N'PEDRO HENRIQUE OLIVEIRA DOS SANTOS', N'substituted_in_home', N'DANIJEL ALEKSIC', N'substituted_out_home', 0),
    (283564, 72, N'OGÜN ÖZÇİÇEK', N'substituted_in_away', N'PAPA ALIOUNE NDIAYE', N'substituted_out_away', 0),
    (283564, 79, N'MİRZA CİHAN', N'substituted_in_away', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_away', 0),
    (283565, 97, N'TAYYİP TALHA SANUÇ', N'substituted_in_home', N'MILOT RASHICA', N'substituted_out_home', 0),
    (283565, 55, N'SVIT SESLAR', N'substituted_in_away', N'HALİL AKBUNAR', N'substituted_out_away', 0),
    (283565, 62, N'MELİH KABASAKAL', N'substituted_in_away', N'YALÇIN KAYAN', N'substituted_out_away', 0),
    (283566, 62, N'EFECAN KARACA', N'substituted_in_home', N'GÜVEN YALÇIN', N'substituted_out_home', 0),
    (283566, 80, N'MIHAI-VALENTIN MIHAILA', N'substituted_in_away', N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_out_away', 0),
    (283566, 87, N'ATTILA MOCSI', N'substituted_in_away', N'CASPER SOMMER HOJER', N'substituted_out_away', 0),
    (283567, 72, N'ALI KARIMI', N'substituted_in_away', N'YAW ACKAH', N'substituted_out_away', 0),
    (283569, 62, N'VICTOR JAMES OSIMHEN', N'substituted_in_home', N'MARIO RENE JUNIOR LEMINA', N'substituted_out_home', 0),
    (283571, 46, N'MESUT CAN TUNALI', N'substituted_in_home', N'OĞULCAN ÇAĞLAYAN', N'substituted_out_home', 0),
    (283571, 46, N'ANTOINE MAKOUMBOU', N'substituted_in_away', N'CELİL YÜKSEL', N'substituted_out_away', 0),
    (283571, 76, N'SONER GÖNÜL', N'substituted_in_away', N'EMRE KILINÇ', N'substituted_out_away', 0),
    (283571, 92, N'YUNUS EMRE ÇİFT', N'substituted_in_away', N'MARIUS MOUNDILMADJI', N'substituted_out_away', 0),
    (283573, 65, N'MUHAMMET TUNAHAN TAŞCI', N'substituted_in_home', N'MELİH İBRAHİMOĞLU', N'substituted_out_home', 0),
    (283573, 91, N'JONAS SVENSSON', N'substituted_in_away', N'MILOT RASHICA', N'substituted_out_away', 0),
    (283573, 95, N'DAVID JURASEK', N'substituted_in_away', N'KEVIN OGHENETEGA TAMARAEBI BAKUMO ABRAHAM', N'substituted_out_away', 0),
    (283577, 46, N'SEMİH GÜLER', N'substituted_in_home', N'ARDA KIZILDAĞ', N'substituted_out_home', 0),
    (283577, 61, N'JUNINHO GRACIELO BACUNA', N'substituted_in_home', N'PAPA ALIOUNE NDIAYE', N'substituted_out_home', 0),
    (283577, 75, N'LUIS JESUS PEREZ MAQUEDA', N'substituted_in_home', N'OGÜN ÖZÇİÇEK', N'substituted_out_home', 0),
    (283577, 82, N'DİLHAN DEMİR', N'substituted_in_away', N'GÖKTAN GÜRPÜZ', N'substituted_out_away', 0),
    (283578, 90, N'ALEXANDER KWABENA BAIDOOH DJIKU', N'substituted_in_home', N'OĞUZ AYDIN', N'substituted_out_home', 0),
    (283578, 46, N'TAYFUR BİNGÖL', N'substituted_in_away', N'JOSEPH NONGE BOENDE', N'substituted_out_away', 0),
    (283578, 70, N'KAROL LINETTY', N'substituted_in_away', N'MANUEL LUIS DA SILVA CAFUMANA', N'substituted_out_away', 0),
    (283582, 75, N'HÜSEYİN TÜRKMEN', N'substituted_in_home', N'GEORGII DZHIKIIA', N'substituted_out_home', 0),
    (283582, 85, N'ALPER EMRE DEMİROL', N'substituted_in_away', N'ANDRE ANTHONY GRAY', N'substituted_out_away', 0),
    (283589, 10, N'OĞULCAN ÇAĞLAYAN', N'substituted_in_home', N'RYAN ISAAC MENDES', N'substituted_out_home', 0),
    (283589, 46, N'KAROL LINETTY', N'substituted_in_home', N'AARON CHRISTOPHER BILLY ONDELE APPINDANGOYE', N'substituted_out_home', 0),
    (283589, 74, N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_in_home', N'CAN KELEŞ', N'substituted_out_home', 0),
    (283589, 82, N'DORUKHAN TOKÖZ', N'substituted_in_away', N'YAW ACKAH', N'substituted_out_away', 0),
    (283595, 46, N'PAPA ALIOUNE NDIAYE', N'substituted_in_home', N'OGÜN ÖZÇİÇEK', N'substituted_out_home', 0),
    (283595, 81, N'ENVER KULASIN', N'substituted_in_home', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_home', 0),
    (283595, 88, N'DRISSA CAMARA', N'substituted_in_home', N'DEIAN CRISTIAN SORESCU', N'substituted_out_home', 0),
    (283595, 81, N'FURKAN GEDİK', N'substituted_in_away', N'KAROL LINETTY', N'substituted_out_away', 0),
    (283600, 60, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_home', N'ABDÜLKADİR ÖMÜR', N'substituted_out_home', 0),
    (283600, 46, N'BURAK KAPACAK', N'substituted_in_away', N'AARON OPOKU TIAWIAH', N'substituted_out_away', 0),
    (283600, 71, N'INDRIT TUCI', N'substituted_in_away', N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_out_away', 1),
    (283600, 79, N'NURETTİN KORKMAZ', N'substituted_in_away', N'ABDULSAMET BURAK', N'substituted_out_away', 1),
    (283602, 66, N'MARIUS MOUNDILMADJI', N'substituted_in_home', N'PAPE CHERIF NDIAYE', N'substituted_out_home', 1),
    (283602, 70, N'CELİL YÜKSEL', N'substituted_in_home', N'TANGUY BEMIN COULIBALY', N'substituted_out_home', 0),
    (283602, 57, N'SAM ANDREAS LARSSON', N'substituted_in_away', N'MARUIS TRESOR DOH', N'substituted_out_away', 0),
    (283605, 46, N'MUHAMMET TUNAHAN TAŞCI', N'substituted_in_away', N'ALASSANE NDAO', N'substituted_out_away', 0),
    (283605, 68, N'JINHO JO', N'substituted_in_away', N'MELİH İBRAHİMOĞLU', N'substituted_out_away', 0),
    (283605, 88, N'MARIUS STEFANESCU', N'substituted_in_away', N'ENIS BARDHI', N'substituted_out_away', 0),
    (283606, 71, N'KEVIN CSOBOTH', N'substituted_in_home', N'GÖKTAN GÜRPÜZ', N'substituted_out_home', 0),
    (283606, 88, N'NIHAD MUJAKIC', N'substituted_in_away', N'CENGİZ UMUT MERAŞ', N'substituted_out_away', 0),
    (283614, 90, N'OĞUZ AYDIN', N'substituted_in_home', N'DORGELES NENE', N'substituted_out_home', 0),
    (283614, 25, N'SAMUEL LEO BEAT BALLET', N'substituted_in_away', N'ABDÜLKADİR ÖMÜR', N'substituted_out_away', 1),
    (283618, 27, N'JESPER ISMAILA CEESAY', N'substituted_in_home', N'HASAN YAKUB İLÇİN', N'substituted_out_home', 0),
    (283618, 80, N'DOĞUKAN SİNİK', N'substituted_in_home', N'SONER DİKMEN', N'substituted_out_home', 0),
    (283618, 65, N'MIHAI-VALENTIN MIHAILA', N'substituted_in_away', N'EMRECAN BULUT', N'substituted_out_away', 0),
    (283618, 87, N'TAYLAN ANTALYALI', N'substituted_in_away', N'CASPER SOMMER HOJER', N'substituted_out_away', 0),
    (283621, 67, N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_in_home', N'SAM ANDREAS LARSSON', N'substituted_out_home', 0),
    (283621, 46, N'SEMİH GÜLER', N'substituted_in_away', N'LEO MYENTY JANNA ABENA', N'substituted_out_away', 1),
    (283621, 67, N'TAYYİP TALHA SANUÇ', N'substituted_in_away', N'ARDA KIZILDAĞ', N'substituted_out_away', 1),
    (283621, 79, N'YUSUF KARHAN KABADAYI', N'substituted_in_away', N'MOHAMED LAMINE BAYO', N'substituted_out_away', 0),
    (283625, 46, N'DARKO CHURLINOV', N'substituted_in_home', N'CAN KELEŞ', N'substituted_out_home', 0),
    (283625, 61, N'AHMET OĞUZ', N'substituted_in_home', N'HRVOJE SMOLCIC', N'substituted_out_home', 0),
    (283625, 76, N'SERDAR DURSUN', N'substituted_in_home', N'MASSADIO HAIDARA', N'substituted_out_home', 0),
    (283625, 67, N'EMRE AKBABA', N'substituted_in_away', N'SVIT SESLAR', N'substituted_out_away', 0),
    (283626, 67, N'PRINCE OBENG AMPEM', N'substituted_in_home', N'HALİL AKBUNAR', N'substituted_out_home', 0),
    (283626, 75, N'TARAS STEPANENKO', N'substituted_in_home', N'YALÇIN KAYAN', N'substituted_out_home', 1),
    (283626, 60, N'RIBEIRO DIAS CARLOS MIGUEL', N'substituted_in_away', N'MAMADOU FALL', N'substituted_out_away', 0),
    (283632, 89, N'ARCHIBALD NORMAN BROWN', N'substituted_in_home', N'MÜNİR LEVENT MERCAN', N'substituted_out_home', 0),
    (283632, 46, N'MUHAMMED İYYAD KADIOĞLU', N'substituted_in_away', N'ENZO PABLO ROCO ROCO', N'substituted_out_away', 0),
    (283639, 5, N'DORUKHAN TOKÖZ', N'substituted_in_away', N'YOUSSEF AIT BENASSER', N'substituted_out_away', 0),
    (283639, 58, N'AARON OPOKU TIAWIAH', N'substituted_in_away', N'CARLOS MANUEL CARDOSO MANE', N'substituted_out_away', 0),
    (283639, 96, N'NURETTİN KORKMAZ', N'substituted_in_away', N'RAMAZAN CİVELEK', N'substituted_out_away', 0),
    (283644, 59, N'PRINCE OBENG AMPEM', N'substituted_in_home', N'HALİL AKBUNAR', N'substituted_out_home', 0),
    (283644, 46, N'SONER DİKMEN', N'substituted_in_away', N'ALEXANDER GERARD VAN DE STREEK', N'substituted_out_away', 0),
    (283644, 70, N'KENNETH IMMANUEL PAAL', N'substituted_in_away', N'SAMET KARAKOÇ', N'substituted_out_away', 0),
    (283644, 79, N'TOMAS CVANCARA', N'substituted_in_away', N'RAMZI SAFURI', N'substituted_out_away', 0),
    (283644, 87, N'HÜSEYİN TÜRKMEN', N'substituted_in_away', N'DARIO SARIC', N'substituted_out_away', 0),
    (283647, 82, N'EFECAN KARACA', N'substituted_in_home', N'IANIS HAGI', N'substituted_out_home', 0),
    (283647, 72, N'EMMANUEL OKYERE BOATENG', N'substituted_in_away', N'MOHAMED LAMINE BAYO', N'substituted_out_away', 0),
    (283647, 85, N'OGÜN ÖZÇİÇEK', N'substituted_in_away', N'DRISSA CAMARA', N'substituted_out_away', 0),
    (283647, 91, N'CHRISTOPHER LUNGOYI', N'substituted_in_away', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_away', 0),
    (283656, 73, N'MARIUS MOUNDILMADJI', N'substituted_in_home', N'ANTHONY TİTE EMMANUEL MUSABA', N'substituted_out_home', 0),
    (283656, 58, N'HALİL AKBUNAR', N'substituted_in_away', N'PRINCE OBENG AMPEM', N'substituted_out_away', 0),
    (283656, 73, N'MATEUSZ JACEK LEGOWSKI', N'substituted_in_away', N'YALÇIN KAYAN', N'substituted_out_away', 0),
    (283658, 57, N'OGÜN ÖZÇİÇEK', N'substituted_in_home', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_home', 0),
    (283658, 90, N'KHUSNIDDIN ALIKULOV', N'substituted_in_away', N'MUHAMED BULJUBASIC', N'substituted_out_away', 0),
    (283661, 90, N'OLEKSANDR SYROTA', N'substituted_in_home', N'DANIEL EBENEZER KWASI AGYEI', N'substituted_out_home', 0),
    (283661, 95, N'DARKO CHURLINOV', N'substituted_in_home', N'KAROL LINETTY', N'substituted_out_home', 0),
    (283661, 46, N'ROLAND SALLAI', N'substituted_in_away', N'WILFRIED STEPHANE SINGO', N'substituted_out_away', 0),
    (283661, 90, N'KAAN AYHAN', N'substituted_in_away', N'DAVINSON SANCHEZ MINA', N'substituted_out_away', 0),
    (283665, 20, N'GODFRİED AYESU OWUSU FRİMPONG', N'substituted_in_away', N'EMRE TAŞDEMİR', N'substituted_out_away', 0),
    (283665, 46, N'FOUSSENI DIABATE', N'substituted_in_away', N'ATTILA ARPAD SZALAI', N'substituted_out_away', 0),
    (283665, 93, N'JHON JAIRO', N'substituted_in_away', N'PAPE HABIB GUEYE', N'substituted_out_away', 0),
    (283669, 61, N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_in_home', N'MUHAMED BULJUBASIC', N'substituted_out_home', 0),
    (283669, 75, N'YOUSSEF EN NESYRI', N'substituted_in_away', N'JHON JADER DURAN PALACIOS', N'substituted_out_away', 0),
    (283673, 89, N'CİHAN ÇANAK', N'substituted_in_home', N'OLEKSANDR ZUBKOV', N'substituted_out_home', 0),
    (283673, 80, N'MELİH BOSTAN', N'substituted_in_away', N'MEHMET UMUT NAYİR', N'substituted_out_away', 0),
    (283676, 65, N'YUSUF KARHAN KABADAYI', N'substituted_in_home', N'CHRISTOPHER LUNGOYI', N'substituted_out_home', 1),
    (283676, 74, N'EMMANUEL OKYERE BOATENG', N'substituted_in_home', N'MOHAMED LAMINE BAYO', N'substituted_out_home', 0),
    (283676, 76, N'TALHA ÜLVAN', N'substituted_in_away', N'SERDAR GÜRLER', N'substituted_out_away', 0),
    (283676, 92, N'YALÇIN KAYAN', N'substituted_in_away', N'EMRE AKBABA', N'substituted_out_away', 0),
    (283676, 94, N'SAMUEL SAIZ ALONSO', N'substituted_in_away', N'UMUT DİLAN BOZOK', N'substituted_out_away', 0),
    (283678, 57, N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_in_home', N'VACLAV JURECKA', N'substituted_out_home', 0),
    (283678, 79, N'TALHA SARIARSLAN', N'substituted_in_away', N'CARLOS MANUEL CARDOSO MANE', N'substituted_out_away', 0),
    (283678, 82, N'DORUKHAN TOKÖZ', N'substituted_in_away', N'FURKAN SOYALP', N'substituted_out_away', 1),
    (283678, 85, N'MEHMET ERAY ÖZBEK', N'substituted_in_away', N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_out_away', 0),
    (283681, 69, N'MUHAMMET TUNAHAN TAŞCI', N'substituted_in_home', N'ENIS BARDHI', N'substituted_out_home', 0),
    (283681, 81, N'JOSIP CALUSIC', N'substituted_in_home', N'KARAHAN YASİR SUBAŞI', N'substituted_out_home', 1),
    (283681, 91, N'İSMAİL ESAT BUĞA', N'substituted_in_home', N'MELİH İBRAHİMOĞLU', N'substituted_out_home', 0),
    (283681, 80, N'TAYLAN ANTALYALI', N'substituted_in_away', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_away', 0),
    (283693, 79, N'BARIŞ JAKOB KALAYCI', N'substituted_in_home', N'DANIEL ANTHONY JOHNSON', N'substituted_out_home', 0),
    (283693, 87, N'ANIL YİĞİT ÇINAR', N'substituted_in_home', N'BERKAY ÖZCAN', N'substituted_out_home', 0),
    (283693, 89, N'TARIK BUĞRA KALPAKLI', N'substituted_in_home', N'CLAUDIO MATIAS KRANEVITTER', N'substituted_out_home', 0),
    (283693, 68, N'BRUNO PETKOVIC', N'substituted_in_away', N'SERDAR DURSUN', N'substituted_out_away', 0),
    (283693, 85, N'FURKAN GEDİK', N'substituted_in_away', N'HABIB ALI KEITA', N'substituted_out_away', 0),
    (283697, 80, N'NURETTİN KORKMAZ', N'substituted_in_home', N'RAMAZAN CİVELEK', N'substituted_out_home', 1),
    (283697, 90, N'ARİF KOCAMAN', N'substituted_in_home', N'INDRIT TUCI', N'substituted_out_home', 0),
    (283697, 56, N'STEVE MICHEL KEVİN MOUNIE', N'substituted_in_away', N'UCHENNA OGUNDU', N'substituted_out_away', 0),
    (283697, 90, N'GÜVEN YALÇIN', N'substituted_in_away', N'UI JO HWANG', N'substituted_out_away', 0),
    (283698, 66, N'PRINCE OBENG AMPEM', N'substituted_in_home', N'YALÇIN KAYAN', N'substituted_out_home', 0),
    (283698, 66, N'OĞUZ AYDIN', N'substituted_in_away', N'ANDERSON SOUZA CONCEIÇAO', N'substituted_out_away', 1),
    (283699, 71, N'MELİH İBRAHİMOĞLU', N'substituted_in_home', N'ENIS BARDHI', N'substituted_out_home', 0),
    (283699, 78, N'MARKO JEVTOVIC', N'substituted_in_home', N'JINHO JO', N'substituted_out_home', 0),
    (283699, 73, N'INDRIT TUCI', N'substituted_in_away', N'FURKAN SOYALP', N'substituted_out_away', 0),
    (283699, 78, N'TALHA SARIARSLAN', N'substituted_in_away', N'CARLOS MANUEL CARDOSO MANE', N'substituted_out_away', 0),
    (283700, 45, N'DEVRİM ŞAHİN', N'substituted_in_home', N'KEVIN OGHENETEGA TAMARAEBI BAKUMO ABRAHAM', N'substituted_out_home', 1),
    (283700, 90, N'GÖKHAN SAZDAĞI', N'substituted_in_home', N'DEMİR EGE TIKNAZ', N'substituted_out_home', 0),
    (283700, 60, N'ALTIN ZEQIRI', N'substituted_in_away', N'LOIDE ANTONIO AUGUSTO', N'substituted_out_away', 1),
    (283700, 73, N'EMRECAN BULUT', N'substituted_in_away', N'JESURUN RAK-SAKYI', N'substituted_out_away', 0),
    (283701, 84, N'BARAN MOĞULTAY', N'substituted_in_home', N'UI JO HWANG', N'substituted_out_home', 0),
    (283701, 93, N'BATUHAN YAVUZ', N'substituted_in_home', N'RUAN PEREIRA DUARTE', N'substituted_out_home', 0),
    (283701, 82, N'BARIŞ JAKOB KALAYCI', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0),
    (283709, 57, N'BOTOND BALOGH', N'substituted_in_home', N'HRVOJE SMOLCIC', N'substituted_out_home', 1),
    (283709, 79, N'CAN KELEŞ', N'substituted_in_home', N'DANIEL EBENEZER KWASI AGYEI', N'substituted_out_home', 0),
    (283709, 95, N'SERDAR DURSUN', N'substituted_in_home', N'KAROL LINETTY', N'substituted_out_home', 0),
    (283709, 80, N'BENJAMIN BOUCHOUARI', N'substituted_in_away', N'KAZEEM ADEREMI J. OLAIGBE', N'substituted_out_away', 0),
    (283709, 94, N'OKAY YOKUŞLU', N'substituted_in_away', N'ERNEST MUÇİ', N'substituted_out_away', 0),
    (283710, 76, N'MBAYE HAMADY NIANG', N'substituted_in_home', N'GÖKTAN GÜRPÜZ', N'substituted_out_home', 0),
    (283710, 92, N'FIRATCAN ÜZÜM', N'substituted_in_home', N'METEHAN MİMAROĞLU', N'substituted_out_home', 0),
    (283710, 84, N'LOGI TOMASSON', N'substituted_in_away', N'JOSAFAT WOODING MENDES', N'substituted_out_away', 0),
    (283714, 84, N'GUILERME LUIZ OLIVEIRA DA SILVA', N'substituted_in_home', N'JUAN SANTOS DA SILVA', N'substituted_out_home', 0),
    (283714, 88, N'ALLAN GODOI SANTOS', N'substituted_in_home', N'MOHAMMED AMIN CHERNI', N'substituted_out_home', 0),
    (283714, 96, N'UĞUR KAAN YILDIZ', N'substituted_in_home', N'RHALDNEY', N'substituted_out_home', 0),
    (283714, 75, N'MIHAI-VALENTIN MIHAILA', N'substituted_in_away', N'KHUSNIDDIN ALIKULOV', N'substituted_out_away', 0),
    (283716, 46, N'EBERE PAUL ONUACHU', N'substituted_in_home', N'KAZEEM ADEREMI J. OLAIGBE', N'substituted_out_home', 0),
    (283716, 78, N'ANTHONY NNADUZOR NWAKAEME', N'substituted_in_home', N'FELIPE AUGUSTO DA SILVA', N'substituted_out_home', 0),
    (283716, 89, N'OKAY YOKUŞLU', N'substituted_in_home', N'OLEKSANDR ZUBKOV', N'substituted_out_home', 0),
    (283716, 93, N'OZAN TUFAN', N'substituted_in_home', N'ERNEST MUÇİ', N'substituted_out_home', 0),
    (283716, 55, N'PAPE HABIB GUEYE', N'substituted_in_away', N'KUBİLAY KANATSIZKUŞ', N'substituted_out_away', 0),
    (283716, 67, N'CEM ÜSTÜNDAĞ', N'substituted_in_away', N'MAMADOU FALL', N'substituted_out_away', 0),
    (283717, 46, N'LUIS JESUS PEREZ MAQUEDA', N'substituted_in_home', N'ARDA KIZILDAĞ', N'substituted_out_home', 0),
    (283717, 70, N'MELİH KABASAKAL', N'substituted_in_home', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_home', 0),
    (283717, 76, N'KARAMBA GASSAMA', N'substituted_in_home', N'DRISSA CAMARA', N'substituted_out_home', 0),
    (283717, 46, N'ENIS BARDHI', N'substituted_in_away', N'SANDER SVENDSEN', N'substituted_out_away', 0),
    (283717, 56, N'YHOAN MANY ANDZOUANA', N'substituted_in_away', N'JINHO JO', N'substituted_out_away', 0),
    (283717, 89, N'MUHAMMET TUNAHAN TAŞCI', N'substituted_in_away', N'DENİZ TÜRÜÇ', N'substituted_out_away', 0),
    (283718, 46, N'EMRE AKBABA', N'substituted_in_home', N'MATEUSZ JACEK LEGOWSKI', N'substituted_out_home', 0),
    (283718, 72, N'PRINCE OBENG AMPEM', N'substituted_in_home', N'LENNY JEAN PIERRE PINTOR', N'substituted_out_home', 0),
    (283718, 82, N'DENIS RAZVAN RADU', N'substituted_in_home', N'METEHAN ALTUNBAŞ', N'substituted_out_home', 0),
    (283718, 79, N'GÖKHAN SAZDAĞI', N'substituted_in_away', N'TAYLAN BULUT', N'substituted_out_away', 0),
    (283721, 38, N'FREDERICO RODRIGUES DE PAULA SANTOS', N'substituted_in_home', N'İSMAİL YÜKSEK', N'substituted_out_home', 1),
    (283721, 46, N'MERT MÜLDÜR', N'substituted_in_home', N'YİĞİT EFE DEMİR', N'substituted_out_home', 0),
    (283721, 56, N'JHON JADER DURAN PALACIOS', N'substituted_in_home', N'DORGELES NENE', N'substituted_out_home', 0),
    (283721, 81, N'MUHAMMED KEREM AKTÜRKOĞLU', N'substituted_in_home', N'ANTHONY TİTE EMMANUEL MUSABA', N'substituted_out_home', 0),
    (283721, 68, N'RHALDNEY', N'substituted_in_away', N'ISHOLA JUNIOR OLAITAN', N'substituted_out_away', 0),
    (283722, 77, N'ABDUL KADER MOUSSA KONE', N'substituted_in_home', N'SAM ANDREAS LARSSON', N'substituted_out_home', 0),
    (283722, 85, N'TARIK BUĞRA KALPAKLI', N'substituted_in_home', N'BARIŞ JAKOB KALAYCI', N'substituted_out_home', 0),
    (283722, 46, N'MARIO RENE JUNIOR LEMINA', N'substituted_in_away', N'LUCAS SEBASTIAN TORREIRA DI PASCUA', N'substituted_out_away', 0),
    (283722, 70, N'MAURO EMANUEL ICARDI', N'substituted_in_away', N'ROLAND SALLAI', N'substituted_out_away', 0),
    (283722, 79, N'KAAN AYHAN', N'substituted_in_away', N'VICTOR JAMES OSIMHEN', N'substituted_out_away', 0),
    (283729, 89, N'GUILERME LUIZ OLIVEIRA DA SILVA', N'substituted_in_home', N'JUAN SANTOS DA SILVA', N'substituted_out_home', 0),
    (283729, 46, N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_in_away', N'SHAVY WARREN BABICKA', N'substituted_out_away', 0),
    (283729, 80, N'AHMET SİVRİ', N'substituted_in_away', N'BARIŞ JAKOB KALAYCI', N'substituted_out_away', 0),
    (283733, 73, N'YASER ESNEYDER ASPRILLA MARTINEZ', N'substituted_in_home', N'NOA NOËLL LANG', N'substituted_out_home', 0),
    (283733, 81, N'AHMED KUTUCU', N'substituted_in_home', N'VICTOR JAMES OSIMHEN', N'substituted_out_home', 0),
    (283733, 46, N'CARLOS MANUEL CARDOSO MANE', N'substituted_in_away', N'RAMAZAN CİVELEK', N'substituted_out_away', 0),
    (283733, 77, N'DORUKHAN TOKÖZ', N'substituted_in_away', N'YOUSSEF AIT BENASSER', N'substituted_out_away', 0),
    (283733, 86, N'JADEL CHANDA KATONGO', N'substituted_in_away', N'AARON OPOKU TIAWIAH', N'substituted_out_away', 0),
    (283739, 68, N'JINHO JO', N'substituted_in_home', N'ENIS BARDHI', N'substituted_out_home', 0),
    (283739, 79, N'MARKO JEVTOVIC', N'substituted_in_home', N'BERKAN İSMAİL KUTLU', N'substituted_out_home', 0),
    (283739, 86, N'RIECHEDLY GUILLERMO BAZOER', N'substituted_in_home', N'UĞURCAN YAZĞILI', N'substituted_out_home', 0),
    (283739, 68, N'MUSAH MOHAMMED', N'substituted_in_away', N'FILIP YAVOROV KRASTEV', N'substituted_out_away', 0),
    (283740, 63, N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', N'substituted_in_home', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_home', 0),
    (283740, 83, N'MUHAMED BULJUBASIC', N'substituted_in_home', N'QAZIM LACI', N'substituted_out_home', 0),
    (283740, 83, N'YASER ESNEYDER ASPRILLA MARTINEZ', N'substituted_in_away', N'BARIŞ ALPER YILMAZ', N'substituted_out_away', 0),
    (283746, 51, N'NIKOLA STORM', N'substituted_in_home', N'RAMZI SAFURI', N'substituted_out_home', 0),
    (283746, 61, N'SAMET KARAKOÇ', N'substituted_in_home', N'DOĞUKAN SİNİK', N'substituted_out_home', 0),
    (283746, 60, N'KOUADOU JAURES ASSOUMOU', N'substituted_in_away', N'YALÇIN KAYAN', N'substituted_out_away', 0),
    (283746, 75, N'ELAYİS TAVSAN', N'substituted_in_away', N'MARIUS MOUNDILMADJI', N'substituted_out_away', 0),
    (283747, 85, N'JİM EMİLLEN NGOWET ALLEVINAH', N'substituted_in_home', N'ADRIAN DAWID BENEDYCZAK', N'substituted_out_home', 0),
    (283747, 78, N'AHMED TRAORE', N'substituted_in_away', N'BARIŞ JAKOB KALAYCI', N'substituted_out_away', 0),
    (283751, 55, N'ALEXIS ANTUNES GOMEZ', N'substituted_in_home', N'GUILERME LUIZ OLIVEIRA DA SILVA', N'substituted_out_home', 0),
    (283751, 46, N'JADEL CHANDA KATONGO', N'substituted_in_away', N'LIONEL JULES CAROLE', N'substituted_out_away', 0),
    (283751, 55, N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_in_away', N'LASZLO BENES', N'substituted_out_away', 0),
    (283751, 92, N'TALHA SARIARSLAN', N'substituted_in_away', N'FURKAN SOYALP', N'substituted_out_away', 0),
    (283753, 29, N'RAMAZAN CİVELEK', N'substituted_in_home', N'LIONEL JULES CAROLE', N'substituted_out_home', 0),
    (283753, 57, N'YOUSSEF AIT BENASSER', N'substituted_in_home', N'DORUKHAN TOKÖZ', N'substituted_out_home', 0),
    (283753, 79, N'TALHA SARIARSLAN', N'substituted_in_home', N'FURKAN SOYALP', N'substituted_out_home', 0),
    (283753, 88, N'BAHADIR ÖZTÜRK', N'substituted_in_away', N'ALEXANDER GERARD VAN DE STREEK', N'substituted_out_away', 0),
    (283757, 71, N'FELIX OHIS UDUOKHAI', N'substituted_in_home', N'EMİRHAN TOPÇU', N'substituted_out_home', 0),
    (283757, 76, N'CENGİZ ÜNDER', N'substituted_in_home', N'VACLAV CERNY', N'substituted_out_home', 0),
    (283757, 79, N'GUILERME LUIZ OLIVEIRA DA SILVA', N'substituted_in_away', N'JUAN SANTOS DA SILVA', N'substituted_out_away', 0),
    (283760, 70, N'ALTIN ZEQIRI', N'substituted_in_home', N'MIHAI-VALENTIN MIHAILA', N'substituted_out_home', 0),
    (283760, 65, N'SERDAR DURSUN', N'substituted_in_away', N'BRUNO PETKOVIC', N'substituted_out_away', 0),
    (283765, 87, N'WAGNER FABRICIO CARDOSO DE PINA', N'substituted_in_home', N'CHRIST RAVYNEL INAO OULAI', N'substituted_out_home', 0),
    (283765, 21, N'ANIL YİĞİT ÇINAR', N'substituted_in_away', N'DAVIDE BIRASCHI', N'substituted_out_away', 0),
    (283765, 46, N'BERKAY ÖZCAN', N'substituted_in_away', N'CLAUDIO MATIAS KRANEVITTER', N'substituted_out_away', 0),
    (283765, 63, N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_in_away', N'SAM ANDREAS LARSSON', N'substituted_out_away', 0),
    (283766, 25, N'CARL JOHAN HOLSE JUSTESEN', N'substituted_in_home', N'KOUADOU JAURES ASSOUMOU', N'substituted_out_home', 1),
    (283766, 89, N'ALI BADRA DIABATE', N'substituted_in_home', N'CELİL YÜKSEL', N'substituted_out_home', 0),
    (283766, 46, N'DEIAN CRISTIAN SORESCU', N'substituted_in_away', N'LEO MYENTY JANNA ABENA', N'substituted_out_away', 0),
    (283766, 57, N'VICTOR NTINO-EMO GIDADO', N'substituted_in_away', N'DRISSA CAMARA', N'substituted_out_away', 0),
    (283766, 67, N'ALEXANDRU IULIAN MAXIM', N'substituted_in_away', N'OGÜN ÖZÇİÇEK', N'substituted_out_away', 0),
    (283771, 62, N'MUHAMMET TAHA ŞAHİN', N'substituted_in_home', N'CASPER SOMMER HOJER', N'substituted_out_home', 1),
    (283771, 59, N'DARIO SARIC', N'substituted_in_away', N'NIKOLA STORM', N'substituted_out_away', 0),
    (283771, 68, N'SAMET KARAKOÇ', N'substituted_in_away', N'DOĞUKAN SİNİK', N'substituted_out_away', 0),
    (283771, 85, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_away', N'BÜNYAMİN BALCI', N'substituted_out_away', 0),
    (283774, 20, N'LEO MYENTY JANNA ABENA', N'substituted_in_home', N'KEVIN MANUEL RODRIGUES', N'substituted_out_home', 0),
    (283774, 46, N'DEIAN CRISTIAN SORESCU', N'substituted_in_home', N'MELİH KABASAKAL', N'substituted_out_home', 0),
    (283774, 59, N'VICTOR NTINO-EMO GIDADO', N'substituted_in_home', N'DRISSA CAMARA', N'substituted_out_home', 0),
    (283774, 46, N'FATİH KURUCUK', N'substituted_in_away', N'DAVIDE BIRASCHI', N'substituted_out_away', 0),
    (283774, 80, N'ABDUL KADER MOUSSA KONE', N'substituted_in_away', N'BARIŞ JAKOB KALAYCI', N'substituted_out_away', 0),
    (283775, 35, N'KAZIMCAN KARATAŞ', N'substituted_in_home', N'CHRİSTOPHER TEA DOMORAUD OPERI', N'substituted_out_home', 1),
    (283775, 46, N'IVAN BRNIC', N'substituted_in_home', N'ABBOSBEK FAYZULLAYEV', N'substituted_out_home', 0),
    (283775, 74, N'HAMZA GÜRELER', N'substituted_in_home', N'YUSUF SARI', N'substituted_out_home', 0),
    (283775, 93, N'TAHA ALTIKARDEŞ', N'substituted_in_away', N'MALCOM NARCISSE BOKELE MPUTU', N'substituted_out_away', 1),
    (283779, 75, N'CENK TOSUN', N'substituted_in_home', N'ADRIAN DAWID BENEDYCZAK', N'substituted_out_home', 0),
    (283779, 87, N'JİM EMİLLEN NGOWET ALLEVINAH', N'substituted_in_home', N'FOUSSENI DIABATE', N'substituted_out_home', 0),
    (283779, 96, N'KEREM DEMİRBAY', N'substituted_in_home', N'AHMED MORTADHA BEN OUANES', N'substituted_out_home', 0),
    (283779, 72, N'CHARLES ANDRE RAUX YAO', N'substituted_in_away', N'JEROME JUNIOR ONGUENE', N'substituted_out_away', 0),
    (283782, 85, N'MUSAH MOHAMMED', N'substituted_in_home', N'MOHAMMED AMIN CHERNI', N'substituted_out_home', 0),
    (283782, 89, N'EFKAN BEKİROĞLU', N'substituted_in_home', N'JUAN SANTOS DA SILVA', N'substituted_out_home', 0),
    (283782, 93, N'İBRAHİM KAYA', N'substituted_in_away', N'NUNO MIGUEL REIS LIMA', N'substituted_out_away', 0),
    (283784, 80, N'ABDÜLKADİR ÖMÜR', N'substituted_in_home', N'BÜNYAMİN BALCI', N'substituted_out_home', 0),
    (283784, 84, N'ERDOĞAN YEŞİLYURT', N'substituted_in_home', N'DARIO SARIC', N'substituted_out_home', 0),
    (283784, 75, N'VICTOR NTINO-EMO GIDADO', N'substituted_in_away', N'OGÜN ÖZÇİÇEK', N'substituted_out_away', 0),
    (283784, 80, N'DRISSA CAMARA', N'substituted_in_away', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_away', 0),
    (283785, 55, N'BERKAY ÖZCAN', N'substituted_in_home', N'SAM ANDREAS LARSSON', N'substituted_out_home', 0),
    (283785, 64, N'SHAVY WARREN BABICKA', N'substituted_in_home', N'BARTUĞ ELMAZ', N'substituted_out_home', 0),
    (283785, 78, N'OĞUZ AYDIN', N'substituted_in_away', N'MÜNİR LEVENT MERCAN', N'substituted_out_away', 0),
    (283786, 46, N'OLEKSANDR ZUBKOV', N'substituted_in_home', N'MATHIAS JOHAN FJORTOFT LOVIK', N'substituted_out_home', 0),
    (283786, 65, N'WAGNER FABRICIO CARDOSO DE PINA', N'substituted_in_home', N'FELIPE AUGUSTO DA SILVA', N'substituted_out_home', 0),
    (283786, 75, N'MEHMET UMUT NAYİR', N'substituted_in_home', N'OZAN TUFAN', N'substituted_out_home', 0),
    (283786, 65, N'LOIDE ANTONIO AUGUSTO', N'substituted_in_away', N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', N'substituted_out_away', 0),
    (283786, 75, N'FRANTZDY PIERROT', N'substituted_in_away', N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_out_away', 0),
    (283792, 46, N'GERMAN ONUGKHA', N'substituted_in_home', N'FURKAN SOYALP', N'substituted_out_home', 0),
    (283792, 56, N'DENIS MAKAROV', N'substituted_in_home', N'JOAO SABINO MENDES NETO SARAIVA', N'substituted_out_home', 0),
    (283792, 75, N'GÖRKEM SAĞLAM', N'substituted_in_home', N'YOUSSEF AIT BENASSER', N'substituted_out_home', 0),
    (283792, 80, N'JADEL CHANDA KATONGO', N'substituted_in_home', N'RAMAZAN CİVELEK', N'substituted_out_home', 0),
    (283792, 62, N'SHAVY WARREN BABICKA', N'substituted_in_away', N'BARIŞ JAKOB KALAYCI', N'substituted_out_away', 0),
    (283792, 68, N'DANIEL ANTHONY JOHNSON', N'substituted_in_away', N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_out_away', 0),
    (283794, 73, N'ALEXIS ANTUNES GOMEZ', N'substituted_in_home', N'EFKAN BEKİROĞLU', N'substituted_out_home', 0),
    (283794, 79, N'LUCAS SEBASTIAN TORREIRA DI PASCUA', N'substituted_in_away', N'İLKAY GÜNDOĞAN', N'substituted_out_away', 0),
    (283796, 68, N'İBRAHİM KAYA', N'substituted_in_home', N'IANIS HAGI', N'substituted_out_home', 0),
    (283796, 70, N'ARDA ÖZYAR', N'substituted_in_away', N'SERDAR DURSUN', N'substituted_out_away', 0),
    (283796, 79, N'CAN KELEŞ', N'substituted_in_away', N'HABIB ALI KEITA', N'substituted_out_away', 0),
    (283796, 87, N'SAMET YALÇIN', N'substituted_in_away', N'DANIEL EBENEZER KWASI AGYEI', N'substituted_out_away', 0),
    (283800, 46, N'YUSUF KARHAN KABADAYI', N'substituted_in_home', N'MOHAMED LAMINE BAYO', N'substituted_out_home', 0),
    (283800, 52, N'KEVIN MANUEL RODRIGUES', N'substituted_in_home', N'DRISSA CAMARA', N'substituted_out_home', 0),
    (283800, 89, N'DENIS MIHAI DRAGUS', N'substituted_in_home', N'CHRISTOPHER LUNGOYI', N'substituted_out_home', 0),
    (283800, 40, N'İBRAHİM KAYA', N'substituted_in_away', N'IANIS HAGI', N'substituted_out_away', 1),
    (283802, 46, N'MATEJ HANOUSEK', N'substituted_in_home', N'OĞULCAN ÜLGÜN', N'substituted_out_home', 0),
    (283802, 82, N'CİHAN ÇANAK', N'substituted_in_home', N'AYOTOMIWA SHERIF DELE BASHIRU', N'substituted_out_home', 0),
    (283802, 46, N'FILIP YAVOROV KRASTEV', N'substituted_in_away', N'ALEXIS ANTUNES GOMEZ', N'substituted_out_away', 0),
    (283802, 62, N'JUAN SANTOS DA SILVA', N'substituted_in_away', N'JEFERSON MARINHO DOS SANTOS', N'substituted_out_away', 0),
    (283802, 87, N'GUILERME LUIZ OLIVEIRA DA SILVA', N'substituted_in_away', N'JANDERSON DE CARVALHO COSTA', N'substituted_out_away', 0),
    (283804, 69, N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_in_home', N'DANIELE VERDE', N'substituted_out_home', 0),
    (283804, 76, N'BARIŞ JAKOB KALAYCI', N'substituted_in_home', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_home', 0),
    (283804, 60, N'ALI SOWE', N'substituted_in_away', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_away', 0),
    (283806, 66, N'OGÜN BAYRAK', N'substituted_in_home', N'ARDA OKAN KURTULAN', N'substituted_out_home', 0),
    (283806, 92, N'GUILERME LUIZ OLIVEIRA DA SILVA', N'substituted_in_home', N'MALCOM NARCISSE BOKELE MPUTU', N'substituted_out_home', 0),
    (283806, 84, N'NICHOLAS OPOKU', N'substituted_in_away', N'GODFRİED AYESU OWUSU FRİMPONG', N'substituted_out_away', 0),
    (283806, 88, N'CENK TOSUN', N'substituted_in_away', N'ADRIAN DAWID BENEDYCZAK', N'substituted_out_away', 0),
    (283806, 96, N'TAYLAN UTKU AYDIN', N'substituted_in_away', N'FOUSSENI DIABATE', N'substituted_out_away', 0),
    (283808, 81, N'STEVE MICHEL KEVİN MOUNIE', N'substituted_in_home', N'GÜVEN YALÇIN', N'substituted_out_home', 0),
    (283808, 89, N'FATİH AKSOY', N'substituted_in_home', N'NICOLAS JEAN PAUL NOEL JANVIER', N'substituted_out_home', 0),
    (283808, 77, N'MEHMET UMUT NAYİR', N'substituted_in_away', N'OZAN TUFAN', N'substituted_out_away', 0),
    (283808, 84, N'MATHIAS JOHAN FJORTOFT LOVIK', N'substituted_in_away', N'ANTHONY NNADUZOR NWAKAEME', N'substituted_out_away', 0),
    (283808, 89, N'BENJAMIN BOUCHOUARI', N'substituted_in_away', N'FELIPE AUGUSTO DA SILVA', N'substituted_out_away', 0),
    (283809, 74, N'ANGEL YESID TORRES QUINONES', N'substituted_in_home', N'LUCAS FELIPE CALEGARI', N'substituted_out_home', 0),
    (283809, 77, N'LENNY JEAN PIERRE PINTOR', N'substituted_in_home', N'CHARLES ANDRE RAUX YAO', N'substituted_out_home', 0),
    (283811, 65, N'HALİL İBRAHİM DERVİŞOĞLU', N'substituted_in_home', N'OLASUNKANMI IBRAHIM OLAWOYIN', N'substituted_out_home', 0),
    (283811, 72, N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', N'substituted_in_home', N'LOIDE ANTONIO AUGUSTO', N'substituted_out_home', 0),
    (283811, 72, N'KARAMBA GASSAMA', N'substituted_in_away', N'ALEXANDRU IULIAN MAXIM', N'substituted_out_away', 0),
    (283811, 85, N'DENIS MIHAI DRAGUS', N'substituted_in_away', N'DRISSA CAMARA', N'substituted_out_away', 0),
    (283816, 74, N'JESPER ISMAILA CEESAY', N'substituted_in_home', N'SONER DİKMEN', N'substituted_out_home', 0),
    (283816, 87, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_home', N'BÜNYAMİN BALCI', N'substituted_out_home', 0),
    (283816, 46, N'JACKSON KYANVUBU MULEKA', N'substituted_in_away', N'BLAZ KRAMER', N'substituted_out_away', 0),
    (283816, 80, N'SANDER SVENDSEN', N'substituted_in_away', N'DENİZ TÜRÜÇ', N'substituted_out_away', 0),
    (283816, 85, N'RIECHEDLY GUILLERMO BAZOER', N'substituted_in_away', N'DIOGO ANTONIO CUPIDO GONÇALVES', N'substituted_out_away', 0),
    (283818, 75, N'EYÜP AYDIN', N'substituted_in_home', N'AHMED MORTADHA BEN OUANES', N'substituted_out_home', 0),
    (283818, 67, N'BRUNO VIANA WILLEMEM DA SILVA', N'substituted_in_away', N'ÜMİT AKDAĞ', N'substituted_out_away', 0),
    (283820, 64, N'SERDAR DURSUN', N'substituted_in_home', N'RIGOBERTO MANUEL RIVAS VINDEL', N'substituted_out_home', 0),
    (283820, 74, N'DARKO CHURLINOV', N'substituted_in_home', N'TAYFUR BİNGÖL', N'substituted_out_home', 0),
    (283820, 25, N'ARDA OKAN KURTULAN', N'substituted_in_away', N'OGÜN BAYRAK', N'substituted_out_away', 0),
    (283822, 70, N'İSMAİL YÜKSEK', N'substituted_in_home', N'SIDIKI CHERIF', N'substituted_out_home', 0),
    (283822, 87, N'MUHAMMET TAHA ŞAHİN', N'substituted_in_away', N'CASPER SOMMER HOJER', N'substituted_out_away', 0),
    (283825, 68, N'UĞUR KAAN YILDIZ', N'substituted_in_home', N'FILIP YAVOROV KRASTEV', N'substituted_out_home', 0),
    (283825, 88, N'OGÜN BAYRAK', N'substituted_in_home', N'MUSAH MOHAMMED', N'substituted_out_home', 0),
    (283825, 62, N'ABDÜLKADİR ÖMÜR', N'substituted_in_away', N'NIKOLA STORM', N'substituted_out_away', 0),
    (283825, 72, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_away', N'JESPER ISMAILA CEESAY', N'substituted_out_away', 0),
    (283825, 81, N'BÜNYAMİN BALCI', N'substituted_in_away', N'KENNETH IMMANUEL PAAL', N'substituted_out_away', 0),
    (283827, 72, N'ANTOINE MAKOUMBOU', N'substituted_in_away', N'JULES OLIVIER NTCHAM', N'substituted_out_away', 0),
    (283828, 66, N'VACLAV CERNY', N'substituted_in_home', N'MILOT RASHICA', N'substituted_out_home', 0),
    (283828, 72, N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_in_away', N'BARTUĞ ELMAZ', N'substituted_out_away', 0),
    (283831, 72, N'FEDOR CHALOV', N'substituted_in_home', N'DENIS MAKAROV', N'substituted_out_home', 0),
    (283831, 86, N'GÖRKEM SAĞLAM', N'substituted_in_home', N'DORUKHAN TOKÖZ', N'substituted_out_home', 0),
    (283831, 67, N'EMRECAN BULUT', N'substituted_in_away', N'ADEDIRE EMMANUEL OLUWATOFUNMI AWOKOYA-MEBUDE', N'substituted_out_away', 0),
    (283832, 75, N'AYOTOMIWA SHERIF DELE BASHIRU', N'substituted_in_home', N'SAMED ONUR', N'substituted_out_home', 0),
    (283832, 85, N'CİHAN ÇANAK', N'substituted_in_home', N'METEHAN MİMAROĞLU', N'substituted_out_home', 0),
    (283832, 62, N'DARKO CHURLINOV', N'substituted_in_away', N'TAYFUR BİNGÖL', N'substituted_out_away', 0),
    (283832, 75, N'FURKAN GEDİK', N'substituted_in_away', N'DANIEL EBENEZER KWASI AGYEI', N'substituted_out_away', 0),
    (283832, 89, N'AHMET SAĞAT', N'substituted_in_away', N'JOSEPH NONGE BOENDE', N'substituted_out_away', 0),
    (283834, 87, N'MUHAMED BULJUBASIC', N'substituted_in_home', N'ALI SOWE', N'substituted_out_home', 0),
    (283834, 72, N'İSMAİL ESAT BUĞA', N'substituted_in_away', N'KARAHAN YASİR SUBAŞI', N'substituted_out_away', 0),
    (283834, 78, N'EREN CEMALİ YAĞMUR', N'substituted_in_away', N'RIECHEDLY GUILLERMO BAZOER', N'substituted_out_away', 0),
    (283836, 69, N'NIKOLA STORM', N'substituted_in_home', N'DOĞUKAN SİNİK', N'substituted_out_home', 0),
    (283836, 92, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_home', N'RAMZI SAFURI', N'substituted_out_home', 0),
    (283836, 77, N'IANIS HAGI', N'substituted_in_away', N'UI JO HWANG', N'substituted_out_away', 0),
    (283838, 46, N'CHRIST RAVYNEL INAO OULAI', N'substituted_in_home', N'ERNEST MUÇİ', N'substituted_out_home', 0),
    (283838, 85, N'MEHMET UMUT NAYİR', N'substituted_in_home', N'FELIPE AUGUSTO DA SILVA', N'substituted_out_home', 0),
    (283838, 96, N'TAHA ALTIKARDEŞ', N'substituted_in_away', N'NOVATUS DISMAS MIROSHI', N'substituted_out_away', 0),
    (283840, 59, N'BARTUĞ ELMAZ', N'substituted_in_home', N'BERKAY ÖZCAN', N'substituted_out_home', 0),
    (283840, 83, N'ANIL YİĞİT ÇINAR', N'substituted_in_home', N'TİAGO SÜER BARBAROS ÇUKUR', N'substituted_out_home', 0),
    (283840, 91, N'ÇAĞTAY KURUKALIP', N'substituted_in_home', N'SHAVY WARREN BABICKA', N'substituted_out_home', 0),
    (283840, 69, N'CİHAN ÇANAK', N'substituted_in_away', N'SAMED ONUR', N'substituted_out_away', 0),
    (283846, 60, N'TAYFUR BİNGÖL', N'substituted_in_home', N'CAN KELEŞ', N'substituted_out_home', 0),
    (283846, 72, N'DARKO CHURLINOV', N'substituted_in_home', N'MAHAMADOU SUSOHO SISSOHO', N'substituted_out_home', 0),
    (283846, 87, N'ESAT YUSUF NARİN', N'substituted_in_home', N'MANUEL LUIS DA SILVA CAFUMANA', N'substituted_out_home', 0),
    (283846, 58, N'DANIELE VERDE', N'substituted_in_away', N'CLAUDIO MATIAS KRANEVITTER', N'substituted_out_away', 0),
    (283846, 67, N'ANIL YİĞİT ÇINAR', N'substituted_in_away', N'SERGIO ANTONIO DA LUZ JUNIOR', N'substituted_out_away', 0),
    (283846, 89, N'BARIŞ JAKOB KALAYCI', N'substituted_in_away', N'SHAVY WARREN BABICKA', N'substituted_out_away', 0),
    (283852, 66, N'FURKAN SOYALP', N'substituted_in_home', N'DORUKHAN TOKÖZ', N'substituted_out_home', 0),
    (283852, 85, N'SAMUEL JAMES MATHER', N'substituted_in_home', N'FEDOR CHALOV', N'substituted_out_home', 0),
    (283852, 66, N'AHMET KUSAY DAĞDEVİR', N'substituted_in_away', N'EREN CEMALİ YAĞMUR', N'substituted_out_away', 0),
    (283852, 85, N'EGEMEN AYDIN', N'substituted_in_away', N'DENİZ ERTAŞ', N'substituted_out_away', 0),
    (283854, 64, N'SHAVY WARREN BABICKA', N'substituted_in_home', N'AHMED TRAORE', N'substituted_out_home', 0),
    (283857, 79, N'AHMED MORTADHA BEN OUANES', N'substituted_in_home', N'FOUSSENI DIABATE', N'substituted_out_home', 0),
    (283857, 90, N'PAPE HABIB GUEYE', N'substituted_in_home', N'ADRIAN DAWID BENEDYCZAK', N'substituted_out_home', 0),
    (283857, 46, N'BATUHAN AHMET ŞEN', N'substituted_in_away', N'GÜNAY GÜVENÇ', N'substituted_out_away', 0),
    (283857, 60, N'AHMED KUTUCU', N'substituted_in_away', N'RENATO SAM-NA NHAGA', N'substituted_out_away', 0),
    (283857, 93, N'CAN ARMANDO GÜNER', N'substituted_in_away', N'LEROY AZIZ SANE', N'substituted_out_away', 0),
    (283857, 96, N'ADA YÜZGEÇ', N'substituted_in_away', N'İLKAY GÜNDOĞAN', N'substituted_out_away', 0),
    (283858, 65, N'OUSMANE DIABATE', N'substituted_in_away', N'CİHAN ÇANAK', N'substituted_out_away', 0),
    (283858, 93, N'ENSAR KEMALOĞLU', N'substituted_in_away', N'METEHAN MİMAROĞLU', N'substituted_out_away', 0),
    (283859, 46, N'NIKOLA STORM', N'substituted_in_home', N'JESPER ISMAILA CEESAY', N'substituted_out_home', 0),
    (283859, 66, N'YOHAN ALEXANDRE MADY BOLI', N'substituted_in_home', N'RAMZI SAFURI', N'substituted_out_home', 0),
    (283859, 86, N'BAHADIR ÖZTÜRK', N'substituted_in_home', N'ABDÜLKADİR ÖMÜR', N'substituted_out_home', 0),
    (283859, 38, N'JOSEPH NONGE BOENDE', N'substituted_in_away', N'HABIB ALI KEITA', N'substituted_out_away', 0),
    (283859, 46, N'TAYFUR BİNGÖL', N'substituted_in_away', N'AHMET OĞUZ', N'substituted_out_away', 0),
    (283859, 64, N'SERDAR DURSUN', N'substituted_in_away', N'DARKO CHURLINOV', N'substituted_out_away', 0),
    (283859, 71, N'ESAT YUSUF NARİN', N'substituted_in_away', N'DANIEL EBENEZER KWASI AGYEI', N'substituted_out_away', 0);

IF (SELECT COUNT(*) FROM @SubstitutionInput) <> 370
    THROW 51323, 'Expected 370 unambiguous source-matched substitutions.', 1;

-- Source: TFF match sheet
-- 283555: https://www.tff.org/Default.aspx?macId=283555&pageID=29
-- 283556: https://www.tff.org/Default.aspx?macId=283556&pageID=29
-- 283558: https://www.tff.org/Default.aspx?macId=283558&pageID=29
-- 283559: https://www.tff.org/Default.aspx?macId=283559&pageID=29
-- 283561: https://www.tff.org/Default.aspx?macId=283561&pageID=29
-- 283563: https://www.tff.org/Default.aspx?macId=283563&pageID=29
-- 283564: https://www.tff.org/Default.aspx?macId=283564&pageID=29
-- 283565: https://www.tff.org/Default.aspx?macId=283565&pageID=29
-- 283566: https://www.tff.org/Default.aspx?macId=283566&pageID=29
-- 283567: https://www.tff.org/Default.aspx?macId=283567&pageID=29
-- 283569: https://www.tff.org/Default.aspx?macId=283569&pageID=29
-- 283571: https://www.tff.org/Default.aspx?macId=283571&pageID=29
-- 283573: https://www.tff.org/Default.aspx?macId=283573&pageID=29
-- 283577: https://www.tff.org/Default.aspx?macId=283577&pageID=29
-- 283578: https://www.tff.org/Default.aspx?macId=283578&pageID=29
-- 283582: https://www.tff.org/Default.aspx?macId=283582&pageID=29
-- 283589: https://www.tff.org/Default.aspx?macId=283589&pageID=29
-- 283595: https://www.tff.org/Default.aspx?macId=283595&pageID=29
-- 283600: https://www.tff.org/Default.aspx?macId=283600&pageID=29
-- 283602: https://www.tff.org/Default.aspx?macId=283602&pageID=29
-- 283605: https://www.tff.org/Default.aspx?macId=283605&pageID=29
-- 283606: https://www.tff.org/Default.aspx?macId=283606&pageID=29
-- 283614: https://www.tff.org/Default.aspx?macId=283614&pageID=29
-- 283618: https://www.tff.org/Default.aspx?macId=283618&pageID=29
-- 283621: https://www.tff.org/Default.aspx?macId=283621&pageID=29
-- 283625: https://www.tff.org/Default.aspx?macId=283625&pageID=29
-- 283626: https://www.tff.org/Default.aspx?macId=283626&pageID=29
-- 283632: https://www.tff.org/Default.aspx?macId=283632&pageID=29
-- 283639: https://www.tff.org/Default.aspx?macId=283639&pageID=29
-- 283644: https://www.tff.org/Default.aspx?macId=283644&pageID=29
-- 283647: https://www.tff.org/Default.aspx?macId=283647&pageID=29
-- 283656: https://www.tff.org/Default.aspx?macId=283656&pageID=29
-- 283658: https://www.tff.org/Default.aspx?macId=283658&pageID=29
-- 283661: https://www.tff.org/Default.aspx?macId=283661&pageID=29
-- 283665: https://www.tff.org/Default.aspx?macId=283665&pageID=29
-- 283669: https://www.tff.org/Default.aspx?macId=283669&pageID=29
-- 283673: https://www.tff.org/Default.aspx?macId=283673&pageID=29
-- 283676: https://www.tff.org/Default.aspx?macId=283676&pageID=29
-- 283678: https://www.tff.org/Default.aspx?macId=283678&pageID=29
-- 283681: https://www.tff.org/Default.aspx?macId=283681&pageID=29
-- 283693: https://www.tff.org/Default.aspx?macId=283693&pageID=29
-- 283697: https://www.tff.org/Default.aspx?macId=283697&pageID=29
-- 283698: https://www.tff.org/Default.aspx?macId=283698&pageID=29
-- 283699: https://www.tff.org/Default.aspx?macId=283699&pageID=29
-- 283700: https://www.tff.org/Default.aspx?macId=283700&pageID=29
-- 283701: https://www.tff.org/Default.aspx?macId=283701&pageID=29
-- 283709: https://www.tff.org/Default.aspx?macId=283709&pageID=29
-- 283710: https://www.tff.org/Default.aspx?macId=283710&pageID=29
-- 283714: https://www.tff.org/Default.aspx?macId=283714&pageID=29
-- 283716: https://www.tff.org/Default.aspx?macId=283716&pageID=29
-- 283717: https://www.tff.org/Default.aspx?macId=283717&pageID=29
-- 283718: https://www.tff.org/Default.aspx?macId=283718&pageID=29
-- 283721: https://www.tff.org/Default.aspx?macId=283721&pageID=29
-- Sahadan confirms İsmail Yüksek's injury interruption before his 38th-minute substitution: https://www.sahadan.com/mac/fenerbahce-vs-goztepe/8zrj2jnpldzvzu1fhjqb9q978/anlatim
-- 283722: https://www.tff.org/Default.aspx?macId=283722&pageID=29
-- 283729: https://www.tff.org/Default.aspx?macId=283729&pageID=29
-- 283733: https://www.tff.org/Default.aspx?macId=283733&pageID=29
-- 283739: https://www.tff.org/Default.aspx?macId=283739&pageID=29
-- 283740: https://www.tff.org/Default.aspx?macId=283740&pageID=29
-- 283746: https://www.tff.org/Default.aspx?macId=283746&pageID=29
-- 283747: https://www.tff.org/Default.aspx?macId=283747&pageID=29
-- 283751: https://www.tff.org/Default.aspx?macId=283751&pageID=29
-- 283753: https://www.tff.org/Default.aspx?macId=283753&pageID=29
-- 283755: https://www.tff.org/Default.aspx?macId=283755&pageID=29
-- 283757: https://www.tff.org/Default.aspx?macId=283757&pageID=29
-- 283760: https://www.tff.org/Default.aspx?macId=283760&pageID=29
-- 283765: https://www.tff.org/Default.aspx?macId=283765&pageID=29
-- 283766: https://www.tff.org/Default.aspx?macId=283766&pageID=29
-- 283771: https://www.tff.org/Default.aspx?macId=283771&pageID=29
-- 283774: https://www.tff.org/Default.aspx?macId=283774&pageID=29
-- 283775: https://www.tff.org/Default.aspx?macId=283775&pageID=29
-- 283779: https://www.tff.org/Default.aspx?macId=283779&pageID=29
-- 283782: https://www.tff.org/Default.aspx?macId=283782&pageID=29
-- 283784: https://www.tff.org/Default.aspx?macId=283784&pageID=29
-- 283785: https://www.tff.org/Default.aspx?macId=283785&pageID=29
-- 283786: https://www.tff.org/Default.aspx?macId=283786&pageID=29
-- 283792: https://www.tff.org/Default.aspx?macId=283792&pageID=29
-- 283794: https://www.tff.org/Default.aspx?macId=283794&pageID=29
-- 283796: https://www.tff.org/Default.aspx?macId=283796&pageID=29
-- 283800: https://www.tff.org/Default.aspx?macId=283800&pageID=29
-- 283802: https://www.tff.org/Default.aspx?macId=283802&pageID=29
-- 283804: https://www.tff.org/Default.aspx?macId=283804&pageID=29
-- 283806: https://www.tff.org/Default.aspx?macId=283806&pageID=29
-- 283808: https://www.tff.org/Default.aspx?macId=283808&pageID=29
-- 283809: https://www.tff.org/Default.aspx?macId=283809&pageID=29
-- 283811: https://www.tff.org/Default.aspx?macId=283811&pageID=29
-- 283816: https://www.tff.org/Default.aspx?macId=283816&pageID=29
-- 283818: https://www.tff.org/Default.aspx?macId=283818&pageID=29
-- 283820: https://www.tff.org/Default.aspx?macId=283820&pageID=29
-- 283822: https://www.tff.org/Default.aspx?macId=283822&pageID=29
-- 283825: https://www.tff.org/Default.aspx?macId=283825&pageID=29
-- 283827: https://www.tff.org/Default.aspx?macId=283827&pageID=29
-- 283828: https://www.tff.org/Default.aspx?macId=283828&pageID=29
-- 283831: https://www.tff.org/Default.aspx?macId=283831&pageID=29
-- 283832: https://www.tff.org/Default.aspx?macId=283832&pageID=29
-- 283834: https://www.tff.org/Default.aspx?macId=283834&pageID=29
-- 283836: https://www.tff.org/Default.aspx?macId=283836&pageID=29
-- 283838: https://www.tff.org/Default.aspx?macId=283838&pageID=29
-- 283840: https://www.tff.org/Default.aspx?macId=283840&pageID=29
-- 283846: https://www.tff.org/Default.aspx?macId=283846&pageID=29
-- 283852: https://www.tff.org/Default.aspx?macId=283852&pageID=29
-- 283854: https://www.tff.org/Default.aspx?macId=283854&pageID=29
-- 283857: https://www.tff.org/Default.aspx?macId=283857&pageID=29
-- 283858: https://www.tff.org/Default.aspx?macId=283858&pageID=29
-- 283859: https://www.tff.org/Default.aspx?macId=283859&pageID=29

DECLARE @MatchMap TABLE (
    source_match_id INT NOT NULL PRIMARY KEY,
    match_id INT NOT NULL UNIQUE
);

INSERT INTO @MatchMap (source_match_id, match_id)
SELECT input.source_match_id, match_row.match_id
FROM @MatchInput AS input
INNER JOIN dbo.season AS season ON season.name = N'2025-2026'
INNER JOIN dbo.[match] AS match_row
    ON match_row.season_id = season.season_id AND match_row.week = input.week
INNER JOIN dbo.club AS home_club
    ON home_club.club_id = match_row.home_club_id AND home_club.name = input.home_club_name
INNER JOIN dbo.club AS away_club
    ON away_club.club_id = match_row.away_club_id AND away_club.name = input.away_club_name;

IF (SELECT COUNT(*) FROM @MatchMap) <> 104
    THROW 51320, 'Each selected source fixture must resolve to exactly one match row.', 1;

IF EXISTS (
    SELECT 1
    FROM @SubstitutionInput AS input
    INNER JOIN @MatchMap AS match_map ON match_map.source_match_id = input.source_match_id
    LEFT JOIN dbo.person AS incoming_person ON incoming_person.name = input.incoming_player_name
    LEFT JOIN dbo.player AS incoming_player ON incoming_player.person_id = incoming_person.person_id
    LEFT JOIN dbo.appearance AS incoming_appearance
        ON incoming_appearance.match_id = match_map.match_id
        AND incoming_appearance.player_id = incoming_player.person_id
    LEFT JOIN dbo.person AS outgoing_person ON outgoing_person.name = input.outgoing_player_name
    LEFT JOIN dbo.player AS outgoing_player ON outgoing_player.person_id = outgoing_person.person_id
    LEFT JOIN dbo.appearance AS outgoing_appearance
        ON outgoing_appearance.match_id = match_map.match_id
        AND outgoing_appearance.player_id = outgoing_player.person_id
    WHERE incoming_appearance.player_id IS NULL OR outgoing_appearance.player_id IS NULL
)
    THROW 51321, 'Each substitution participant must resolve to a player with a match appearance.', 1;

IF EXISTS (
    SELECT 1
    FROM @MatchMap AS match_map
    INNER JOIN dbo.substitution AS existing_substitution
        ON existing_substitution.match_id = match_map.match_id
)
    THROW 51322, 'Substitution rows already exist for a selected fixture.', 1;

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
            ORDER BY input.minute, input.incoming_player_name, input.outgoing_player_name
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

SELECT
    COUNT(*) AS sourced_substitution_events,
    SUM(CASE WHEN is_injury = 1 THEN 1 ELSE 0 END) AS injury_substitution_events
FROM @EventMap;
