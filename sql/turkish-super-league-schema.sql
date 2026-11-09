SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.person (
    person_id INT IDENTITY(1, 1) NOT NULL,
    name NVARCHAR(120) NOT NULL,
    birth_date DATE NOT NULL,
    nationality NVARCHAR(80) NOT NULL,
    CONSTRAINT PK_person PRIMARY KEY (person_id)
);
GO

CREATE TABLE dbo.player (
    person_id INT NOT NULL,
    position NVARCHAR(40) NOT NULL,
    CONSTRAINT PK_player PRIMARY KEY (person_id),
    CONSTRAINT FK_player_person FOREIGN KEY (person_id)
        REFERENCES dbo.person (person_id)
);
GO

CREATE TABLE dbo.coach (
    person_id INT NOT NULL,
    license_level NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_coach PRIMARY KEY (person_id),
    CONSTRAINT FK_coach_person FOREIGN KEY (person_id)
        REFERENCES dbo.person (person_id)
);
GO

CREATE TABLE dbo.referee (
    person_id INT NOT NULL,
    referee_class NVARCHAR(40) NOT NULL,
    license_level NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_referee PRIMARY KEY (person_id),
    CONSTRAINT FK_referee_person FOREIGN KEY (person_id)
        REFERENCES dbo.person (person_id)
);
GO

CREATE TABLE dbo.stadium (
    stadium_id INT IDENTITY(1, 1) NOT NULL,
    name NVARCHAR(120) NOT NULL,
    city NVARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    CONSTRAINT PK_stadium PRIMARY KEY (stadium_id),
    CONSTRAINT CK_stadium_capacity CHECK (capacity >= 0)
);
GO

CREATE TABLE dbo.club (
    club_id INT IDENTITY(1, 1) NOT NULL,
    name NVARCHAR(120) NOT NULL,
    city NVARCHAR(100) NOT NULL,
    founded INT NOT NULL,
    stadium_id INT NOT NULL,
    CONSTRAINT PK_club PRIMARY KEY (club_id),
    CONSTRAINT FK_club_stadium FOREIGN KEY (stadium_id)
        REFERENCES dbo.stadium (stadium_id)
);
GO

CREATE TABLE dbo.club_colour (
    club_id INT NOT NULL,
    colour NVARCHAR(30) NOT NULL,
    CONSTRAINT PK_club_colour PRIMARY KEY (club_id, colour),
    CONSTRAINT FK_club_colour_club FOREIGN KEY (club_id)
        REFERENCES dbo.club (club_id)
);
GO

CREATE TABLE dbo.season (
    season_id INT IDENTITY(1, 1) NOT NULL,
    name NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_season PRIMARY KEY (season_id)
);
GO

CREATE TABLE dbo.season_club (
    season_id INT NOT NULL,
    club_id INT NOT NULL,
    CONSTRAINT PK_season_club PRIMARY KEY (season_id, club_id),
    CONSTRAINT FK_season_club_season FOREIGN KEY (season_id)
        REFERENCES dbo.season (season_id),
    CONSTRAINT FK_season_club_club FOREIGN KEY (club_id)
        REFERENCES dbo.club (club_id)
);
GO

CREATE TABLE dbo.[contract] (
    player_id INT NOT NULL,
    club_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT PK_contract PRIMARY KEY (player_id, club_id, start_date),
    CONSTRAINT FK_contract_player FOREIGN KEY (player_id)
        REFERENCES dbo.player (person_id),
    CONSTRAINT FK_contract_club FOREIGN KEY (club_id)
        REFERENCES dbo.club (club_id),
    CONSTRAINT CK_contract_dates CHECK (end_date >= start_date)
);
GO

CREATE TABLE dbo.coaching (
    coach_id INT NOT NULL,
    club_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT PK_coaching PRIMARY KEY (coach_id, club_id, start_date),
    CONSTRAINT FK_coaching_coach FOREIGN KEY (coach_id)
        REFERENCES dbo.coach (person_id),
    CONSTRAINT FK_coaching_club FOREIGN KEY (club_id)
        REFERENCES dbo.club (club_id),
    CONSTRAINT CK_coaching_dates CHECK (end_date >= start_date)
);
GO

-- Match score remains derived from goal events.
CREATE TABLE dbo.[match] (
    match_id INT IDENTITY(1, 1) NOT NULL,
    season_id INT NOT NULL,
    home_club_id INT NOT NULL,
    away_club_id INT NOT NULL,
    referee_id INT NOT NULL,
    week INT NOT NULL,
    CONSTRAINT PK_match PRIMARY KEY (match_id),
    CONSTRAINT FK_match_season_home_club FOREIGN KEY (season_id, home_club_id)
        REFERENCES dbo.season_club (season_id, club_id),
    CONSTRAINT FK_match_season_away_club FOREIGN KEY (season_id, away_club_id)
        REFERENCES dbo.season_club (season_id, club_id),
    CONSTRAINT FK_match_referee FOREIGN KEY (referee_id)
        REFERENCES dbo.referee (person_id),
    CONSTRAINT CK_match_distinct_clubs CHECK (home_club_id <> away_club_id),
    CONSTRAINT CK_match_week CHECK (week > 0)
);
GO

CREATE TABLE dbo.appearance (
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    is_starter BIT NOT NULL,
    CONSTRAINT PK_appearance PRIMARY KEY (match_id, player_id),
    CONSTRAINT FK_appearance_match FOREIGN KEY (match_id)
        REFERENCES dbo.[match] (match_id),
    CONSTRAINT FK_appearance_player FOREIGN KEY (player_id)
        REFERENCES dbo.player (person_id)
);
GO

CREATE TABLE dbo.match_event (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    minute INT NOT NULL,
    CONSTRAINT PK_match_event PRIMARY KEY (match_id, event_no),
    CONSTRAINT FK_match_event_match FOREIGN KEY (match_id)
        REFERENCES dbo.[match] (match_id),
    CONSTRAINT CK_match_event_number CHECK (event_no > 0),
    CONSTRAINT CK_match_event_minute CHECK (minute >= 0)
);
GO

CREATE TABLE dbo.goal (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    goal_type NVARCHAR(40) NOT NULL,
    CONSTRAINT PK_goal PRIMARY KEY (match_id, event_no),
    CONSTRAINT FK_goal_match_event FOREIGN KEY (match_id, event_no)
        REFERENCES dbo.match_event (match_id, event_no)
);
GO

CREATE TABLE dbo.card (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    colour NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_card PRIMARY KEY (match_id, event_no),
    CONSTRAINT FK_card_match_event FOREIGN KEY (match_id, event_no)
        REFERENCES dbo.match_event (match_id, event_no)
);
GO

CREATE TABLE dbo.substitution (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    is_injury BIT NOT NULL,
    CONSTRAINT PK_substitution PRIMARY KEY (match_id, event_no),
    CONSTRAINT FK_substitution_match_event FOREIGN KEY (match_id, event_no)
        REFERENCES dbo.match_event (match_id, event_no)
);
GO

CREATE TABLE dbo.event_player (
    match_id INT NOT NULL,
    event_no INT NOT NULL,
    player_id INT NOT NULL,
    [role] NVARCHAR(30) NOT NULL,
    CONSTRAINT PK_event_player PRIMARY KEY (match_id, event_no, player_id),
    CONSTRAINT FK_event_player_match_event FOREIGN KEY (match_id, event_no)
        REFERENCES dbo.match_event (match_id, event_no),
    CONSTRAINT FK_event_player_player FOREIGN KEY (player_id)
        REFERENCES dbo.player (person_id)
);
GO
