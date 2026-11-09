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

## Roadmap

1. Define requirements and the EER model.
2. Map the existing model to relational tables.
3. Implement the schema and constraints in SQL Server.
4. Add sample data for one season.
5. Add triggers, queries, and views.

## SQL Scripts

- `sql/turkish-super-league-schema.sql`: create the relational tables and constraints.
- `sql/turkish-super-league-integrity.sql`: apply subtype and goal-lineup integrity rules.
- `sql/turkish-super-league-reports.sql`: create the league table, top scorers, cards by club, and player club history views.

## Setup

1. Create or select an empty SQL Server database.
2. Execute `sql/turkish-super-league-schema.sql` in SQL Server Management Studio.
3. Execute `sql/turkish-super-league-integrity.sql` before loading data.
4. Execute `sql/turkish-super-league-reports.sql` after the schema exists.
5. Load the approved one-season data when its source is selected.

To display the league table in the approved order, run:

```sql
SELECT *
FROM dbo.vw_league_table
ORDER BY points DESC, goal_difference DESC, goals_for DESC, club_name ASC;
```

## Reference Materials

The project follows the supplied proposal and EER diagram. Their original PDF files are retained locally and excluded from version control.

## Repository Layout

- `sql/`: SQL Server schema scripts
- `documents/`: local reference PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control

