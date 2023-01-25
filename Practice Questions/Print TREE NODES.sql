/*
Problem statement: Print the type of each node for given binary tree
Question link: https://youtu.be/R-Q21IewcRU
*/

-- Dataset:

CREATE TABLE Tree_Nodes(N INT, P INT);
INSERT INTO Tree_Nodes VALUES (5, 6), (4, 6), (6, NULL), (3, 5), (2, 5), (1, 4);
SELECT * FROM Tree_Nodes;
+------+------+
| N    | P    |
+------+------+
|    5 |    6 |
|    4 |    6 |
|    6 | NULL |
|    3 |    5 |
|    2 |    5 |
|    1 |    4 |
+------+------+


-- Solution #1:

SELECT N AS Node,
CASE
	WHEN P IS NULL THEN 'Root'
  WHEN N NOT IN (SELECT DISTINCT P FROM Tree_Nodes WHERE P IS NOT NULL) THEN 'Leaf' -- Used ***P IS NOT NULL*** condition to avoid comparison with NULL
  ELSE 'Inner'
END AS Type
FROM Tree_Nodes
ORDER BY 1 DESC;

-- Solution #2:

SELECT N AS Node,
CASE
	WHEN P IS NULL THEN 'Root'
  WHEN N IN (SELECT DISTINCT P FROM Tree_Nodes) THEN 'Inner'
  ELSE 'Leaf'
END AS Type
FROM Tree_Nodes
ORDER BY 1 DESC;


-- Output

+------+-------+
| Node | Type  |
+------+-------+
|    6 | Root  |
|    5 | Inner |
|    4 | Inner |
|    3 | Leaf  |
|    2 | Leaf  |
|    1 | Leaf  |
+------+-------+
