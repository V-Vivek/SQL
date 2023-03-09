# JOIN
- A JOIN is a way to combine rows from two or more tables based on a related column between them. 
- There are several types of joins, which return different subsets of the data based on the relationships between the tables. 
- A JOIN combines the data horizontally, resulting in a single table with the combined data.

# EXISTS 
- It is a type of subquery that is used to test if a row exists in a subquery table that meets certain conditions. 
- The EXISTS keyword returns a ***Boolean value of true or false***, indicating whether the subquery returns any rows. 
- The EXISTS keyword can be ***used to improve the performance of queries*** by returning a result faster than a JOIN, as it only needs to determine if the data exists, rather than returning the data itself.

***The choice between a JOIN and EXISTS depends on the requirements of the query. If you need to combine the data from multiple tables into a single result set, a join is the appropriate technique. If you only need to test for the existence of data in a subquery, then the EXISTS keyword is more efficient.***

# Example
- Problem Statement - Check if 'Shashank' has placed any order

## Input

```
SELECT * FROM customers;
+-------------+---------------+----------------+
| customer_id | customer_name | customer_email |
+-------------+---------------+----------------+
|           1 | Shashank      | abc@gmail.com  |
|           2 | Rahul         | aaa@gmail.com  |
|           3 | Ajay          | klm@gmail.com  |
|           4 | Nitin         | poc@gmail.com  |
|           5 | Naveen        | mnc@gmail.com  |
+-------------+---------------+----------------+

SELECT * FROM orders;
+----------+-------------+--------+-----------+
| order_id | customer_id | amount | status    |
+----------+-------------+--------+-----------+
|      101 |           1 |    550 | Delivered |
|      102 |           2 |    350 | Delivered |
|      103 |           1 |    220 | Cancelled |
|      104 |           3 |    660 | Delivered |
|      105 |           3 |    300 | Delivered |
+----------+-------------+--------+-----------+
```

## Using JOIN
- JOIN returns duplicate data & does not stop as soon as we get the 1st entry with customer as 'Shashank'
```
SELECT c.*
FROM customers c LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NOT NULL AND c.customer_name = 'Shashank';
+-------------+---------------+----------------+
| customer_id | customer_name | customer_email |
+-------------+---------------+----------------+
|           1 | Shashank      | abc@gmail.com  |
|           1 | Shashank      | abc@gmail.com  |
+-------------+---------------+----------------+
```

## Using EXISTS
- EXISTS stops execution as soon as it finds the 1st entry for 'Shashank'
```
SELECT c.*
FROM customers c
WHERE EXISTS (SELECT order_id FROM orders o WHERE c.customer_id = o.customer_id AND c.customer_name = 'Shashank');
+-------------+---------------+----------------+
| customer_id | customer_name | customer_email |
+-------------+---------------+----------------+
|           1 | Shashank      | abc@gmail.com  |
+-------------+---------------+----------------+
```
