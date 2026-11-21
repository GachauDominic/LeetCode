-- Write your PostgreSQL query statement below
SELECT
    t.request_at AS "Day",
    ROUND(
        AVG(
            CASE
                WHEN t.status <> 'completed' THEN 1.0
                ELSE 0.0
            END
        ),
        2
    ) AS "Cancellation Rate"
FROM Trips t
JOIN Users c
    ON t.client_id = c.users_id
JOIN Users d
    ON t.driver_id = d.users_id
WHERE c.banned = 'No'
  AND d.banned = 'No'
  AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;

/*
Description:
1. Join Trips with Users twice, once for clients and once for drivers.
2. Keep only trips where both users are not banned.
3. Convert cancelled trips to 1 and completed trips to 0.
4. Calculate the average per day.
5. Round to two decimal places.
*/

/*
SELECT
    t.request_at AS "Day",
    ROUND(
        SUM(
            CASE
                WHEN t.status <> 'completed' THEN 1
                ELSE 0
            END
        )::numeric
        / COUNT(*),
        2
    ) AS "Cancellation Rate"
FROM Trips t
JOIN Users c
    ON c.users_id = t.client_id
JOIN Users d
    ON d.users_id = t.driver_id
WHERE c.banned = 'No'
  AND d.banned = 'No'
  AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;

Description:
1. Count cancelled trips.
2. Count all valid trips.
3. Divide cancelled trips by total trips.
4. Group by day.
*/