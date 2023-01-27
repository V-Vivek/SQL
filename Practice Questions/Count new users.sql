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

-- Solution:

WITH T1 AS
(
  SELECT tra_dt, user_id
  FROM user_act
)
SELECT * FROM T1;
