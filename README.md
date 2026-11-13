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
- `sql/turkish-super-league-player-data.sql` contains 529 roster rows across 18 teams and 529 distinct TFF license numbers. Eleven club blocks have been selected for the post-winter 2025-2026 rosters using TFF's final A-team lists and owner-provided squad screenshots: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor, Göztepe, İstanbul Başakşehir, Samsunspor, Çaykur Rizespor, Konyaspor, Alanyaspor, and Eyüpspor. The eleven reviewed blocks contain 304 rows. Verified winter transfers are reconciled across clubs, including Emir Ortakaya from Eyüpspor to Rizespor and Bedirhan Özyurt from Alanyaspor to Eyüpspor. The four big-club blocks remain closed; revisit them only if another roster review reveals a concrete conflict. The other seven club blocks still need selection review. Required profile and contract data remain incomplete, so the script stops before insertion rather than guessing. TFF's first-window Rizespor and Gaziantep PDFs returned errors after retries.
- The match relation follows the approved model: season, home club, away club, referee, and week; it has no date, kickoff-time, or venue attributes.
- Match-event participants must have an appearance in that match. Run `dbo.assert_match_event_subtypes_complete` after data loading to verify every event has exactly one goal, card, or substitution subtype.
- The scripts have not yet been executed against SQL Server.
- The selected sample season is 2025-2026.
- Official TFF season, squad, match, and profile records are the primary data sources.
- All 306 TFF fixture results reconcile with the computed final records for the 18 clubs; 305 linked match details also confirm the score and goal-event total.
- The [TFF detail page for Alanyaspor 1-3 Eyüpspor](https://www.tff.org/Default.aspx?macId=283725&pageID=29) timed out. Its fixture result is confirmed, but its goal events remain unchecked.
- TFF goal type codes are `F` (foot), `H` (header), `K` (own goal), and `P` (penalty); card colours are yellow and red.
- Include numbered first-team players. Exclude unnumbered academy entries, while retaining unnumbered players whose 2025-2026 loan is confirmed by TFF. TFF profiles and registration records anchor player identity, season membership, and contract dates; owner-supplied Transfermarkt screenshots help select the numbered squad and provide position details. Coach, referee, match, lineup, and event rows still need collection and TFF reconciliation. Referee birth dates are verified for 22 of 25 listed officials; the owner will supply the remaining three. No reliable event-level source for substitution injury status has been found.
- The owner will supply remaining missing values. Further searches stop when available source coverage is sufficient; unresolved rows are not fabricated or loaded.
- The league-table view applies TFF head-to-head tie-break rules while keeping the proposal and EER table set unchanged.

## SQL Scripts

- `sql/turkish-super-league-schema.sql`: create the relational tables and constraints.
- `sql/turkish-super-league-reference-data.sql`: seed source-backed 2025-2026 clubs, colours, stadiums, and season participation.
- `sql/turkish-super-league-player-data.sql`: load player and contract rows after completing the official roster input with sourced profile and contract values.
- `sql/turkish-super-league-integrity.sql`: apply subtype and goal-lineup integrity rules.
- `sql/turkish-super-league-reports.sql`: create the league table, top scorers, cards by club, and player club history views.

## Setup

1. Create or select an empty SQL Server database.
2. Execute `sql/turkish-super-league-schema.sql` in SQL Server Management Studio.
3. Execute `sql/turkish-super-league-reference-data.sql` to load the available club and season reference rows.
4. Execute `sql/turkish-super-league-integrity.sql` before loading people and match data.
5. Execute `sql/turkish-super-league-reports.sql` after the schema exists.
6. Complete the null player profile and contract fields in `sql/turkish-super-league-player-data.sql`, then run it before loading coach, referee, match, lineup, and event rows.
7. Run the event-subtype assertion after loading:

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
- Official [first-window](https://www.tff.org/Default.aspx?ftxtId=48473&pageId=200) and [second-window](https://www.tff.org/default.aspx?ftxtID=49698&pageID=204) A-team player lists
- [TFF match detail example](https://www.tff.org/Default.aspx?macId=283853&pageId=29)
- TFF [player](https://www.tff.org/default.aspx?pageID=130), [technical director](https://www.tff.org/default.aspx?pageID=163), [referee](https://www.tff.org/default.aspx?pageID=161), and [club](https://www.tff.org/default.aspx?pageID=119) records from the Football Knowledge Bank
- TFF stadium profiles linked from its official club and match pages
- Transfermarkt is a supplementary source only for fields missing from checked TFF records, such as [2025-2026 player positions](https://www.transfermarkt.com/galatasaray/kader/verein/141/saison_id/2025), [coach details](https://www.transfermarkt.com/nuri-sahin/profil/trainer/96813/sort/points), and [referee details](https://www.transfermarkt.com/yasin-kol/profil/schiedsrichter/9968/saison/2025/wettbewerb_id/TR1/plus/1). TFF remains primary for season membership, fixtures, results, match sheets, and rules.

## Repository Layout

- `sql/`: SQL Server schema scripts
- `documents/`: local reference PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control

