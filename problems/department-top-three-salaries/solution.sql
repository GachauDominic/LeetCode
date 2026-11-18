-- Write your PostgreSQL query statement below
SELECT
    Department,
    Employee,
    Salary
FROM (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS rnk
    FROM Employee e
    JOIN Department d
        ON e.departmentId = d.id
) t
WHERE rnk <= 3;

/*
Description:
1. Partition employees by department.
2. Rank salaries within each department using DENSE_RANK().
3. Employees with the same salary receive the same rank.
Keep employees whose rank is 3 or less.
4. Return department, employee, and salary information.
*/

/*
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.departmentId = e.departmentId
      AND e2.salary > e.salary
) < 3;

Description:
1.For each employee, count the number of distinct salaries in the same department that are higher than theirs.
2. If fewer than three distinct salaries are higher, the employee belongs to the department's top three unique salary groups.
3. Return the employee information.
*/
