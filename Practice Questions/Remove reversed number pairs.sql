Problem statement: Remove all reversed number pairs from given table, keep only one (random)
Question link: https://youtu.be/LJuGi0VRCA0

-- Creating the dataset
CREATE TABLE number_pairs(A INT, B INT);
INSERT INTO number_pairs VALUES (1,2), (3,2), (2,4), (2,1), (5,6), (4,2), (1,2);
SELECT * FROM number_pairs;
+------+------+
| A    | B    |
+------+------+
|    1 |    2 |
|    3 |    2 |
|    2 |    4 |
|    2 |    1 |
|    5 |    6 |
|    4 |    2 |
|    1 |    2 |
+------+------+

-- Solution

-- Creating CTE
WITH T1 AS
(
  SELECT A, B, ROW_NUMBER() OVER() AS rn
  FROM number_pairs
)

SELECT A, B
FROM T1
WHERE CONCAT(A,B) NOT IN (SELECT CONCAT(B,A) FROM T1 AS inside WHERE T1.rn < inside.rn);
/* 
This code selects the "A" and "B" columns from "T1" table, and only returns rows where the combination of "A" and "B" is not found in the combination of "B" and "A" in any other row below the current row. */

-- Output
+------+------+
| A    | B    |
+------+------+
|    3 |    2 |
|    5 |    6 |
|    4 |    2 |
|    1 |    2 |
+------+------+
