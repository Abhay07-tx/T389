CREATE DATABASE cricket_DB;
USE cricket_DB;
CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) NOT NULL,
    coach VARCHAR(100)
);
desc teams;

CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
desc players;

USE cricket_DB;

CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    team1_id INT,
    team2_id INT,
    match_date DATE,
    venue VARCHAR(100),
    winner_team_id INT,
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES Teams(team_id)
);
desc matches;
desc cricket_DB.matches;
USE cricket_DB;

USE cricket_DB;


INSERT INTO Teams (team_name, coach) VALUES ('India', 'Gautam Gambhir');
INSERT INTO Teams (team_name, coach) VALUES ('Australia', 'Andrew McDonald');


INSERT INTO Players (player_name, role, team_id) VALUES ('Virat Kohli', 'Batsman', 1);
INSERT INTO Players (player_name, role, team_id) VALUES ('Rohit Sharma', 'Batsman', 1);
INSERT INTO Players (player_name, role, team_id) VALUES ('Jasprit Bumrah', 'Bowler', 1);
INSERT INTO Players (player_name, role, team_id) VALUES ('Pat Cummins', 'Bowler', 2);
INSERT INTO Players (player_name, role, team_id) VALUES ('Glenn Maxwell', 'All-rounder', 2);


INSERT INTO Matches (team1_id, team2_id, match_date, venue, winner_team_id) 
VALUES (1, 2, '2026-10-06', 'Wankhede Stadium', 1);

SELECT * FROM Teams;
SELECT * FROM players;
SELECT * FROM matches;
SELECT player_name, role FROM Players;

SELECT Players.player_name, Players.role, Teams.team_name 
FROM Players 
JOIN Teams ON Players.team_id = Teams.team_id;

USE cricket_DB;

CREATE TABLE Player_Stats (
    stat_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT,
    player_id INT,
    runs_scored INT DEFAULT 0,
    balls_faced INT DEFAULT 0,
    wickets_taken INT DEFAULT 0,
    overs_bowled DECIMAL(3,1) DEFAULT 0.0,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);
USE cricket_DB;

INSERT INTO Player_Stats (match_id, player_id, runs_scored, balls_faced, wickets_taken, overs_bowled) 
VALUES (1, 1, 139, 88, 0, 0.0);

INSERT INTO Player_Stats (match_id, player_id, runs_scored, balls_faced, wickets_taken, overs_bowled) 
VALUES (1, 4, 0, 2, 3, 10.0);
SELECT player_id, player_name FROM cricket_DB.Players;

USE cricket_DB;

-- 1. पहले मैच नंबर 1 को दोबारा या नए सिरे से पक्का करें
-- (अगर यह पहले से होगा तो कोई बात नहीं, नहीं होगा तो बन जाएगा)
INSERT IGNORE INTO Matches (match_id, team1_id, team2_id, match_date, venue, winner_team_id) 
VALUES (1, 1, 2, '2026-10-06', 'Wankhede Stadium', 1);

-- 2. अब खिलाड़ियों का स्कोरकार्ड डेटा डालें (यह अब 100% रन हो जाएगा)
INSERT INTO Player_Stats (match_id, player_id, runs_scored, balls_faced, wickets_taken, overs_bowled) 
VALUES (1, 1, 139, 88, 0, 0.0);

INSERT INTO Player_Stats (match_id, player_id, runs_scored, balls_faced, wickets_taken, overs_bowled) 
VALUES (1, 4, 0, 2, 3, 10.0);

USE cricket_DB;

-- खिलाड़ियों के नाम और उनके प्रदर्शन को टीम के साथ जोड़कर देखना
SELECT 
    p.player_name AS 'खिलाड़ी का नाम', 
    t.team_name AS 'टीम', 
    ps.runs_scored AS 'बनाए गए रन', 
    ps.balls_faced AS 'खेली गई गेंदें', 
    ps.wickets_taken AS 'लिए गए विकेट', 
    ps.overs_bowled AS 'फेंके गए ओवर'
