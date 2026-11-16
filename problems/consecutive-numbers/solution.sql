WITH cte AS (
    SELECT
        id,
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
GROUP BY num, grp
HAVING COUNT(*) >= 3;