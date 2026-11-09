SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.check_constraints
    WHERE name = N'CK_event_player_role'
        AND parent_object_id = OBJECT_ID(N'dbo.event_player')
)
BEGIN
    ALTER TABLE dbo.event_player WITH CHECK
        ADD CONSTRAINT CK_event_player_role CHECK ([role] IN (
            'scorer_home',
            'scorer_away',
            'own_goal_by_home_player',
            'own_goal_by_away_player',
            'carded_home',
            'carded_away',
            'substituted_in_home',
            'substituted_out_home',
            'substituted_in_away',
            'substituted_out_away'
        ));
END;
GO

-- Keep PERSON subtypes disjoint.
CREATE OR ALTER TRIGGER dbo.trg_player_subtype_disjoint
ON dbo.player
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM dbo.coach AS c
            WHERE c.person_id = i.person_id
        )
        OR EXISTS (
            SELECT 1
            FROM dbo.referee AS r
            WHERE r.person_id = i.person_id
        )
    )
    BEGIN
        ;THROW 51001, 'Person subtypes are disjoint.', 1;
    END;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_coach_subtype_disjoint
ON dbo.coach
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM dbo.player AS p
            WHERE p.person_id = i.person_id
        )
        OR EXISTS (
            SELECT 1
            FROM dbo.referee AS r
            WHERE r.person_id = i.person_id
        )
    )
    BEGIN
        ;THROW 51002, 'Person subtypes are disjoint.', 1;
    END;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_referee_subtype_disjoint
ON dbo.referee
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM dbo.player AS p
            WHERE p.person_id = i.person_id
        )
        OR EXISTS (
            SELECT 1
            FROM dbo.coach AS c
            WHERE c.person_id = i.person_id
        )
    )
    BEGIN
        ;THROW 51003, 'Person subtypes are disjoint.', 1;
    END;
END;
GO

-- Keep MATCH_EVENT subtypes disjoint.
CREATE OR ALTER TRIGGER dbo.trg_goal_subtype_disjoint
ON dbo.goal
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM dbo.card AS c
            WHERE c.match_id = i.match_id
                AND c.event_no = i.event_no
        )
        OR EXISTS (
            SELECT 1
            FROM dbo.substitution AS s
            WHERE s.match_id = i.match_id
                AND s.event_no = i.event_no
        )
    )
    BEGIN
        ;THROW 51004, 'Match event subtypes are disjoint.', 1;
    END;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_card_subtype_disjoint
ON dbo.card
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM dbo.goal AS g
            WHERE g.match_id = i.match_id
                AND g.event_no = i.event_no
        )
        OR EXISTS (
            SELECT 1
            FROM dbo.substitution AS s
            WHERE s.match_id = i.match_id
                AND s.event_no = i.event_no
        )
    )
    BEGIN
        ;THROW 51005, 'Match event subtypes are disjoint.', 1;
    END;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_substitution_subtype_disjoint
ON dbo.substitution
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM dbo.goal AS g
            WHERE g.match_id = i.match_id
                AND g.event_no = i.event_no
        )
        OR EXISTS (
            SELECT 1
            FROM dbo.card AS c
            WHERE c.match_id = i.match_id
                AND c.event_no = i.event_no
        )
    )
    BEGIN
        ;THROW 51006, 'Match event subtypes are disjoint.', 1;
    END;
END;
GO

-- Require one goal participant in the same match lineup.
CREATE OR ALTER TRIGGER dbo.trg_goal_participant_lineup
ON dbo.goal
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        OUTER APPLY (
            SELECT
                COUNT(CASE
                    WHEN ep.[role] IN (
                        'scorer_home',
                        'scorer_away',
                        'own_goal_by_home_player',
                        'own_goal_by_away_player'
                    ) THEN 1
                END) AS goal_role_count,
                SUM(CASE
                    WHEN ep.[role] NOT IN (
                        'scorer_home',
                        'scorer_away',
                        'own_goal_by_home_player',
                        'own_goal_by_away_player'
                    ) THEN 1
                    ELSE 0
                END) AS invalid_role_count,
                SUM(CASE
                    WHEN ep.[role] IN (
                        'scorer_home',
                        'scorer_away',
                        'own_goal_by_home_player',
                        'own_goal_by_away_player'
                    )
                    AND a.player_id IS NULL THEN 1
                    ELSE 0
                END) AS missing_appearance_count
            FROM dbo.event_player AS ep
            LEFT JOIN dbo.appearance AS a
                ON a.match_id = ep.match_id
                AND a.player_id = ep.player_id
            WHERE ep.match_id = i.match_id
                AND ep.event_no = i.event_no
        ) AS participant_check
        WHERE participant_check.goal_role_count <> 1
            OR COALESCE(participant_check.invalid_role_count, 0) > 0
            OR COALESCE(participant_check.missing_appearance_count, 0) > 0
    )
    BEGIN
        ;THROW 51007, 'A goal requires one participant in the same match lineup.', 1;
    END;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_event_player_preserve_goal_lineup
ON dbo.event_player
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM (
            SELECT match_id, event_no FROM inserted
            UNION
            SELECT match_id, event_no FROM deleted
        ) AS changed
        JOIN dbo.goal AS g
            ON g.match_id = changed.match_id
            AND g.event_no = changed.event_no
        OUTER APPLY (
            SELECT
                COUNT(CASE
                    WHEN ep.[role] IN (
                        'scorer_home',
                        'scorer_away',
                        'own_goal_by_home_player',
                        'own_goal_by_away_player'
                    ) THEN 1
                END) AS goal_role_count,
                SUM(CASE
                    WHEN ep.[role] NOT IN (
                        'scorer_home',
                        'scorer_away',
                        'own_goal_by_home_player',
                        'own_goal_by_away_player'
                    ) THEN 1
                    ELSE 0
                END) AS invalid_role_count,
                SUM(CASE
                    WHEN ep.[role] IN (
                        'scorer_home',
                        'scorer_away',
                        'own_goal_by_home_player',
                        'own_goal_by_away_player'
                    )
                    AND a.player_id IS NULL THEN 1
                    ELSE 0
                END) AS missing_appearance_count
            FROM dbo.event_player AS ep
            LEFT JOIN dbo.appearance AS a
                ON a.match_id = ep.match_id
                AND a.player_id = ep.player_id
            WHERE ep.match_id = changed.match_id
                AND ep.event_no = changed.event_no
        ) AS participant_check
        WHERE participant_check.goal_role_count <> 1
            OR COALESCE(participant_check.invalid_role_count, 0) > 0
            OR COALESCE(participant_check.missing_appearance_count, 0) > 0
    )
    BEGIN
        ;THROW 51008, 'A goal requires one participant in the same match lineup.', 1;
    END;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_appearance_preserve_goal_lineup
ON dbo.appearance
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM deleted AS d
        JOIN dbo.event_player AS ep
            ON ep.match_id = d.match_id
            AND ep.player_id = d.player_id
        JOIN dbo.goal AS g
            ON g.match_id = ep.match_id
            AND g.event_no = ep.event_no
        WHERE ep.[role] IN (
            'scorer_home',
            'scorer_away',
            'own_goal_by_home_player',
            'own_goal_by_away_player'
        )
        AND NOT EXISTS (
            SELECT 1
            FROM inserted AS i
            WHERE i.match_id = d.match_id
                AND i.player_id = d.player_id
        )
    )
    BEGIN
        ;THROW 51009, 'A goal participant must remain in the same match lineup.', 1;
    END;
END;
GO

