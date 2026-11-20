# Turkish Süper Lig Database

A relational database project for clubs, players, matches, and match events in Turkey's top football division.

## Scope

- Sample data for one season
- Microsoft SQL Server and SQL Server Management Studio
- SQL-based workflow with no user interface
- Clubs, stadiums, players, coaches, referees, seasons, matches, appearances, and match events

## Planned Outputs

- League table
- Top scorers
- Cards by club
- Clubs played for by a player

## Implementation Status

- The scripts have been executed against SQL Server 2022 (database `TurkishSuperLeague2526`) in the documented order, and the loaded data has been validated against TFF records.
- The 18-table schema covers every relation, entity, and attribute in the proposal and EER; the integrity script and four reporting views are drafted.
- `sql/turkish-super-league-reference-data.sql` seeds the 2025-2026 season, its 18 clubs, their TFF profile stadiums, and source-backed club colours.
- `sql/turkish-super-league-player-data.sql` contains 599 contracted roster rows across 18 teams and 599 distinct TFF license numbers. All 18 club blocks have been selected for the post-winter 2025-2026 rosters using TFF's final A-team lists and owner-provided squad screenshots. The latest review includes 28 Gençlerbirliği players, 25 Antalyaspor players, and 28 Fatih Karagümrük players; Antalyaspor includes one screenshot-backed U21 first-team player verified in TFF senior-match records. Verified winter transfers are reconciled across clubs, including Rodrigo Nascimento Franca from Fenerbahçe to Kasımpaşa, Emir Ortakaya from Eyüpspor to Rizespor, and Bedirhan Özyurt from Alanyaspor to Eyüpspor. The four big-club blocks remain closed; revisit them only if another roster review reveals a concrete conflict. Ensar Buğra Tivsiz and Deniz Ceylan are omitted from the roster because they had no professional contract during 2025-2026. TFF's first-window Rizespor and Gaziantep PDFs returned errors after retries.
- `sql/turkish-super-league-match-participant-profiles.sql` adds profiles for 18 additional players confirmed in TFF match sheets, including season-overlapping contract periods for the nine players with verified professional contracts. The other nine have player profiles for their recorded match appearances but no season contract row. Together, the seeds contain 617 distinct player profiles and 608 professional contract periods.
- `sql/turkish-super-league-coach-referee-data.sql` contains 35 coach profiles, 42 coaching periods within the 2025-2026 season, and 29 referee profiles with TFF class values. UEFA A is recorded for Burak Yılmaz and Selçuk Şahin based on their participation in UEFA Pro courses and the TFF Pro-course prerequisite; this does not claim that either had completed a Pro diploma.
- The match relation follows the approved model: season, home club, away club, referee, and week; it has no date, kickoff-time, or venue attributes.
- `sql/turkish-super-league-match-data.sql` seeds all 306 2025-2026 fixtures.
- `sql/turkish-super-league-match-event-sample.sql` seeds the first fixture's 31 appearances and 17 events: 5 goals, 3 cards, and 9 substitutions.
- `sql/turkish-super-league-match-event-progress.sql` seeds 201 additional fixtures with source-matched appearances and event records; ambiguous same-minute groups are added by source-backed substitution supplements.
- `sql/turkish-super-league-match-event-progress-batch-2.sql` adds 84 fixtures with 2,610 appearances, 196 goals, and 377 cards. It does not seed substitution events pending source verification.
- `sql/turkish-super-league-match-event-progress-batch-3.sql` adds the remaining 20 fixtures with 622 appearances, 58 goals, and 95 cards. All 306 fixtures now have sourced appearance, goal, and card data.
- `sql/turkish-super-league-match-event-substitutions-progress.sql` adds 370 substitutions that have one incoming and one outgoing player at that minute in the TFF sheet. Across the event seeds and supplements through supplement 61, all 2,702 nonstarter appearances have a unique source-verified substitution pairing (100%). All 37 rows marked as injury-related are covered by the match-specific source table below.
- `sql/turkish-super-league-match-event-substitutions-supplement-1.sql` adds eight pairings confirmed by the DHA report for Antalyaspor-Fatih Karagümrük (TFF match 283582).
- `sql/turkish-super-league-match-event-substitutions-supplement-2.sql` adds ten pairings confirmed by eScored and Live-Result for Alanyaspor-Samsunspor (TFF match 283827).
- `sql/turkish-super-league-match-event-substitutions-supplement-3.sql` adds eight pairings confirmed by club and match reports for Galatasaray-Fatih Karagümrük (TFF match 283569).
- `sql/turkish-super-league-match-event-substitutions-supplement-4.sql` adds nine pairings confirmed by Transfermarkt for Başakşehir-Kayserispor (TFF match 283567).
- `sql/turkish-super-league-match-event-substitutions-supplement-5.sql` adds eight pairings confirmed by match reports for Gençlerbirliği-Eyüpspor (TFF match 283606).
- `sql/turkish-super-league-match-event-substitutions-supplement-6.sql` adds 32 pairings confirmed by match reports for four fixtures (TFF matches 283614, 283632, 283658, and 283669).
- `sql/turkish-super-league-match-event-substitutions-supplement-7.sql` adds seven pairings confirmed by Beşiktaş and Transfermarkt for Beşiktaş-Eyüpspor (TFF match 283565).
- `sql/turkish-super-league-match-event-substitutions-supplement-8.sql` adds eight pairings confirmed by Transfermarkt for Trabzonspor-Konyaspor (TFF match 283673).
- `sql/turkish-super-league-match-event-substitutions-supplement-9.sql` adds seven pairings confirmed by Transfermarkt for Fatih Karagümrük-Başakşehir (TFF match 283558).
- `sql/turkish-super-league-match-event-substitutions-supplement-10.sql` adds six pairings confirmed by Transfermarkt for Konyaspor-Beşiktaş (TFF match 283573).
- `sql/turkish-super-league-match-event-substitutions-supplement-11.sql` adds five pairings confirmed by Transfermarkt for Gaziantep-Gençlerbirliği (TFF match 283577).
- `sql/turkish-super-league-match-event-substitutions-supplement-12.sql` adds six pairings confirmed by match reports for Gaziantep-Galatasaray (TFF match 283559).
- `sql/turkish-super-league-match-event-substitutions-supplement-13.sql` adds five pairings confirmed by match reports for Antalyaspor-Kasımpaşa (TFF match 283555).
- `sql/turkish-super-league-match-event-substitutions-supplement-14.sql` adds four pairings confirmed by match reports for Trabzonspor-Kocaelispor (TFF match 283556).
- `sql/turkish-super-league-match-event-substitutions-supplement-15.sql` adds four pairings confirmed by match reports for Çaykur Rizespor-Göztepe (TFF match 283561).
- `sql/turkish-super-league-match-event-substitutions-supplement-16.sql` adds two pairings confirmed by match reports for Kasımpaşa-Trabzonspor (TFF match 283563).
- `sql/turkish-super-league-match-event-substitutions-supplement-17.sql` adds two pairings confirmed by match reports for Konyaspor-Gaziantep (TFF match 283564).
- `sql/turkish-super-league-match-event-substitutions-supplement-18.sql` adds four pairings confirmed by match reports for Alanyaspor-Rizespor (TFF match 283566).
- `sql/turkish-super-league-match-event-substitutions-supplement-19.sql` adds four pairings confirmed by match reports for Fenerbahçe-Kocaelispor (TFF match 283578).
- `sql/turkish-super-league-match-event-substitutions-supplement-20.sql` adds four pairings confirmed by match reports for Kocaelispor-Kayserispor (TFF match 283589).
- `sql/turkish-super-league-match-event-substitutions-supplement-21.sql` adds two pairings confirmed by the match report for Fatih Karagümrük-Kayserispor (TFF match 283639).
- `sql/turkish-super-league-match-event-substitutions-supplement-22.sql` adds two pairings confirmed by the match report for Kocaelispor-Eyüpspor (TFF match 283625).
- `sql/turkish-super-league-match-event-substitutions-supplement-23.sql` adds four pairings confirmed by the match report for Fatih Karagümrük-Gaziantep (TFF match 283621).
- `sql/turkish-super-league-match-event-substitutions-supplement-24.sql` adds five pairings confirmed by the match report for Eyüpspor-Kasımpaşa (TFF match 283626).
- `sql/turkish-super-league-match-event-substitutions-supplement-25.sql` adds two pairings confirmed by the match report for Eyüpspor-Antalyaspor (TFF match 283644).
- `sql/turkish-super-league-match-event-substitutions-supplement-26.sql` adds four pairings confirmed by match reports for Kocaelispor-Galatasaray (TFF match 283661).
- `sql/turkish-super-league-match-event-substitutions-supplement-27.sql` adds four pairings confirmed by match reports for Alanyaspor-Kasımpaşa (TFF match 283665).
- `sql/turkish-super-league-match-event-substitutions-supplement-28.sql` adds four pairings confirmed by match reports for Alanyaspor-Gaziantep (TFF match 283647).
- `sql/turkish-super-league-match-event-substitutions-supplement-29.sql` adds two pairings confirmed by match reports for Kocaelispor-Samsunspor (TFF match 283571).
- `sql/turkish-super-league-match-event-substitutions-supplement-30.sql` adds 25 pairings confirmed by match reports for Gaziantep-Kocaelispor, Antalyaspor-Kayserispor, Samsunspor-Fatih Karagümrük, and Galatasaray-Konyaspor (TFF matches 283595, 283600, 283602, and 283605).
- `sql/turkish-super-league-match-event-substitutions-supplement-31.sql` adds six pairings confirmed by the match report for Antalyaspor-Çaykur Rizespor (TFF match 283618).
- `sql/turkish-super-league-match-event-substitutions-supplement-33.sql` adds six pairings confirmed by match reports for Fatih Karagümrük-Gaziantep and Kocaelispor-Eyüpspor (TFF matches 283621 and 283625).
- `sql/turkish-super-league-match-event-substitutions-supplement-34.sql` adds 19 report-confirmed substitutions for Samsunspor-Eyüpspor, Gaziantep-Eyüpspor, Çaykur Rizespor-Kayserispor, and Konyaspor-Çaykur Rizespor (TFF matches 283656, 283676, 283678, and 283681).
- `sql/turkish-super-league-match-event-substitutions-supplement-44.sql` adds eight TFF and match-report-confirmed pairings for Trabzonspor-Rizespor and Kayserispor-Fatih Karagümrük (TFF matches 283786 and 283792).
- `sql/turkish-super-league-match-event-substitutions-supplement-45.sql` adds ten TFF and match-report-confirmed pairings for Göztepe-Galatasaray and Alanyaspor-Kocaelispor (TFF matches 283794 and 283796).
- `sql/turkish-super-league-match-event-substitutions-supplement-46.sql` adds four report-confirmed pairings for Fenerbahçe-Göztepe (TFF match 283721).
- `sql/turkish-super-league-match-event-substitutions-supplement-47.sql` adds seven TFF and Sport.pl-confirmed pairings for Göztepe-Alanyaspor (TFF match 283782).
- `sql/turkish-super-league-match-event-substitutions-supplement-48.sql` adds 28 TFF and match-report-confirmed pairings for four fixtures (TFF matches 283822, 283834, 283836, and 283854).
- `sql/turkish-super-league-match-event-substitutions-supplement-49.sql` adds 18 TFF and match-report-confirmed pairings for Gaziantep-Alanyaspor, Fatih Karagümrük-Rizespor, and Eyüpspor-Samsunspor (TFF matches 283800, 283804, and 283809).
- `sql/turkish-super-league-match-event-substitutions-supplement-50.sql` adds 18 TFF and match-report-confirmed pairings for Rizespor-Kocaelispor, Kasımpaşa-Alanyaspor, and Kocaelispor-Göztepe (TFF matches 283760, 283818, and 283820).
- `sql/turkish-super-league-match-event-substitutions-supplement-51.sql` adds twelve TFF and match-report-confirmed pairings for Trabzonspor-Göztepe and Fatih Karagümrük-Gençlerbirliği (TFF matches 283838 and 283840).
- `sql/turkish-super-league-match-event-substitutions-supplement-52.sql` adds six TFF and Score Hub-confirmed pairings for Trabzonspor-Gençlerbirliği (TFF match 283858).
- `sql/turkish-super-league-match-event-substitutions-supplement-53.sql` adds twelve TFF and club-confirmed pairings for Beşiktaş-Fatih Karagümrük and Kayserispor-Rizespor (TFF matches 283828 and 283831).
- `sql/turkish-super-league-match-event-substitutions-supplement-54.sql` adds twenty TFF and club/report-confirmed pairings across Samsunspor-Gaziantep, Gençlerbirliği-Göztepe, Rizespor-Gaziantep, and Antalyaspor-Konyaspor (TFF matches 283766, 283802, 283811, and 283816).
- `sql/turkish-super-league-match-event-substitutions-supplement-55.sql` adds sixteen TFF and match-report-confirmed pairings across Kasımpaşa-Trabzonspor, Konyaspor-Gaziantep, Fatih Karagümrük-Kayserispor, and Göztepe-Fatih Karagümrük (TFF matches 283563, 283564, 283639, and 283729).
- `sql/turkish-super-league-match-event-substitutions-supplement-56.sql` adds sixteen TFF and match-report-confirmed pairings across Antalyaspor-Samsunspor, Kayserispor-Antalyaspor, Beşiktaş-Göztepe, and Kasımpaşa-Eyüpspor (TFF matches 283746, 283753, 283757, and 283779).
- `sql/turkish-super-league-match-event-substitutions-supplement-57.sql` adds eight TFF and match-report-confirmed pairings across Rizespor-Göztepe, Alanyaspor-Rizespor, Kocaelispor-Samsunspor, and Fenerbahçe-Kocaelispor (TFF matches 283561, 283566, 283571, and 283578).
- `sql/turkish-super-league-match-event-substitutions-supplement-58.sql` adds nine TFF and match-report-confirmed pairings across Kocaelispor-Kayserispor, Eyüpspor-Antalyaspor, Alanyaspor-Kasımpaşa, and Konyaspor-Rizespor (TFF matches 283589, 283644, 283665, and 283681).
- `sql/turkish-super-league-match-event-substitutions-supplement-59.sql` adds nine TFF and match-report-confirmed pairings across Konyaspor-Göztepe, Kasımpaşa-Fatih Karagümrük, Göztepe-Kayserispor, and Trabzonspor-Fatih Karagümrük (TFF matches 283739, 283747, 283751, and 283765).
- `sql/turkish-super-league-match-event-substitutions-supplement-60.sql` adds twelve TFF and match-report-confirmed pairings across Alanyaspor-Kocaelispor, Göztepe-Kasımpaşa, Alanyaspor-Trabzonspor, and Göztepe-Antalyaspor (TFF matches 283796, 283806, 283808, and 283825). Sources include [TFF match details](https://www.tff.org/Default.aspx?macId=283796&pageID=528), [Mynet](https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924501-corendon-alanyaspor-kocaelispor), [Tele Skor](https://www.teleskor.com.tr/mac/goztepe-kasimpasa-2545119), [Sporx](https://m.sporx.com/canliskorlar/alanyaspor-trabzonspor-maci-goller-kartlar-4842567), and [FotMob](https://www.fotmob.com/matches/goztepe-vs-antalyaspor/4ffdf).
- `sql/turkish-super-league-match-event-substitutions-supplement-61.sql` adds thirteen TFF and match-report-confirmed pairings across Gençlerbirliği-Kocaelispor, Kocaelispor-Fatih Karagümrük, Kayserispor-Konyaspor, and Kasımpaşa-Galatasaray (TFF matches 283832, 283846, 283852, and 283857). Sources include [TFF](https://www.tff.org/Default.aspx?macId=283832&pageID=29), [Transfermarkt](https://www.transfermarkt.com/vorbericht/index/spielbericht/4648046), [FotMob](https://www.fotmob.com/tr/matches/kocaelispor-vs-fatih-karagumruk/3zelx), [eScored](https://escored.com/match/kayserispor-konyaspor-2026-05-17/), [Galatasaray](https://www.galatasaray.org/haber/futbol/kasimpasa-1-0-galatasaray/60311), and [Mynet](https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924558-kasimpasa-galatasaray).
- `sql/turkish-super-league-match-event-cards-supplement-1.sql`: load the 14 TFF cards recorded with the minute code `MS`, stored as minute 90.

### Injury-Cause Audit

All 37 substitution rows with `is_injury = 1` were checked individually. Each has match-specific source evidence; no injury flag remains unsupported. The audit covers the rows flagged as injury-related; rows flagged 0 have not been swept against match reports, apart from the fixtures reviewed here. TFF remains authoritative for match identity, participants, and minute, while the linked reports establish the injury cause.

| TFF match | Match-specific cause evidence |
|---:|---|
| 283565 | [Beşiktaş match centre](https://www.bjk.com.tr/tr/mobil/mac_merkezi_canli/23784) and [Transfermarkt](https://www.transfermarkt.co.in/spielbericht/index/spielbericht/4646349) |
| 283600 | [Transfermarkt](https://www.transfermarkt.co.in/vorbericht/index/spielbericht/4646436) |
| 283602 | [Transfermarkt](https://www.transfermarkt.com/vorbericht/index/spielbericht/4646438) and [T-Online event log](https://www.t-online.de/sport/live-ticker/fussball/turkish-super-lig/sdc_fm-54026/samsunspor-fatih-karaguemruek-turkish-super-lig-im-liveticker.html) |
| 283614 | [Transfermarkt](https://www.transfermarkt.com.tr/fenerbahce-sk_antalyaspor/index/spielbericht/4646734) |
| 283621 | [Transfermarkt](https://www.transfermarkt.com.tr/spielbericht/index/spielbericht/4647834) |
| 283626 | [Transfermarkt](https://www.transfermarkt.com.tr/eyupspor-kasimpasa/index/spielbericht/4647839) |
| 283656 | [En Pelotas event log](https://www.enpelotas.com/en/soccer/matches/samsunspor-vs-eyupspor-n-495818) |
| 283661 | [beIN SPORTS injury report](https://beinsports.com.tr/haber/galatasarayda-sakatlik-oyuna-devam-edemedi) |
| 283676 | [Transfermarkt](https://www.transfermarkt.com.tr/spielbericht/index/spielbericht/4647881) |
| 283678 | [Transfermarkt](https://www.transfermarkt.com/spielbericht/index/spielbericht/4647883) |
| 283681 | [Transfermarkt](https://www.transfermarkt.ch/konyaspor_caykur-rizespor/index/spielbericht/4647859) |
| 283697 | [e-Scorespot event log](https://e-scorespot.com/match/kayserispor-alanyaspor/84835) |
| 283698 | [Transfermarkt](https://www.transfermarkt.com/eyupspor_fenerbahce/index/spielbericht/4647912) |
| 283700 | [Sahadan event log](https://www.sahadan.com/en/match/besiktas-vs-c-rizespor/8rfofyx4975kpnc6yxas515as/commentary) |
| 283709 | [Transfermarkt](https://www.transfermarkt.com/spielbericht/index/spielbericht/4647923) and [Sahadan event log](https://www.sahadan.com/mac/kocaelispor-vs-trabzonspor/8v0akgoke9jg43yrj1qmegutw/anlatim) |
| 283721 | [Sahadan event log](https://www.sahadan.com/mac/fenerbahce-vs-goztepe/8zrj2jnpldzvzu1fhjqb9q978/anlatim) |
| 283766 | [Samsun Gazetesi event log](https://www.samsungazetesi.com/samsunspor-gaziantep-fk-maci-canli-anlatim) |
| 283771 | [Sahadan event log](https://www.sahadan.com/mac/c-rizespor-vs-antalyaspor/9kc0bud2nnl3u38n3i0zewdg4/anlatim) |
| 283775 | [Sahadan event log](https://www.sahadan.com/mac/basaksehir-vs-goztepe/9lwijsfyxlm81k44ybwiriz9w/anlatim) |
| 283794 | [Galatasaray medical report](https://www.galatasaray.org/haber/futbol/acibadem-saglik-raporu/acibadem-saglik-raporu/60069) |
| 283800 | [Sahadan event log](https://www.sahadan.com/mac/gaziantep-fk-vs-alanyaspor/9vxgjl7z2o4ljotod3v3emz9w/anlatim) |
| 283554 | [Transfermarkt](https://www.transfermarkt.com.tr/eyupspor_konyaspor/index/spielbericht/4646338) marks both substitutions as `Sakatlık` |
| 283695 | [Transfermarkt](https://www.transfermarkt.com.tr/spielbericht/index/spielbericht/4647873) marks both the 54th- and 67th-minute substitutions as `Sakatlık` |

- Match-event participants must have an appearance in that match, except card participants: a card may be shown to a squad member who never entered the field. Run `dbo.assert_match_event_subtypes_complete` after data loading to verify every event has exactly one goal, card, or substitution subtype.
- Own goals use the `own_goal_by_home_player` and `own_goal_by_away_player` roles, so the league-table view credits them to the club that benefits. The scorer roles are reserved for goals credited to the scorer's own club.
- The selected sample season is 2025-2026.
- Official TFF season, squad, match, and profile records are the primary data sources.
- All 306 TFF fixture results reconcile with the computed final records for the 18 clubs; all 306 linked match details now confirm the score and goal-event total.
- The [TFF detail page for Alanyaspor 1-3 Eyüpspor](https://www.tff.org/Default.aspx?macId=283725&pageID=29), which timed out in an earlier review, is now accessible and exposes its lineups, goals, cards, and substitution minutes.
- TFF goal type codes are `F` (foot), `H` (header), `K` (own goal), and `P` (penalty); card colours are yellow and red.
- Include numbered first-team players. Exclude unnumbered academy entries, while retaining unnumbered players whose 2025-2026 loan is confirmed by TFF. All 599 selected roster rows have birth date, nationality, position, and a professional contract period overlapping the season, matched to TFF records and the supplied squad screenshots. The additional 18 participant profiles are sourced from TFF match sheets; no professional contract row is added where no season-overlapping contract is recorded. Coach profiles and season coaching periods are prepared. All 29 main referees have profiles. Source-backed match data is prepared for all 306 fixtures. Match-event data has appearance, goal, card, and substitution pairings for all fixtures. The substitution inputs match all 2,702 nonstarter appearances with a unique source-verified pairing (100%); supplements 57-61 add 51 source-verified pairings. All 37 `is_injury` values are source-audited; see the match-specific source table above. The SQL scripts have been executed and validated against SQL Server. TFF match-sheet player links expose license numbers for matching participants to roster records. For `appearance`, use starters and substitutes who entered; do not count unused substitutes. Store stoppage notation as elapsed integer minutes (`45+12` as `57`, `90+4` as `94`).
- Do not use a post-2025-2026 contract start date as the historical season contract. Omit players without a season-overlapping professional contract from the contracted roster and do not create contract rows for them; retain profiles required by official match-sheet appearances.
- The league-table view applies TFF head-to-head tie-break rules while keeping the proposal and EER table set unchanged.

## SQL Scripts

- `sql/turkish-super-league-schema.sql`: create the relational tables and constraints.
- `sql/turkish-super-league-reference-data.sql`: seed source-backed 2025-2026 clubs, colours, stadiums, and season participation.
- `sql/turkish-super-league-player-data.sql`: load the 599 sourced roster profiles and their 599 professional contract periods.
- `sql/turkish-super-league-match-participant-profiles.sql`: load 18 additional match participant profiles and nine sourced season contract periods.
- `sql/turkish-super-league-coach-referee-data.sql`: load sourced coach and referee profiles and season coaching periods.
- `sql/turkish-super-league-match-data.sql`: load all 306 fixtures.
- `sql/turkish-super-league-match-event-sample.sql`: load appearances and events for the first fixture.
- `sql/turkish-super-league-match-event-progress.sql`: load the first 201 additional fixture event batches.
- `sql/turkish-super-league-match-event-progress-batch-2.sql`: load appearances, goals, and cards for 84 additional fixtures; substitution events are deferred.
- `sql/turkish-super-league-match-event-progress-batch-3.sql`: load appearances, goals, and cards for the final 20 additional fixtures; substitution events are deferred.
- `sql/turkish-super-league-match-event-substitutions-progress.sql`: load 370 unique-minute substitutions from the 104 fixtures covered by batches 2 and 3.
- `sql/turkish-super-league-match-event-substitutions-supplement-1.sql`: load eight DHA-confirmed same-minute substitution pairings.
- `sql/turkish-super-league-match-event-substitutions-supplement-2.sql`: load ten pairings confirmed for Alanyaspor-Samsunspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-3.sql`: load eight pairings confirmed for Galatasaray-Fatih Karagümrük.
- `sql/turkish-super-league-match-event-substitutions-supplement-4.sql`: load nine pairings confirmed for Başakşehir-Kayserispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-5.sql`: load eight pairings confirmed for Gençlerbirliği-Eyüpspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-6.sql`: load 32 report-confirmed pairings for four fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-7.sql`: load seven report-confirmed pairings for Beşiktaş-Eyüpspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-8.sql`: load eight Transfermarkt-confirmed pairings for Trabzonspor-Konyaspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-9.sql`: load seven Transfermarkt-confirmed pairings for Fatih Karagümrük-Başakşehir.
- `sql/turkish-super-league-match-event-substitutions-supplement-10.sql`: load six Transfermarkt-confirmed pairings for Konyaspor-Beşiktaş.
- `sql/turkish-super-league-match-event-substitutions-supplement-11.sql`: load five Transfermarkt-confirmed pairings for Gaziantep-Gençlerbirliği.
- `sql/turkish-super-league-match-event-substitutions-supplement-12.sql`: load six report-confirmed pairings for Gaziantep-Galatasaray.
- `sql/turkish-super-league-match-event-substitutions-supplement-13.sql`: load five report-confirmed pairings for Antalyaspor-Kasımpaşa.
- `sql/turkish-super-league-match-event-substitutions-supplement-14.sql`: load four report-confirmed pairings for Trabzonspor-Kocaelispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-15.sql`: load four report-confirmed pairings for Çaykur Rizespor-Göztepe.
- `sql/turkish-super-league-match-event-substitutions-supplement-16.sql`: load two report-confirmed pairings for Kasımpaşa-Trabzonspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-17.sql`: load two report-confirmed pairings for Konyaspor-Gaziantep.
- `sql/turkish-super-league-match-event-substitutions-supplement-18.sql`: load four report-confirmed pairings for Alanyaspor-Rizespor.
- `sql/turkish-super-league-match-event-substitutions-supplement-19.sql`: load four report-confirmed pairings for Fenerbahçe-Kocaelispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-20.sql`: load four report-confirmed pairings for Kocaelispor-Kayserispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-21.sql`: load two report-confirmed pairings for Fatih Karagümrük-Kayserispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-22.sql`: load two report-confirmed pairings for Kocaelispor-Eyüpspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-23.sql`: load four report-confirmed pairings for Fatih Karagümrük-Gaziantep.
- `sql/turkish-super-league-match-event-substitutions-supplement-24.sql`: load five report-confirmed pairings for Eyüpspor-Kasımpaşa.
- `sql/turkish-super-league-match-event-substitutions-supplement-25.sql`: load two report-confirmed pairings for Eyüpspor-Antalyaspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-26.sql`: load four report-confirmed pairings for Kocaelispor-Galatasaray.
- `sql/turkish-super-league-match-event-substitutions-supplement-27.sql`: load four report-confirmed pairings for Alanyaspor-Kasımpaşa.
- `sql/turkish-super-league-match-event-substitutions-supplement-28.sql`: load four report-confirmed pairings for Alanyaspor-Gaziantep.
- `sql/turkish-super-league-match-event-substitutions-supplement-29.sql`: load two report-confirmed pairings for Kocaelispor-Samsunspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-30.sql`: load 25 report-confirmed pairings for four fixtures from weeks 5 and 6.
- `sql/turkish-super-league-match-event-substitutions-supplement-31.sql`: load six report-confirmed pairings for Antalyaspor-Çaykur Rizespor.
- `sql/turkish-super-league-match-event-substitutions-supplement-33.sql`: load six report-confirmed pairings for Fatih Karagümrük-Gaziantep and Kocaelispor-Eyüpspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-34.sql`: load 19 report-confirmed substitutions for Samsunspor-Eyüpspor, Gaziantep-Eyüpspor, Çaykur Rizespor-Kayserispor, and Konyaspor-Çaykur Rizespor.
- `sql/turkish-super-league-match-event-substitutions-supplement-35.sql`: load 16 report-confirmed pairings for Fatih Karagümrük-Kocaelispor, Kayserispor-Alanyaspor, Eyüpspor-Fenerbahçe, and Konyaspor-Kayserispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-36.sql`: load 17 report-confirmed pairings for Beşiktaş-Rizespor, Alanyaspor-Fatih Karagümrük, Kocaelispor-Trabzonspor, and Gençlerbirliği-Samsunspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-37.sql`: load 16 report-confirmed pairings for Göztepe-Rizespor, Trabzonspor-Kasımpaşa, Gaziantep-Konyaspor, and Eyüpspor-Beşiktaş.
- `sql/turkish-super-league-match-event-substitutions-supplement-38.sql`: load 12 report-confirmed pairings for Fatih Karagümrük-Galatasaray, Göztepe-Fatih Karagümrük, and Galatasaray-Kayserispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-39.sql`: load 16 report-confirmed pairings for Konyaspor-Göztepe, Rizespor-Galatasaray, Kasımpaşa-Fatih Karagümrük, and Göztepe-Kayserispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-40.sql`: load 17 report-confirmed pairings for Kayserispor-Antalyaspor, Fatih Karagümrük-Samsunspor, Beşiktaş-Göztepe, Rizespor-Kocaelispor, and Trabzonspor-Fatih Karagümrük.
- `sql/turkish-super-league-match-event-substitutions-supplement-41.sql`: load four Mynet-confirmed pairings for Çaykur Rizespor-Antalyaspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-42.sql`: load eleven TFF and match-report-confirmed pairings for Gaziantep-Fatih Karagümrük and Başakşehir-Göztepe.
- `sql/turkish-super-league-match-event-substitutions-supplement-43.sql`: load eleven TFF and match-report-confirmed pairings for Antalyaspor-Gaziantep and Fatih Karagümrük-Fenerbahçe.
- `sql/turkish-super-league-match-event-substitutions-supplement-44.sql`: load eight TFF and match-report-confirmed pairings for Trabzonspor-Rizespor and Kayserispor-Fatih Karagümrük.
- `sql/turkish-super-league-match-event-substitutions-supplement-45.sql`: load ten TFF and match-report-confirmed pairings for Göztepe-Galatasaray and Alanyaspor-Kocaelispor.
- `sql/turkish-super-league-match-event-substitutions-supplement-46.sql`: load four report-confirmed pairings for Fenerbahçe-Göztepe.
- `sql/turkish-super-league-match-event-substitutions-supplement-47.sql`: load seven TFF and Sport.pl-confirmed pairings for Göztepe-Alanyaspor.
- `sql/turkish-super-league-match-event-substitutions-supplement-48.sql`: load 28 TFF and match-report-confirmed pairings for four fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-49.sql`: load 18 TFF and match-report-confirmed pairings for three fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-50.sql`: load 18 TFF and match-report-confirmed pairings for three fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-51.sql`: load twelve TFF and match-report-confirmed pairings for two fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-52.sql`: load six TFF and Score Hub-confirmed pairings for one fixture.
- `sql/turkish-super-league-match-event-substitutions-supplement-53.sql`: load twelve TFF and club-confirmed pairings for two fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-54.sql`: load twenty TFF and club/report-confirmed pairings for four fixtures.
- `sql/turkish-super-league-match-event-substitutions-supplement-55.sql`: load sixteen TFF and match-report-confirmed pairings for four fixtures.
- `sql/turkish-super-league-integrity.sql`: apply subtype and goal-lineup integrity rules.
- `sql/turkish-super-league-reports.sql`: create the league table, top scorers, cards by club, and player club history views.

## Setup

1. Create or select an empty SQL Server database.
2. Execute `sql/turkish-super-league-schema.sql` in SQL Server Management Studio.
3. Execute `sql/turkish-super-league-reference-data.sql` to load the available club and season reference rows.
4. Execute `sql/turkish-super-league-integrity.sql` before loading people and match data.
5. Execute `sql/turkish-super-league-reports.sql` after the schema exists.
6. Run `sql/turkish-super-league-player-data.sql` to load the 599 contracted roster profiles.
7. Run `sql/turkish-super-league-match-participant-profiles.sql` to load additional TFF match-sheet participants and their available contract periods.
8. Run `sql/turkish-super-league-coach-referee-data.sql` after player data and before match data.
9. Run `sql/turkish-super-league-match-data.sql` after the coach and referee data.
10. Run `sql/turkish-super-league-match-event-sample.sql` after match rows to load the first fixture's appearances and events.
11. Run `sql/turkish-super-league-match-event-progress.sql`, `sql/turkish-super-league-match-event-progress-batch-2.sql`, and `sql/turkish-super-league-match-event-progress-batch-3.sql` after the sample event script.
12. Run `sql/turkish-super-league-match-event-substitutions-progress.sql` after the appearance and goal/card scripts.
13. Run `sql/turkish-super-league-match-event-substitutions-supplement-1.sql` after the substitution progress script.
14. Run `sql/turkish-super-league-match-event-substitutions-supplement-2.sql` after supplement 1.
15. Run `sql/turkish-super-league-match-event-substitutions-supplement-3.sql` after supplement 2.
16. Run `sql/turkish-super-league-match-event-substitutions-supplement-4.sql` after supplement 3.
17. Run `sql/turkish-super-league-match-event-substitutions-supplement-5.sql` after supplement 4.
18. Run `sql/turkish-super-league-match-event-substitutions-supplement-6.sql` after supplement 5.
19. Run `sql/turkish-super-league-match-event-substitutions-supplement-7.sql` after supplement 6.
20. Run `sql/turkish-super-league-match-event-substitutions-supplement-8.sql` after supplement 7.
21. Run `sql/turkish-super-league-match-event-substitutions-supplement-9.sql` after supplement 8.
22. Run `sql/turkish-super-league-match-event-substitutions-supplement-10.sql` after supplement 9.
23. Run `sql/turkish-super-league-match-event-substitutions-supplement-11.sql` after supplement 10.
24. Run `sql/turkish-super-league-match-event-substitutions-supplement-12.sql` after supplement 11.
25. Run `sql/turkish-super-league-match-event-substitutions-supplement-13.sql` after supplement 12.
26. Run `sql/turkish-super-league-match-event-substitutions-supplement-14.sql` after supplement 13.
27. Run `sql/turkish-super-league-match-event-substitutions-supplement-15.sql` after supplement 14.
28. Run `sql/turkish-super-league-match-event-substitutions-supplement-16.sql` after supplement 15.
29. Run `sql/turkish-super-league-match-event-substitutions-supplement-17.sql` after supplement 16.
30. Run `sql/turkish-super-league-match-event-substitutions-supplement-18.sql` after supplement 17.
31. Run `sql/turkish-super-league-match-event-substitutions-supplement-19.sql` after supplement 18.
32. Run `sql/turkish-super-league-match-event-substitutions-supplement-20.sql` after supplement 19.
33. Run `sql/turkish-super-league-match-event-substitutions-supplement-21.sql` after supplement 20.
34. Run `sql/turkish-super-league-match-event-substitutions-supplement-22.sql` after supplement 21.
35. Run `sql/turkish-super-league-match-event-substitutions-supplement-23.sql` after supplement 22.
36. Run `sql/turkish-super-league-match-event-substitutions-supplement-24.sql` after supplement 23.
37. Run `sql/turkish-super-league-match-event-substitutions-supplement-25.sql` after supplement 24.
38. Run `sql/turkish-super-league-match-event-substitutions-supplement-26.sql` after supplement 25.
39. Run `sql/turkish-super-league-match-event-substitutions-supplement-27.sql` after supplement 26.
40. Run `sql/turkish-super-league-match-event-substitutions-supplement-28.sql` after supplement 27.
41. Run `sql/turkish-super-league-match-event-substitutions-supplement-29.sql` after supplement 28.
42. Run `sql/turkish-super-league-match-event-substitutions-supplement-30.sql` after supplement 29.
43. Run `sql/turkish-super-league-match-event-substitutions-supplement-31.sql` after supplement 30.
44. Run `sql/turkish-super-league-match-event-substitutions-supplement-33.sql` after supplement 31.
45. Run `sql/turkish-super-league-match-event-substitutions-supplement-34.sql` after supplement 33.
46. Run `sql/turkish-super-league-match-event-substitutions-supplement-35.sql` after supplement 34.
47. Run `sql/turkish-super-league-match-event-substitutions-supplement-36.sql` after supplement 35.
48. Run `sql/turkish-super-league-match-event-substitutions-supplement-37.sql` after supplement 36.
49. Run `sql/turkish-super-league-match-event-substitutions-supplement-38.sql` after supplement 37.
50. Run `sql/turkish-super-league-match-event-substitutions-supplement-39.sql` after supplement 38.
51. Run `sql/turkish-super-league-match-event-substitutions-supplement-40.sql` after supplement 39.
52. Run `sql/turkish-super-league-match-event-substitutions-supplement-41.sql` after supplement 40.
53. Run `sql/turkish-super-league-match-event-substitutions-supplement-42.sql` after supplement 41.
54. Run `sql/turkish-super-league-match-event-substitutions-supplement-43.sql` after supplement 42.
55. Run `sql/turkish-super-league-match-event-substitutions-supplement-44.sql` after supplement 43.
56. Run `sql/turkish-super-league-match-event-substitutions-supplement-45.sql` after supplement 44.
57. Run `sql/turkish-super-league-match-event-substitutions-supplement-46.sql` after supplement 45.
58. Run `sql/turkish-super-league-match-event-substitutions-supplement-47.sql` after supplement 46.
59. Run `sql/turkish-super-league-match-event-substitutions-supplement-48.sql` after supplement 47.
60. Run `sql/turkish-super-league-match-event-substitutions-supplement-49.sql` after supplement 48.
61. Run `sql/turkish-super-league-match-event-substitutions-supplement-50.sql` after supplement 49.
62. Run `sql/turkish-super-league-match-event-substitutions-supplement-51.sql` after supplement 50.
63. Run `sql/turkish-super-league-match-event-substitutions-supplement-52.sql` after supplement 51.
64. Run `sql/turkish-super-league-match-event-substitutions-supplement-53.sql` after supplement 52.
65. Run `sql/turkish-super-league-match-event-substitutions-supplement-54.sql` after supplement 53.
66. Run `sql/turkish-super-league-match-event-substitutions-supplement-55.sql` after supplement 54.
67. Run `sql/turkish-super-league-match-event-substitutions-supplement-56.sql` after supplement 55.
68. Run `sql/turkish-super-league-match-event-substitutions-supplement-57.sql` after supplement 56.
69. Run `sql/turkish-super-league-match-event-substitutions-supplement-58.sql` after supplement 57.
70. Run `sql/turkish-super-league-match-event-substitutions-supplement-59.sql` after supplement 58.
71. Run `sql/turkish-super-league-match-event-substitutions-supplement-60.sql` after supplement 59.
72. Run `sql/turkish-super-league-match-event-substitutions-supplement-61.sql` after supplement 60.
73. Run `sql/turkish-super-league-match-event-cards-supplement-1.sql` after supplement 61.
74. After all appearance and event scripts are loaded, run the event-subtype assertion:

```sql
EXEC dbo.assert_match_event_subtypes_complete;
```

To display the league table in TFF order, run:

```sql
SELECT *
FROM dbo.vw_league_table
ORDER BY league_position;
```

To display 2025-2026 player records in contiguous club-name blocks, run:

```sql
SELECT
    club.name AS club_name,
    person.name AS player_name,
    player.[position],
    person.birth_date,
    person.nationality,
    player_contract.start_date,
    player_contract.end_date
FROM dbo.[contract] AS player_contract
INNER JOIN dbo.club AS club
    ON club.club_id = player_contract.club_id
INNER JOIN dbo.player AS player
    ON player.person_id = player_contract.player_id
INNER JOIN dbo.person AS person
    ON person.person_id = player.person_id
WHERE player_contract.start_date <= '2026-06-30'
    AND player_contract.end_date >= '2025-07-01'
ORDER BY club.name, person.name;
```

Base tables have no guaranteed row order; use `ORDER BY` for grouped roster output.

## Validation Results

The full script set was executed in the documented order against SQL Server 2022 (database `TurkishSuperLeague2526`) and the loaded data was checked against TFF records.

Loaded rows: 18 clubs, 17 stadiums, 1 season, 18 season-club rows, 681 persons (617 players, 35 coaches, 29 referees), 608 contracts, 42 coaching periods, 306 matches, 9,434 appearances, 4,942 match events (812 goals, 1,428 cards, 2,702 substitutions).

Checks that passed:

- `dbo.assert_match_event_subtypes_complete` reports no violation; every match event has exactly one goal, card, or substitution subtype.
- 22 foreign keys and 8 check constraints exist and are trusted.
- No match has the same club on both sides, and both clubs of every match participate in the season.
- Every goal and substitution participant has an appearance in the same match; 2,702 non-starter appearances match 2,702 substitution-in participants one to one.
- All 306 computed match scores match the scores on the linked TFF match-detail pages.
- Per-match, per-club yellow and red card counts match the TFF match-detail pages for all 306 fixtures.
- The four report views return rows: league table (18), top scorers (234), cards by club (36), player-club history (608).

Corrections applied during loading:

- All 23 own goals were recorded with scorer roles, which credited them to the conceding club. They now use the `own_goal_by_home_player` and `own_goal_by_away_player` roles, which changed 21 match results and the final standings.
- 30 cards that TFF marks red were stored as yellow and have been corrected.
- The 54th-minute substitution in TFF match 283695 is flagged as injury-related, which the Transfermarkt report for that fixture confirms.
- The appearance requirement for event participants no longer applies to card participants, because 17 cards were shown to squad members who never entered the field.
- The appearance and event `VALUES` lists in `sql/turkish-super-league-match-event-progress.sql` and `...-progress-batch-2.sql` are split into statements of at most 900 rows, which is below the T-SQL limit of 1,000 row values per `INSERT`.
- The roster guard in `sql/turkish-super-league-coach-referee-data.sql` accepts 599 or more player profiles, so it passes after the match-participant profiles are loaded.

- The 14 cards that TFF records with the minute code `MS` instead of a numeric minute are loaded by `sql/turkish-super-league-match-event-cards-supplement-1.sql` with minute 90, so all 1,428 TFF cards are present: 1,362 yellow and 66 red.

## Reference Materials

The project follows the supplied proposal and EER diagram. Their original PDF files are retained locally and excluded from version control.

## 2025-2026 Data Sources

- [TFF season fixtures and standings](https://www.tff.org/default.aspx?pageID=1768)
- [TFF Çaykur Rizespor-Göztepe match detail](https://www.tff.org/Default.aspx?macId=283561&pageId=29)
- TFF [Rizespor-Antalyaspor match sheet](https://www.tff.org/Default.aspx?macId=283771&pageID=528), [Mynet event log](https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/1924482-caykur-rizespor-hesapcom-antalyaspor), and [Sahadan report](https://www.sahadan.com/mac/c-rizespor-vs-antalyaspor/9kc0bud2nnl3u38n3i0zewdg4/anlatim) for the 25th-week substitutions and Højer's forced exit
- TFF [Fenerbahçe-Göztepe match sheet](https://www.tff.org/Default.aspx?macId=283721&pageID=528) and [Sahadan event log](https://www.sahadan.com/mac/fenerbahce-vs-goztepe/8zrj2jnpldzvzu1fhjqb9q978/anlatim) for the same-minute substitutions and İsmail Yüksek's injury-related substitution
- TFF match sheets for [Fenerbahçe-Rizespor](https://www.tff.org/Default.aspx?macId=283822&pageID=29), [Rizespor-Konyaspor](https://www.tff.org/Default.aspx?macId=283834&pageID=29), [Antalyaspor-Alanyaspor](https://www.tff.org/Default.aspx?macId=283836&pageID=29), and [Fatih Karagümrük-Alanyaspor](https://www.tff.org/Default.aspx?macId=283854&pageID=29), with Mynet, DHA, and İHA reports for same-minute substitution pairings
- TFF [Trabzonspor-Göztepe match sheet](https://www.tff.org/Default.aspx?macId=283838&pageID=528), the [Habertürk/AA lineup report](https://yerel-haberler.haberturk.com/trabzon-haberleri/futbol-trendyol-super-lig-41273416), TFF [Fatih Karagümrük-Gençlerbirliği match sheet](https://www.tff.org/Default.aspx?macId=283840&pageID=528), and the [Sahadan event log](https://www.sahadan.com/mac/f-karagumruk-vs-genclerbirligi/abqmvvgltyq5wy4iokdaa8sus/anlatim) for same-minute pairings and official minutes
- TFF [Trabzonspor-Gençlerbirliği match sheet](https://www.tff.org/Default.aspx?macId=283858&pageID=528) and [Score Hub event log](https://score-hub.live/match/trabzonspor-vs-genclerbirligi-4475970) for substitution pairings and official TFF minutes
- TFF match sheets for [Konyaspor-Göztepe](https://www.tff.org/Default.aspx?macId=283739&pageID=29), [Kasımpaşa-Fatih Karagümrük](https://www.tff.org/Default.aspx?macId=283747&pageID=29), [Göztepe-Kayserispor](https://www.tff.org/Default.aspx?macId=283751&pageID=29), and [Trabzonspor-Fatih Karagümrük](https://www.tff.org/Default.aspx?macId=283765&pageID=29), with beIN SPORTS, Mynet, Envanternet, and DHA reports for same-minute substitution pairings
- TFF [Beşiktaş-Fatih Karagümrük match sheet](https://www.tff.org/Default.aspx?macId=283828&pageID=528) and the [Beşiktaş official match log](https://bjk.com.tr/tr/mac_merkezi/canli/24043), plus TFF [Kayserispor-Rizespor match sheet](https://www.tff.org/Default.aspx?macId=283831&pageID=528) and the [Kayserispor official match report](https://kayserispor.tr/mac-2025-2026-super-lig-kayserispor-2-0-caykur-rizespor-2711.html), for pairings and official minutes
- TFF match sheets for [Samsunspor-Gaziantep](https://www.tff.org/Default.aspx?macId=283766&pageID=528), [Gençlerbirliği-Göztepe](https://www.tff.org/Default.aspx?macId=283802&pageID=528), [Rizespor-Gaziantep](https://www.tff.org/Default.aspx?macId=283811&pageID=528), and [Antalyaspor-Konyaspor](https://www.tff.org/Default.aspx?macId=283816&pageID=528), with the [Gaziantep official match reports](https://www.gaziantepfk.org/haberler/mac-sonucu-samsunspor-0-0-gaziantep), [Gençlerbirliği official report](https://genclerbirligi.org.tr/haberler/natura-dunyasi-genclerbirligi-0-goztepe-2), and [DHA match report](https://www.dha.com.tr/yerel-haberler/antalya/hesap-com-antalyaspor-tumosan-konyaspor-0-2-2856963) for pairings
- TFF [Başakşehir-Fenerbahçe match sheet](https://www.tff.org/Default.aspx?macId=283684&pageID=29), [Transfermarkt match report](https://www.transfermarkt.com/spielbericht/index/spielbericht/4647862), and [Mackolik match page](https://www.mackolik.com/mac/ba%C5%9Fak%C5%9Fehir-vs-fenerbah%C3%A7e/8kzh5yckv04jn5pgencep280k) for the 78th-minute Fred–İsmail Yüksek substitution
- TFF [Gaziantep-Fatih Karagümrük](https://www.tff.org/Default.aspx?macId=283774&pageID=528) and [Başakşehir-Göztepe](https://www.tff.org/Default.aspx?macId=283775&pageID=528) match sheets, with the [Gaziantep FK match report](https://www.gaziantepfk.org/haberler/mac-sonucu-gaziantep-1-1-fatih-karagumruk) and [Sahadan event log](https://www.sahadan.com/mac/basaksehir-vs-goztepe/9lwijsfyxlm81k44ybwiriz9w/anlatim) for same-minute pairings and injury causes
- TFF [Antalyaspor-Gaziantep](https://www.tff.org/Default.aspx?macId=283784&pageID=528) and [Fatih Karagümrük-Fenerbahçe](https://www.tff.org/Default.aspx?macId=283785&pageID=29) match sheets, the [DHA Antalyaspor-Gaziantep report](https://www.dha.com.tr/spor/hesap-com-antalyaspor-gaziantep-fk-1-4-2836198), and [Sport.pl event timeline](https://wyniki.sport.pl/pilka-nozna/Super-Lig-71/Fatih-Karagumruk-Fenerbahce-4842544) for same-minute substitution pairings
- TFF [Samsunspor-Gaziantep match sheet](https://www.tff.org/Default.aspx?macId=283766&pageID=528) and [Samsun Gazetesi event log](https://www.samsungazetesi.com/samsunspor-gaziantep-fk-maci-canli-anlatim) for Jaurès Assoumou's injury substitution
- [TFF Kasımpaşa-Trabzonspor match detail](https://www.tff.org/Default.aspx?macId=283563&pageID=29) and [beIN SPORTS match report](https://beinsports.com.tr/haber/kasimpasa-trabzonspor-13) for same-minute substitution pairings
- TFF [Konyaspor-Gaziantep](https://www.tff.org/Default.aspx?macId=283564&pageID=29) and [Konyaspor's match report](https://www.konyaspor.org.tr/haber/evimizde-gaziantep-futbol-kulubunu-maglup-ettik-2) for same-minute substitution pairings
- TFF [Kasımpaşa-Trabzonspor](https://www.tff.org/Default.aspx?macId=283563&pageID=528), [Kasımpaşa's official report](https://www.kasimpasa.com.tr/tr/kasimpasa0-trabzonspor1_5667.html), and [Skorx event log](https://skorx.com.tr/mac/kasimpasa-sk-vs-trabzonspor-19442945) for same-minute substitution pairings
- TFF [Konyaspor-Gaziantep](https://www.tff.org/Default.aspx?macId=283564&pageID=528), [Gaziantep FK's report](https://www.gaziantepfk.org/haberler/mac-sonucu-konyaspor-3-0-gaziantep), and [Referans Gazetesi event log](https://www.referansgazetesi.com.tr/konyaspor-3-gaziantep-fk-0-mac-ozeti) for same-minute substitution pairings
- TFF [Fatih Karagümrük-Kayserispor](https://www.tff.org/Default.aspx?macId=283639&pageID=528) and [Sporx event log](https://m.sporx.com/fatih-karagumruk-kayserispor-maci-goller-kartlar-4842400) for same-minute substitution pairings
- TFF [Göztepe-Fatih Karagümrük](https://www.tff.org/Default.aspx?macId=283729&pageID=528) and [Yeni Haber match report](https://www.yenihaberden.com/goztepe-evinde-geri-dondu-tum-goller-ilk-yarida-geldi/1847703/) for same-minute substitution pairings; TFF minutes are retained where displayed minutes differ
- TFF [Alanyaspor-Rizespor](https://www.tff.org/Default.aspx?macId=283566&pageID=29), [Fotomaç's event log](https://www.fotomac.com.tr/canli-skor/alanyaspor-caykur_rizespor-maci-canli-anlatim-61720426), and [Alanya Postası's match report](https://alanyapostasicomtr.teimg.com/alanyapostasi-com-tr/uploads/2025/08/18-08-25-50dpi-50.pdf) for same-minute substitution pairings
- Official [first-window](https://www.tff.org/Default.aspx?ftxtId=48473&pageId=200) and [second-window](https://www.tff.org/default.aspx?ftxtID=49698&pageID=204) A-team player lists
- [TFF match detail example](https://www.tff.org/Default.aspx?macId=283853&pageId=29)
- [TFF Alanyaspor-Eyüpspor match detail](https://www.tff.org/Default.aspx?macId=283725&pageID=528) and linked [player profile with license number](https://www.tff.org/Default.aspx?kisiId=1506181&pageId=30)
- [BBC Alanyaspor-Eyüpspor match report](https://www.bbc.co.uk/sport/football/live/cr4kp0eqxext) for cross-checking same-minute substitutions
- [TFF Eyüpspor-Konyaspor match sheet](https://www.tff.org/Default.aspx?macId=283554&pageID=29), [MaçPeşinde event timeline](https://macpesinde.com/mac/super-lig/sezon-25-26/hafta-1/2025-08-10/eyupspor-vs-konyaspor/mac-gunu), and [Transfermarkt match report](https://www.transfermarkt.com.tr/eyupspor_konyaspor/index/spielbericht/4646338) for the first event sample
- TFF [player](https://www.tff.org/default.aspx?pageID=130), [technical director](https://www.tff.org/default.aspx?pageID=163), [referee](https://www.tff.org/default.aspx?pageID=161), and [club](https://www.tff.org/default.aspx?pageID=119) records from the Football Knowledge Bank
- TFF match sheets for [Beşiktaş-Rizespor](https://www.tff.org/Default.aspx?macId=283700&pageID=29), [Alanyaspor-Fatih Karagümrük](https://www.tff.org/Default.aspx?macId=283701&pageID=29), [Kocaelispor-Trabzonspor](https://www.tff.org/Default.aspx?macId=283709&pageID=29), and [Gençlerbirliği-Samsunspor](https://www.tff.org/Default.aspx?macId=283710&pageID=29), with [Transfermarkt reports for Beşiktaş-Rizespor](https://www.transfermarkt.ch/spielbericht/index/spielbericht/4647914), [Alanyaspor-Fatih Karagümrük](https://www.transfermarkt.com/alanyaspor_fatih-karagumruk/index/spielbericht/4647915), [Kocaelispor-Trabzonspor](https://www.transfermarkt.com/spielbericht/index/spielbericht/4647923), and [beIN SPORTS Gençlerbirliği-Samsunspor report](https://beinsports.com.tr/haber/genclerbirligi-samsunspor) for substitution pairings and, where noted, documented injury causes
- TFF match sheets for [Karagümrük-Kocaelispor](https://www.tff.org/Default.aspx?macId=283693&pageID=29), [Kayserispor-Alanyaspor](https://www.tff.org/Default.aspx?macId=283697&pageID=29), [Eyüpspor-Fenerbahçe](https://www.tff.org/Default.aspx?macId=283698&pageID=29), and [Konyaspor-Kayserispor](https://www.tff.org/Default.aspx?macId=283699&pageID=29), with [Mackolik](https://www.mackolik.com/mac/fatih-karag%C3%BCmr%C3%BCk-vs-kocaelispor/8omy9ua0pxg5n2yx9vcrrqolw) and [Transfermarkt reports](https://www.transfermarkt.com/spielbericht/index/spielbericht/4647875), [Eyüpspor-Fenerbahçe](https://www.transfermarkt.com/eyupspor_fenerbahce/index/spielbericht/4647912), [Konyaspor-Kayserispor](https://www.transfermarkt.com/spielbericht/index/spielbericht/4647913) for substitution pairings and documented causes
- TFF match sheets for [Göztepe-Rizespor](https://www.tff.org/Default.aspx?macId=283714&pageID=29), [Trabzonspor-Kasımpaşa](https://www.tff.org/Default.aspx?macId=283716&pageID=29), [Gaziantep-Konyaspor](https://www.tff.org/Default.aspx?macId=283717&pageID=29), and [Eyüpspor-Beşiktaş](https://www.tff.org/Default.aspx?macId=283718&pageID=29), with [beIN SPORTS reports for Göztepe-Rizespor](https://beinsports.com.tr/haber/goztepe-caykur-rizespor-6) and [Trabzonspor-Kasımpaşa](https://beinsports.com.tr/haber/trabzonspor-kasimpasa-13), [Gaziantep FK match report](https://www.gaziantepfk.org/haberler/mac-sonucu-gaziantep-1-1-konyaspor-2), and [Sahadan Eyüpspor-Beşiktaş report](https://www.sahadan.com/mac/eyupspor-vs-besiktas/8yl78ecnv1fqynawwtf5159uc/anlatim) for same-minute substitution pairings
- TFF profiles for [Asen Albayrak](https://www.tff.org/Default.aspx?hakemId=1518003&pageId=531), [Direnç Tonusluoğlu](https://www.tff.org/Default.aspx?hakemId=876678&pageId=531), [Fatih Tokail](https://www.tff.org/Default.aspx?hakemId=1623229&pageId=72), and [Melek Dakan](https://www.tff.org/Default.aspx?hakemId=1541469&pageId=531); supplementary profile dates for [Asen](https://www.transfermarkt.com.tr/asen-albayrak/profil/schiedsrichter/38934), [Direnç](https://www.transfermarkt.com/direnc-tonusluoglu/profil/schiedsrichter/27042), and [Fatih](https://www.transfermarkt.com.tr/fatih-tokail/profil/schiedsrichter/32957)
- TFF [upper-class referee list](https://www.tff.org/Resources/TFF/Auto/bbc6a25f4df049388d477f0a71433e8a.pdf) and [coach education regulations](https://www.tff.org/Resources/TFF/Documents/TALIMATLAR/Teknik-Adamlarin-E%C4%9Fitimi-ve-Siniflandirilmasi-Talimati.pdf)
- TFF stadium profiles linked from its official club and match pages
- Transfermarkt is a supplementary source only for fields missing from checked TFF records, such as [2025-2026 player positions](https://www.transfermarkt.com/galatasaray/kader/verein/141/saison_id/2025), [coach details](https://www.transfermarkt.com/nuri-sahin/profil/trainer/96813/sort/points), and [referee details](https://www.transfermarkt.com/yasin-kol/profil/schiedsrichter/9968/saison/2025/wettbewerb_id/TR1/plus/1). TFF remains primary for season membership, fixtures, results, match sheets, and rules.

## Repository Layout

- `sql/`: SQL Server schema scripts
- `documents/`: local reference PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control

