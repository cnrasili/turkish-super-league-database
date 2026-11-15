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
- `sql/turkish-super-league-player-data.sql` contains 599 roster rows across 18 teams and 599 distinct TFF license numbers. All 18 club blocks have been selected for the post-winter 2025-2026 rosters using TFF's final A-team lists and owner-provided squad screenshots. The latest review includes 28 Gençlerbirliği players, 25 Antalyaspor players, and 28 Fatih Karagümrük players; Antalyaspor includes one screenshot-backed U21 first-team player verified in TFF senior-match records. Verified winter transfers are reconciled across clubs, including Rodrigo Nascimento Franca from Fenerbahçe to Kasımpaşa, Emir Ortakaya from Eyüpspor to Rizespor, and Bedirhan Özyurt from Alanyaspor to Eyüpspor. The four big-club blocks remain closed; revisit them only if another roster review reveals a concrete conflict. All player profile fields and season-overlapping professional contract periods are populated for the selected players. Ensar Buğra Tivsiz and Deniz Ceylan are omitted because they had no professional contract during 2025-2026. TFF's first-window Rizespor and Gaziantep PDFs returned errors after retries.
- `sql/turkish-super-league-coach-referee-data.sql` contains 35 coach profiles, 42 coaching periods within the 2025-2026 season, and 28 referee profiles with TFF class values. Ozan Ergün's exact birth date remains unresolved, so matches he refereed are not seeded. UEFA A is recorded for Burak Yılmaz and Selçuk Şahin based on their participation in UEFA Pro courses and the TFF Pro-course prerequisite; this does not claim that either had completed a Pro diploma.
- The match relation follows the approved model: season, home club, away club, referee, and week; it has no date, kickoff-time, or venue attributes.
- `sql/turkish-super-league-match-data.sql` seeds 291 of the 306 2025-2026 fixtures. Fifteen fixtures are held because their main referee is Ozan Ergün, whose exact birth date is not available in a reliable source and is required by the EER-aligned schema.
- Match-event participants must have an appearance in that match. Run `dbo.assert_match_event_subtypes_complete` after data loading to verify every event has exactly one goal, card, or substitution subtype.
- The scripts have not yet been executed against SQL Server.
- The selected sample season is 2025-2026.
- Official TFF season, squad, match, and profile records are the primary data sources.
- All 306 TFF fixture results reconcile with the computed final records for the 18 clubs; all 306 linked match details now confirm the score and goal-event total.
- The [TFF detail page for Alanyaspor 1-3 Eyüpspor](https://www.tff.org/Default.aspx?macId=283725&pageID=29), which timed out in an earlier review, is now accessible and exposes its lineups, goals, cards, and substitution minutes.
- TFF goal type codes are `F` (foot), `H` (header), `K` (own goal), and `P` (penalty); card colours are yellow and red.
- Include numbered first-team players. Exclude unnumbered academy entries, while retaining unnumbered players whose 2025-2026 loan is confirmed by TFF. All 599 selected player rows have birth date, nationality, position, and a professional contract period overlapping the season, matched to TFF records and the supplied squad screenshots. Coach profiles and season coaching periods are prepared. Referee birth dates are verified for 28 of the 29 main referees identified in the season fixtures; Ozan Ergün's exact date remains unresolved. Source-backed match data is prepared for 291 fixtures; lineups and events still need collection and TFF reconciliation. TFF match-sheet player links expose license numbers for matching participants to roster records. For `appearance`, use starters and substitutes who entered; do not count unused substitutes. Store stoppage notation as elapsed integer minutes (`45+12` as `57`, `90+4` as `94`) and retain the original notation in temporary staging. Use a supplementary match report to verify same-minute substitution pairings. Transfermarkt match reports label substitution reasons as injury or tactical; each event still needs an audit.
- Do not use a post-2025-2026 contract start date as the historical season contract. Omit players who had no professional contract during 2025-2026.
- The league-table view applies TFF head-to-head tie-break rules while keeping the proposal and EER table set unchanged.

## SQL Scripts

- `sql/turkish-super-league-schema.sql`: create the relational tables and constraints.
- `sql/turkish-super-league-reference-data.sql`: seed source-backed 2025-2026 clubs, colours, stadiums, and season participation.
- `sql/turkish-super-league-player-data.sql`: load the 599 sourced player profiles and 599 professional contract periods for the 2025-2026 roster.
- `sql/turkish-super-league-coach-referee-data.sql`: load sourced coach and referee profiles and season coaching periods.
- `sql/turkish-super-league-match-data.sql`: load the 291 fixtures whose referee profiles are available.
- `sql/turkish-super-league-integrity.sql`: apply subtype and goal-lineup integrity rules.
- `sql/turkish-super-league-reports.sql`: create the league table, top scorers, cards by club, and player club history views.

## Setup

1. Create or select an empty SQL Server database.
2. Execute `sql/turkish-super-league-schema.sql` in SQL Server Management Studio.
3. Execute `sql/turkish-super-league-reference-data.sql` to load the available club and season reference rows.
4. Execute `sql/turkish-super-league-integrity.sql` before loading people and match data.
5. Execute `sql/turkish-super-league-reports.sql` after the schema exists.
6. Run `sql/turkish-super-league-player-data.sql` to load the player profiles and available professional contract periods before loading coach, referee, match, lineup, and event rows.
7. Run `sql/turkish-super-league-coach-referee-data.sql` after player data and before match data.
8. Run `sql/turkish-super-league-match-data.sql` after the coach and referee data.
9. Load match appearances and event data after the match rows.
10. Run the event-subtype assertion after loading:

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
- TFF [player](https://www.tff.org/default.aspx?pageID=130), [technical director](https://www.tff.org/default.aspx?pageID=163), [referee](https://www.tff.org/default.aspx?pageID=161), and [club](https://www.tff.org/default.aspx?pageID=119) records from the Football Knowledge Bank
- TFF profiles for [Asen Albayrak](https://www.tff.org/Default.aspx?hakemId=1518003&pageId=531), [Direnç Tonusluoğlu](https://www.tff.org/Default.aspx?hakemId=876678&pageId=531), [Fatih Tokail](https://www.tff.org/Default.aspx?hakemId=1623229&pageId=72), and [Melek Dakan](https://www.tff.org/Default.aspx?hakemId=1541469&pageId=531); supplementary profile dates for [Asen](https://www.transfermarkt.com.tr/asen-albayrak/profil/schiedsrichter/38934), [Direnç](https://www.transfermarkt.com/direnc-tonusluoglu/profil/schiedsrichter/27042), and [Fatih](https://www.transfermarkt.com.tr/fatih-tokail/profil/schiedsrichter/32957)
- TFF [upper-class referee list](https://www.tff.org/Resources/TFF/Auto/bbc6a25f4df049388d477f0a71433e8a.pdf) and [coach education regulations](https://www.tff.org/Resources/TFF/Documents/TALIMATLAR/Teknik-Adamlarin-E%C4%9Fitimi-ve-Siniflandirilmasi-Talimati.pdf)
- TFF stadium profiles linked from its official club and match pages
- Transfermarkt is a supplementary source only for fields missing from checked TFF records, such as [2025-2026 player positions](https://www.transfermarkt.com/galatasaray/kader/verein/141/saison_id/2025), [coach details](https://www.transfermarkt.com/nuri-sahin/profil/trainer/96813/sort/points), and [referee details](https://www.transfermarkt.com/yasin-kol/profil/schiedsrichter/9968/saison/2025/wettbewerb_id/TR1/plus/1). TFF remains primary for season membership, fixtures, results, match sheets, and rules.

## Repository Layout

- `sql/`: SQL Server schema scripts
- `documents/`: local reference PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control

