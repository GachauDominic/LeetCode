CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
IF N < 1 THEN 
    RETURN QUERY(SELECT NULL::INT AS salary);
ELSE
  RETURN QUERY (
    SELECT DISTINCT Employee.salary
      from Employee
      ORDER BY salary DESC
      LIMIT 1
      OFFSET N-1
  );
 END IF;
END;
$$ LANGUAGE plpgsql;

/*
Check whether N is a valid value (N >= 1).
If N < 1, return NULL.
Select the distinct salaries from the Employee table.
Sort the salaries in descending order.
Skip the first N - 1 salaries using OFFSET.
Return the next salary using LIMIT 1.
If no salary exists at that position, the query returns no rows.

Validate the input N, then retrieve the Nth highest distinct salary by sorting unique salaries in descending order and selecting the row at position N using OFFSET and LIMIT.

The function first checks whether N is a positive integer. If not, it returns NULL. Otherwise, it retrieves all distinct salaries, orders them from highest to lowest, skips the first N - 1 salaries using OFFSET, and returns the next salary using LIMIT 1, which corresponds to the Nth highest distinct salary.
*/
