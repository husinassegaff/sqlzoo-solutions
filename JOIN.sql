--  1. Show the matchid and player name for all goals scored by Germany.

SELECT matchid, plater FROM goal
    WHERE teamid LIKE 'GER'


--  2. Show id, stadium, team1, team2 for just game 1012

SELECT id, stadium, team1, team2 FROM game
    WHERE id = '1012'


--  3. Show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate FROM goal 
    JOIN game ON ((goal.matchid = game.id) && goal.teamid = 'GER')


--  4. Show the team1, team2 and player for every goal scored by 
--     a player called Mario

SELECT team1, team2, player FROM game
    JOIN goal ON (game.id = goal.matchid && goal.player LIKE 'Mario%')


--  5. Show player, teamid, coach, gtime for all goals scored in the 
--     first 10 minutes

SELECT player, teamid, coach, gtime FROM goal
    JOIN eteam ON (goal.teamid = eteam.id && goal.gtime <= 10)


--  6. List the dates of the matches and the name of the team in which 
--     'Fernando Santos' was the team1 coach.

SELECT mdate, teamname FROM game
    JOIN eteam ON (game.team1 = eteam.id  && eteam.coach LIKE 'Fernando Santos')

--  7. List the player for every goal scored in a game where the stadium 
--     was 'National Stadium, Warsaw'

SELECT player FROM goal 
    JOIN game ON (goal.matchid = game.id && game.stadium = 'National Stadium, Warsaw')


--  8. Instead show the name of all players who scored a goal against Germany.

SELECT player FROM goal
    JOIN game ON (game.id = goal.matchid && goal.teamid != 'GER'
        && (game.team2 = 'GER'))

--  9. Show teamname and the total number of goals scored.

SELECT teamname, COUNT(gtime) AS goals FROM eteam
    JOIN goal ON (goal.teamid = eteam.id)
        GROUP BY teamname


--  10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(gtime) AS goals FROM game 
    JOIN goal ON (goal.matchid = game.id)
        GROUP BY stadium


--  11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid, mdate , COUNT(gtime) AS goals FROM game 
    JOIN goal ON (goal.matchid = game.id AND (game.team1 = 'POL' OR game.team2 = 'POL'))
        GROUP BY matchid, mdate

--  12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT  matchid, mdate, COUNT(gtime) AS goals FROM game
    JOIN goal ON (goal.matchid = game.id AND (goal.teamid = 'GER'))
        GROUP BY matchid, mdate
