-- Write your PostgreSQL query statement below
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1
    LIMIT 1
) AS "SecondHighestSalary";

/*
DISTINCT salary removes duplicate salaries.
ORDER BY salary DESC sorts salaries from highest to lowest.
OFFSET 1 skips the highest salary.
LIMIT 1 returns the next salary, which is the second highest distinct salary.
If there is no second distinct salary, the subquery returns no rows, and PostgreSQL returns NULL. 
*/
