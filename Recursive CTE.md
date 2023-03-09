# Recursive CTE
- A recursive CTE in SQL is a technique used to perform a recursive query on a hierarchical or recursive data structure.
- It allows you to write a single SQL statement that repeatedly executes itself to generate a result set.
- Recursive CTEs are often used to query data that is represented in a tree-like structure, such as organizational charts, file systems, or product categories.

## Syntax
```
WITH RECURSIVE my_cte (column1, column2, ..., columnN) AS (
    -- Anchor member
    SELECT column1, column2, ..., columnN
    FROM table_name
    WHERE condition

    UNION ALL

    -- Recursive member
    SELECT column1, column2, ..., columnN
    FROM table_name
    JOIN my_cte ON join_condition
    WHERE condition
)
SELECT *
FROM my_cte;
```
- The CTE consists of two parts: the Anchor member and the Recursive member.
- The Anchor member is the initial query that selects the starting rows for the recursion
- While the Recursive member is the query that joins the CTE to itself to generate additional rows. 
- The UNION ALL operator is used to combine the results of the Anchor member and the Recursive member.

## Example #1
- Write a query to generate a list of numbers from 1 to 10

```
WITH RECURSIVE T1 AS
(
  -- Anchor member
  SELECT 1 AS n
  UNION
  -- Recursive member
  SELECT n+1 FROM T1 WHERE n<10
)
SELECT * FROM T1;
```

