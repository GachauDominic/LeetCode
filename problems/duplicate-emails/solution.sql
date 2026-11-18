-- Write your PostgreSQL query statement below
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
/* How it works
Step 1: Group rows by email:
GROUP BY email
Step 2: Keep only duplicate groups:
HAVING COUNT(*) > 1 
*/

/*
SELECT DISTINCT email AS Email
FROM Person
WHERE email IN (
    SELECT email
    FROM Person
    GROUP BY email
    HAVING COUNT(*) > 1
);
How it works
The subquery finds duplicate emails:
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
*/

/*
SELECT DISTINCT p1.email AS Email
FROM Person p1
JOIN Person p2
    ON p1.email = p2.email
   AND p1.id <> p2.id;

How it works

The join matches rows having the same email but different IDs.

Example:

p1.id	p2.id	email
1	      3	    a@b.com
3	      1	    a@b.com
*/