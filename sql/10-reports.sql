SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- Report views use the approved side-qualified event roles.
-- Rank tied clubs by TFF head-to-head results.
CREATE OR ALTER VIEW dbo.vw_league_table
AS
WITH goal_totals AS (
    SELECT
        m.match_id,
        m.season_id,
        m.home_club_id,
        m.away_club_id,
        SUM(CASE WHEN ep.[role] IN ('scorer_home', 'own_goal_by_away_player') THEN 1 ELSE 0 END) AS home_goals,
        SUM(CASE WHEN ep.[role] IN ('scorer_away', 'own_goal_by_home_player') THEN 1 ELSE 0 END) AS away_goals
    FROM dbo.[match] AS m
    LEFT JOIN dbo.goal AS g
        ON g.match_id = m.match_id
    LEFT JOIN dbo.event_player AS ep
        ON ep.match_id = g.match_id
        AND ep.event_no = g.event_no
    GROUP BY
        m.match_id,
        m.season_id,
        m.home_club_id,
        m.away_club_id
),
club_results AS (
    SELECT
        match_id,
        season_id,
        home_club_id AS club_id,
        home_goals AS goals_for,
        away_goals AS goals_against
    FROM goal_totals
    UNION ALL
    SELECT
        match_id,
        season_id,
        away_club_id AS club_id,
        away_goals AS goals_for,
        home_goals AS goals_against
    FROM goal_totals
),
overall_table AS (
    SELECT
        sc.season_id,
        s.name AS season_name,
        c.club_id,
        c.name AS club_name,
        COUNT(r.match_id) AS played,
        SUM(CASE WHEN r.match_id IS NOT NULL AND r.goals_for > r.goals_against THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN r.match_id IS NOT NULL AND r.goals_for = r.goals_against THEN 1 ELSE 0 END) AS draws,
        SUM(CASE WHEN r.match_id IS NOT NULL AND r.goals_for < r.goals_against THEN 1 ELSE 0 END) AS losses,
        COALESCE(SUM(r.goals_for), 0) AS goals_for,
        COALESCE(SUM(r.goals_against), 0) AS goals_against,
        COALESCE(SUM(r.goals_for), 0) - COALESCE(SUM(r.goals_against), 0) AS goal_difference,
        SUM(CASE
            WHEN r.match_id IS NULL THEN 0
            WHEN r.goals_for > r.goals_against THEN 3
            WHEN r.goals_for = r.goals_against THEN 1
            ELSE 0
        END) AS points
    FROM dbo.season_club AS sc
    JOIN dbo.season AS s
        ON s.season_id = sc.season_id
    JOIN dbo.club AS c
        ON c.club_id = sc.club_id
    LEFT JOIN club_results AS r
        ON r.season_id = sc.season_id
        AND r.club_id = sc.club_id
    GROUP BY
        sc.season_id,
        s.name,
        c.club_id,
        c.name
),
direct_results AS (
    SELECT
        season_id,
        home_club_id AS club_id,
        away_club_id AS opponent_club_id,
        home_goals AS goals_for,
        away_goals AS goals_against
    FROM goal_totals
    UNION ALL
    SELECT
        season_id,
        away_club_id AS club_id,
        home_club_id AS opponent_club_id,
        away_goals AS goals_for,
        home_goals AS goals_against
    FROM goal_totals
),
head_to_head AS (
    SELECT
        own_table.season_id,
        direct.club_id,
        SUM(CASE
            WHEN direct.goals_for > direct.goals_against THEN 3
            WHEN direct.goals_for = direct.goals_against THEN 1
            ELSE 0
        END) AS head_to_head_points,
        SUM(direct.goals_for) AS head_to_head_goals_for,
        SUM(direct.goals_for) - SUM(direct.goals_against) AS head_to_head_goal_difference
    FROM direct_results AS direct
    JOIN overall_table AS own_table
        ON own_table.season_id = direct.season_id
        AND own_table.club_id = direct.club_id
    JOIN overall_table AS opponent_table
        ON opponent_table.season_id = direct.season_id
        AND opponent_table.club_id = direct.opponent_club_id
        AND opponent_table.points = own_table.points
    GROUP BY
        own_table.season_id,
        direct.club_id
)
SELECT
    ROW_NUMBER() OVER (
        PARTITION BY table_row.season_id
        ORDER BY
            table_row.points DESC,
            COALESCE(head_to_head.head_to_head_points, 0) DESC,
            COALESCE(head_to_head.head_to_head_goal_difference, 0) DESC,
            COALESCE(head_to_head.head_to_head_goals_for, 0) DESC,
            table_row.goal_difference DESC,
            table_row.goals_for DESC,
            table_row.club_name ASC
    ) AS league_position,
    table_row.season_id,
    table_row.season_name,
    table_row.club_id,
    table_row.club_name,
    table_row.played,
    table_row.wins,
    table_row.draws,
    table_row.losses,
    table_row.goals_for,
    table_row.goals_against,
    table_row.goal_difference,
    table_row.points
FROM overall_table AS table_row
LEFT JOIN head_to_head
    ON head_to_head.season_id = table_row.season_id
    AND head_to_head.club_id = table_row.club_id;
GO

CREATE OR ALTER VIEW dbo.vw_top_scorers
AS
SELECT
    m.season_id,
    ep.player_id,
    p.name AS player_name,
    COUNT_BIG(*) AS goals
FROM dbo.event_player AS ep
JOIN dbo.goal AS g
    ON g.match_id = ep.match_id
    AND g.event_no = ep.event_no
JOIN dbo.[match] AS m
    ON m.match_id = ep.match_id
JOIN dbo.player AS pl
    ON pl.person_id = ep.player_id
JOIN dbo.person AS p
    ON p.person_id = pl.person_id
WHERE ep.[role] IN ('scorer_home', 'scorer_away')
GROUP BY
    m.season_id,
    ep.player_id,
    p.name;
GO

CREATE OR ALTER VIEW dbo.vw_cards_by_club
AS
SELECT
    m.season_id,
    club.club_id,
    club.name AS club_name,
    ca.colour,
    COUNT_BIG(*) AS card_count
FROM dbo.card AS ca
JOIN dbo.match_event AS me
    ON me.match_id = ca.match_id
    AND me.event_no = ca.event_no
JOIN dbo.[match] AS m
    ON m.match_id = ca.match_id
JOIN dbo.event_player AS ep
    ON ep.match_id = ca.match_id
    AND ep.event_no = ca.event_no
CROSS APPLY (VALUES (
    CASE
        WHEN ep.[role] = 'carded_home' THEN m.home_club_id
        WHEN ep.[role] = 'carded_away' THEN m.away_club_id
    END
)) AS event_side (club_id)
JOIN dbo.club AS club
    ON club.club_id = event_side.club_id
WHERE ep.[role] IN ('carded_home', 'carded_away')
GROUP BY
    m.season_id,
    club.club_id,
    club.name,
    ca.colour;
GO

CREATE OR ALTER VIEW dbo.vw_player_club_history
AS
SELECT
    ct.player_id,
    person.name AS player_name,
    ct.club_id,
    club.name AS club_name,
    ct.start_date,
    ct.end_date
FROM dbo.[contract] AS ct
JOIN dbo.player AS player
    ON player.person_id = ct.player_id
JOIN dbo.person AS person
    ON person.person_id = player.person_id
JOIN dbo.club AS club
    ON club.club_id = ct.club_id;
GO

