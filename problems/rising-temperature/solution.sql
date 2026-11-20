-- Write your PostgreSQL query statement below
SELECT w1.id
FROM Weather w1
JOIN Weather w2
    ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;

/*
Description:
1. Join the table with itself.
2. Match each date with the previous calendar date.
3. Compare temperatures.
4. Return ids where today's temperature is higher than yesterday's.
*/

/*
SELECT w1.id
FROM Weather w1
WHERE w1.temperature >
(
    SELECT w2.temperature
    FROM Weather w2
    WHERE w2.recordDate = w1.recordDate - INTERVAL '1 day'
);
Description:
1. For each weather record, locate yesterday's record.
2. Retrieve yesterday's temperature.
3. Compare today's temperature to yesterday's.
4. Return ids where today's temperature is higher.
*/

/*
SELECT w1.id
FROM Weather w1
WHERE EXISTS (
    SELECT 1
    FROM Weather w2
    WHERE w2.recordDate = w1.recordDate - INTERVAL '1 day'
      AND w1.temperature > w2.temperature
);
*/