FROM Player_Stats ps
JOIN Players p ON ps.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id;

USE cricket_DB;

-- Viewing player performance with clean English column headers
SELECT 
    p.player_name AS 'Player_Name', 
    t.team_name AS 'Team', 
    ps.runs_scored AS 'Runs_Scored', 
    ps.balls_faced AS 'Balls_Faced', 
    ps.wickets_taken AS 'Wickets_Taken', 
    ps.overs_bowled AS 'Overs_Bowled'
FROM Player_Stats ps
JOIN Players p ON ps.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id;

USE cricket_DB;

-- सबसे ज़्यादा रन बनाने वाले खिलाड़ी की डिटेल्स निकालना
SELECT 
    p.player_name AS 'Player_Name', 
    t.team_name AS 'Team', 
    SUM(ps.runs_scored) AS 'Total_Runs'
FROM Player_Stats ps
JOIN Players p ON ps.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id
GROUP BY p.player_id, p.player_name, t.team_name
ORDER BY Total_Runs DESC
LIMIT 1;

USE cricket_DB;

-- Finding the highest run scorer with a clean query
SELECT 
    p.player_name AS 'Player_Name', 
    t.team_name AS 'Team', 
    SUM(ps.runs_scored) AS 'Total_Runs'
FROM Player_Stats ps
JOIN Players p ON ps.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id
GROUP BY p.player_id, p.player_name, t.team_name
ORDER BY Total_Runs DESC
LIMIT 1;

-- Finding the highest wicket taker from the database
SELECT 
    p.player_name AS 'Player_Name', 
    t.team_name AS 'Team', 
    SUM(ps.wickets_taken) AS 'Total_Wickets'
FROM Player_Stats ps
JOIN Players p ON ps.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id
GROUP BY p.player_id, p.player_name, t.team_name
ORDER BY Total_Wickets DESC
LIMIT 1;

USE cricket_DB;

-- 1. खिलाड़ियों का Strike Rate (स्ट्राइक रेट) और Economy (इकोनॉमी) रिपोर्ट
SELECT 
    p.player_name AS 'Player_Name',
    t.team_name AS 'Team',
    SUM(ps.runs_scored) AS 'Total_Runs',
    -- स्ट्राइक रेट का फार्मूला
    ROUND((SUM(ps.runs_scored) / SUM(ps.balls_faced)) * 100, 2) AS 'Strike_Rate',
    SUM(ps.wickets_taken) AS 'Total_Wickets',
    -- इकोनॉमी रेट का फार्मूला
    ROUND((SUM(ps.runs_scored) / SUM(ps.overs_bowled)), 2) AS 'Economy_Rate'
FROM Player_Stats ps
JOIN Players p ON ps.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id
GROUP BY p.player_id, p.player_name, t.team_name;


-- 2. मैच के नतीजों की फाइनल समरी रिपोर्ट
SELECT 
    m.match_id AS 'Match_No',
    m.match_date AS 'Match_Date',
    t1.team_name AS 'Team_1',
    t2.team_name AS 'Team_2',
    m.venue AS 'Venue',
    tw.team_name AS 'Winner_Team'
FROM Matches m
JOIN Teams t1 ON m.team1_id = t1.team_id
JOIN Teams t2 ON m.team2_id = t2.team_id
JOIN Teams tw ON m.winner_team_id = tw.team_id;

USE cricket_DB;

-- 1. सभी टीमों की जानकारी देखने के लिए
SELECT * FROM Teams;

-- 2. सभी खिलाड़ियों की जानकारी देखने के लिए
SELECT * FROM Players;

-- 3. सभी मैचों का रिकॉर्ड देखने के लिए
SELECT * FROM Matches;

-- 4. खिलाड़ियों के सभी रन और विकेट के स्टैट्स देखने के लिए
SELECT * FROM Player_Stats;

