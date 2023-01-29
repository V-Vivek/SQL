/*
Problem statement: Calculate unique new user count for each day
Question link: https://youtu.be/HZtUxYdnbhw
*/

-- Dataset:

CREATE TABLE user_act(tra_dt DATE, user_id INT, activity VARCHAR(20));
INSERT INTO user_act VALUES ('2022-02-20', 1, 'abc');
INSERT INTO user_act VALUES ('2022-02-20', 2, 'xyz');
INSERT INTO user_act VALUES ('2022-02-22', 1, 'xyz');
INSERT INTO user_act VALUES ('2022-02-22', 3, 'klm');
INSERT INTO user_act VALUES ('2022-02-24', 1, 'abc');
INSERT INTO user_act VALUES ('2022-02-24', 2, 'abc');
INSERT INTO user_act VALUES ('2022-02-24', 3, 'abc');
SELECT * FROM user_act;

+------------+---------+----------+
| tra_dt     | user_id | activity |
+------------+---------+----------+
| 2022-02-20 |       1 | abc      |
| 2022-02-20 |       2 | xyz      |
| 2022-02-22 |       1 | xyz      |
| 2022-02-22 |       3 | klm      |
| 2022-02-24 |       1 | abc      |
| 2022-02-24 |       2 | abc      |
| 2022-02-24 |       3 | abc      |
+------------+---------+----------+

-- Solution #1:

WITH T1 AS
(
	SELECT tra_dt, user_id,
	ROW_NUMBER() OVER(ORDER BY tra_dt) AS row_num
    FROM user_act
),
T2 AS
(
	SELECT tra_dt, 
	CASE WHEN NOT EXISTS (SELECT 1 FROM T1 a WHERE a.row_num < b.row_num AND a.user_id = b.user_id) THEN 1 ELSE 0 END AS valid
	FROM T1 AS b
)
SELECT tra_dt, SUM(valid) AS unique_user_count
FROM T2
GROUP BY tra_dt;

-- Solution #2:

WITH T1 AS
(
	SELECT tra_dt, user_id,
	ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY tra_dt) AS row_num
	FROM user_act
)
SELECT u.tra_dt, COUNT(T1.row_num)
FROM user_act u LEFT JOIN T1 ON T1.row_num = 1 AND u.tra_dt = T1.tra_dt AND u.user_id =  T1.user_id
GROUP BY 1;

-- Output:

+------------+-------------------+
| tra_dt     | unique_user_count |
+------------+-------------------+
| 2022-02-20 |                 2 |
| 2022-02-22 |                 1 |
| 2022-02-24 |                 0 |
+------------+-------------------+
