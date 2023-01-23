/*
Problem statement: Perform inner join of tableA & tableB and include NULL values as well
Question link: https://youtu.be/safAu1tEIrA
*/

-- Dataset:

-- Table A:
CREATE TABLE tableA (A INT);
INSERT INTO tableA VALUES (1), (2), (1), (5), (NULL), (NULL);
SELECT * FROM tableA;
+------+
| A    |
+------+
|    1 |
|    2 |
|    1 |
|    5 |
| NULL |
| NULL |
+------+

-- Table B:
CREATE TABLE tableB (B INT);
INSERT INTO tableB VALUES (NULL), (2), (5), (5);
SELECT * FROM tableB;
+------+
| B    |
+------+
| NULL |
|    2 |
|    5 |
|    5 |
+------+

-- Solution #1:
SELECT *
FROM tableA INNER JOIN tableB
ON A = B OR (A IS NULL AND B IS NULL);
-- Used 2nd condition to consider NULL values while joining two tables


-- Solution #2:
-- Alternatively we can use NULL SAFE JOIN operator <=> for this
SELECT *
FROM tableA INNER JOIN tableB
ON A <=> B;

-- Output:
+------+------+
| A    | B    |
+------+------+
|    2 |    2 |
|    5 |    5 |
|    5 |    5 |
| NULL | NULL |
| NULL | NULL |
+------+------+
