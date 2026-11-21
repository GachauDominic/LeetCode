-- Write your PostgreSQL query statement below
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

/*
Description:
1. Group records by player_id.
2. Find the earliest event_date for each player using MIN().
3. Return the player id and first login date.
*/

/*
SELECT
    a.player_id,
    (
        SELECT MIN(event_date)
        FROM Activity
        WHERE player_id = a.player_id
    ) AS first_login
FROM Activity a
GROUP BY a.player_id;
*/