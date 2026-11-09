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

## Setup

1. Create or select an empty SQL Server database.
2. Open `sql/turkish-super-league-schema.sql` in SQL Server Management Studio.
3. Select the target database and execute the script.

## Reference Materials

The project follows the supplied proposal and EER diagram. Their original PDF files are retained locally and excluded from version control.

## Repository Layout

- `sql/`: SQL Server schema scripts
- `documents/`: local reference PDFs, excluded from version control
- `review-assets/`: local page renders, excluded from version control
