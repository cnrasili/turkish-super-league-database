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

- The 18-table schema covers every relation, entity, and attribute in the proposal and EER; the integrity script and four reporting views are drafted.
- `sql/turkish-super-league-reference-data.sql` seeds the 2025-2026 season, its 18 clubs, their TFF profile stadiums, and source-backed club colours.
- `sql/turkish-super-league-player-data.sql` contains 599 contracted roster rows across 18 teams and 599 distinct TFF license numbers. All 18 club blocks have been selected for the post-winter 2025-2026 rosters using TFF's final A-team lists and owner-provided squad screenshots. The latest review includes 28 Gençlerbirliği players, 25 Antalyaspor players, and 28 Fatih Karagümrük players; Antalyaspor includes one screenshot-backed U21 first-team player verified in TFF senior-match records. Verified winter transfers are reconciled across clubs, including Rodrigo Nascimento Franca from Fenerbahçe to Kasımpaşa, Emir Ortakaya from Eyüpspor to Rizespor, and Bedirhan Özyurt from Alanyaspor to Eyüpspor. The four big-club blocks remain closed; revisit them only if another roster review reveals a concrete conflict. Ensar Buğra Tivsiz and Deniz Ceylan are omitted from the roster because they had no professional contract during 2025-2026. TFF's first-window Rizespor and Gaziantep PDFs returned errors after retries.
- `sql/turkish-super-league-match-participant-profiles.sql` adds profiles for 18 additional players confirmed in TFF match sheets, including season-overlapping contract periods for the nine players with verified professional contracts. The other nine have player profiles for their recorded match appearances but no season contract row. Together, the seeds contain 617 distinct player profiles and 608 professional contract periods.
- `sql/turkish-super-league-coach-referee-data.sql` contains 35 coach profiles, 42 coaching periods within the 2025-2026 season, and 29 referee profiles with TFF class values. UEFA A is recorded for Burak Yılmaz and Selçuk Şahin based on their participation in UEFA Pro courses and the TFF Pro-course prerequisite; this does not claim that either had completed a Pro diploma.
- The match relation follows the approved model: season, home club, away club, referee, and week; it has no date, kickoff-time, or venue attributes.
- `sql/turkish-super-league-match-data.sql` seeds all 306 2025-2026 fixtures.
- `sql/turkish-super-league-match-event-sample.sql` seeds the first fixture's 31 appearances and 17 events: 5 goals, 3 cards, and 9 substitutions.
- `sql/turkish-super-league-match-event-progress.sql` seeds 201 additional fixtures with source-matched appearances and event records; unpaired same-minute substitutions remain excluded.
- `sql/turkish-super-league-match-event-progress-batch-2.sql` adds 84 fixtures with 2,610 appearances, 196 goals, and 377 cards. It does not seed substitution events pending source verification.
- `sql/turkish-super-league-match-event-progress-batch-3.sql` adds the remaining 20 fixtures with 622 appearances, 58 goals, and 95 cards. All 306 fixtures now have sourced appearance, goal, and card data; substitution research remains open.
- `sql/turkish-super-league-match-event-substitutions-progress.sql` adds 370 substitutions that have one incoming and one outgoing player at that minute in the TFF sheet. The 104 fixtures covered by this script initially had 531 substitutions in 244 multi-player same-minute groups pending supplementary pairing sources.
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
- Match-event participants must have an appearance in that match. Run `dbo.assert_match_event_subtypes_complete` after data loading to verify every event has exactly one goal, card, or substitution subtype.
- The scripts have not yet been executed against SQL Server.
- The selected sample season is 2025-2026.
- Official TFF season, squad, match, and profile records are the primary data sources.
- All 306 TFF fixture results reconcile with the computed final records for the 18 clubs; all 306 linked match details now confirm the score and goal-event total.
- The [TFF detail page for Alanyaspor 1-3 Eyüpspor](https://www.tff.org/Default.aspx?macId=283725&pageID=29), which timed out in an earlier review, is now accessible and exposes its lineups, goals, cards, and substitution minutes.
- TFF goal type codes are `F` (foot), `H` (header), `K` (own goal), and `P` (penalty); card colours are yellow and red.
- Include numbered first-team players. Exclude unnumbered academy entries, while retaining unnumbered players whose 2025-2026 loan is confirmed by TFF. All 599 selected roster rows have birth date, nationality, position, and a professional contract period overlapping the season, matched to TFF records and the supplied squad screenshots. The additional 18 participant profiles are sourced from TFF match sheets; no professional contract row is added where no season-overlapping contract is recorded. Coach profiles and season coaching periods are prepared. All 29 main referees have profiles. Source-backed match data is prepared for all 306 fixtures. Match-event data has appearance, goal, and card records for all fixtures, plus 489 substitutions. For the 104 fixtures covered by substitution progress, 455 substitutions in 208 same-minute multi-player groups remain unresolved. TFF match-sheet player links expose license numbers for matching participants to roster records. For `appearance`, use starters and substitutes who entered; do not count unused substitutes. Store stoppage notation as elapsed integer minutes (`45+12` as `57`, `90+4` as `94`). Use a supplementary match report to verify same-minute substitution pairings and substitution causes.
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
26. After all appearance and event scripts are loaded, run the event-subtype assertion:

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

## Reference Materials

The project follows the supplied proposal and EER diagram. Their original PDF files are retained locally and excluded from version control.

## 2025-2026 Data Sources

- [TFF season fixtures and standings](https://www.tff.org/default.aspx?pageID=1768)
- [TFF Çaykur Rizespor-Göztepe match detail](https://www.tff.org/Default.aspx?macId=283561&pageId=29)
- Official [first-window](https://www.tff.org/Default.aspx?ftxtId=48473&pageId=200) and [second-window](https://www.tff.org/default.aspx?ftxtID=49698&pageID=204) A-team player lists
- [TFF match detail example](https://www.tff.org/Default.aspx?macId=283853&pageId=29)
- [TFF Alanyaspor-Eyüpspor match detail](https://www.tff.org/Default.aspx?macId=283725&pageID=528) and linked [player profile with license number](https://www.tff.org/Default.aspx?kisiId=1506181&pageId=30)
- [BBC Alanyaspor-Eyüpspor match report](https://www.bbc.co.uk/sport/football/live/cr4kp0eqxext) for cross-checking same-minute substitutions
- [TFF Eyüpspor-Konyaspor match sheet](https://www.tff.org/Default.aspx?macId=283554&pageID=29), [MaçPeşinde event timeline](https://macpesinde.com/mac/super-lig/sezon-25-26/hafta-1/2025-08-10/eyupspor-vs-konyaspor/mac-gunu), and [Transfermarkt match report](https://www.transfermarkt.com.tr/eyupspor_konyaspor/index/spielbericht/4646338) for the first event sample
- TFF [player](https://www.tff.org/default.aspx?pageID=130), [technical director](https://www.tff.org/default.aspx?pageID=163), [referee](https://www.tff.org/default.aspx?pageID=161), and [club](https://www.tff.org/default.aspx?pageID=119) records from the Football Knowledge Bank
- TFF profiles for [Asen Albayrak](https://www.tff.org/Default.aspx?hakemId=1518003&pageId=531), [Direnç Tonusluoğlu](https://www.tff.org/Default.aspx?hakemId=876678&pageId=531), [Fatih Tokail](https://www.tff.org/Default.aspx?hakemId=1623229&pageId=72), and [Melek Dakan](https://www.tff.org/Default.aspx?hakemId=1541469&pageId=531); supplementary profile dates for [Asen](https://www.transfermarkt.com.tr/asen-albayrak/profil/schiedsrichter/38934), [Direnç](https://www.transfermarkt.com/direnc-tonusluoglu/profil/schiedsrichter/27042), and [Fatih](https://www.transfermarkt.com.tr/fatih-tokail/profil/schiedsrichter/32957)
- TFF [upper-class referee list](https://www.tff.org/Resources/TFF/Auto/bbc6a25f4df049388d477f0a71433e8a.pdf) and [coach education regulations](https://www.tff.org/Resources/TFF/Documents/TALIMATLAR/Teknik-Adamlarin-E%C4%9Fitimi-ve-Siniflandirilmasi-Talimati.pdf)
- TFF stadium profiles linked from its official club and match pages
- Transfermarkt is a supplementary source only for fields missing from checked TFF records, such as [2025-2026 player positions](https://www.transfermarkt.com/galatasaray/kader/verein/141/saison_id/2025), [coach details](https://www.transfermarkt.com/nuri-sahin/profil/trainer/96813/sort/points), and [referee details](https://www.transfermarkt.com/yasin-kol/profil/schiedsrichter/9968/saison/2025/wettbewerb_id/TR1/plus/1). TFF remains primary for season membership, fixtures, results, match sheets, and rules.

## Repository Layout

- `sql/`: SQL Server schema scripts
- `documents/`: local reference PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control

