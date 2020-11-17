-- 1. Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner FROM nobel
    WHERE yr = '1950'


-- 2. Show who won the 1962 prize for Literature.

SELECT winner FROM nobel
    WHERE yr = 1962 AND subject = 'Literature'


-- 3. Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject FROM nobel
    WHERE winner LIKE 'Albert Ein%'


-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel
    WHERE subject LIKE 'Peace' AND yr >= 2000


-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner FROM nobel
    WHERE subject LIKE 'Liter%' AND ((yr >= 1980) AND (yr <= 1989))


-- 6. Show all details of the presidential winners:
--    - Theodore Roosevelt
--    - Woodrow Wilson
--    - Jimmy Carter
--    - Barack Obama

SELECT yr, subject, winner FROM nobel
    WHERE (winner LIKE 'Theodore Roose%') OR (winner LIKE 'Woodrow Wi%')
    OR (winner LIKE 'Jimmy Car%') OR (winner LIKE 'Barack Ob%')