-- Question Link: https://www.codingninjas.com/codestudio/problems/warehouse-manager_2181185?utm_source=youtube&utm_medium=affiliate&utm_campaign=sqlproblemlist_shashank

-- Solution

SELECT name AS warehouse_name, SUM(units * Width * Length * Height) AS volume
FROM Warehouse w JOIN Products p
ON w.product_id = p.product_id
GROUP BY 1;
