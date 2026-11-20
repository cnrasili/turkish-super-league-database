# Turkish Süper Lig Database

A relational database for the clubs, players, matches and match events of the 2025-2026 Turkish Süper Lig season, built from the submitted proposal and EER diagram. Everything runs in Microsoft SQL Server through SQL scripts; there is no user interface.

## Model

Eighteen relations, mapped from the EER diagram:

| Area | Relations |
|---|---|
| People | `person` with its disjoint subclasses `player`, `coach`, `referee` |
| Clubs | `club`, `club_colour`, `stadium` |
| Season | `season`, `season_club` |
| Engagements | `contract`, `coaching` |
| Matches | `match`, `appearance` |
| Events | `match_event` with its disjoint subtypes `goal`, `card`, `substitution`, plus `event_player` |

`match_event` is a weak entity identified by `match_id` and `event_no`. A match stores only its season, home club, away club, referee and week; the score is derived from the goal events rather than stored. Integrity is enforced with 22 foreign keys, 8 check constraints, 10 triggers and the `dbo.assert_match_event_subtypes_complete` procedure.

## Reports

Four views answer the questions in the proposal:

| View | Output |
|---|---|
| `vw_league_table` | League table, 3/1/0, ties broken by head-to-head results per TFF Futbol Müsabaka Talimatı art. 9 |
| `vw_top_scorers` | Goals per player, excluding own goals |
| `vw_cards_by_club` | Yellow and red cards per club |
| `vw_player_club_history` | Clubs a player has been contracted to |

## Loaded Data

| | |
|---|---:|
| Clubs / stadiums | 18 / 17 |
| People (players / coaches / referees) | 681 (617 / 35 / 29) |
| Contracts / coaching periods | 608 / 42 |
| Matches | 306 |
| Appearances | 9,434 |
| Match events | 4,942 |
| Goals / cards / substitutions | 812 / 1,428 / 2,702 |

## Setup

1. Create an empty database and run `sql/turkish-super-league-schema.sql`, then `sql/turkish-super-league-integrity.sql`.
2. Load the reference, player, participant-profile, coach/referee and match data, in that order.
3. Load the match events: the sample fixture, the three progress batches, the substitution script and its 60 supplements, then the card supplement.
4. Run `sql/turkish-super-league-reports.sql` and verify the load:

```sql
EXEC dbo.assert_match_event_subtypes_complete;
SELECT * FROM dbo.vw_league_table ORDER BY league_position;
```

The scripts must run in the order above, and the event supplements in their file-name order. Every data script guards its prerequisites and fails rather than loading out of sequence. Base tables have no guaranteed row order, so use `ORDER BY` in queries.

## Validation

The full set was executed against SQL Server 2022 and the result checked against TFF records:

- Every match event has exactly one goal, card or substitution subtype.
- All 306 computed scores match the linked TFF match-detail pages.
- Per-match, per-club yellow and red card counts match TFF for all 306 fixtures.
- Each of the 2,702 non-starter appearances pairs with exactly one substitution.
- Every goal and substitution participant appears in that match's lineup. Card participants are exempt: TFF records 17 cards shown to substitutes who never entered the field.
- 250 substitutions are flagged as injury-related, audited in both directions against match reports.

Against the proposal's Table 1, all 18 relations, their primary keys and their foreign keys match, with one deliberate difference: the home and away sides of `match` reference `season_club (season_id, club_id)` instead of `season` and `club` separately, which enforces declaratively that both clubs take part in that season.

## Sources

TFF is the primary source for seasons, clubs, fixtures, results, match sheets and competition rules. Transfermarkt and match reports from club sites and sports media supply what TFF does not publish, above all the cause of a substitution. The owner's squad screenshots were used for roster selection and positions.

Each script header carries the source links for the fixtures it covers. The per-script provenance notes and the injury-cause audit table are kept locally and excluded from version control.

## Repository Layout

- `sql/`: schema, integrity, report and data scripts
- `DATA_NOTES.md`: local provenance and audit notes, excluded from version control
- `documents/`: proposal and EER PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control
