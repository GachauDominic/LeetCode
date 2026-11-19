-- Write your PostgreSQL query statement below
DELETE FROM Person p1
USING Person p2
WHERE p1.email = p2.email
  AND p1.id > p2.id;

/*
Description
1. Join the table with itself on matching emails.
2. Compare the ids within each duplicate email group.
3. Delete rows whose id is greater than another row with the same email.
4. Keep only the row with the smallest id.
*/

/*
DELETE FROM Person
WHERE id NOT IN (
    SELECT *
    FROM (
        SELECT MIN(id)
        FROM Person
        GROUP BY email
    ) t
);
Description
1. Determine the smallest id for every email.
2. Keep those ids.
3. Delete rows whose ids are not in that list.
*/

/*
DELETE FROM Person p1
WHERE EXISTS (
    SELECT 1
    FROM Person p2
    WHERE p1.email = p2.email
      AND p1.id > p2.id
);
How it works
For each row, check whether another row:
    -has the same email
    -has a smaller id

If one exists, delete the current row.

Description:
1. Inspect each email row.
2. Check whether another row with the same email and a smaller id exists.
3. Delete such rows.
4. Retain the smallest-id record for each email
*/