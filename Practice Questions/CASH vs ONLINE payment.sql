/*
Problem statement: Write SQL query to find total amount received by each merchant via CASH & ONLINE mode
Question link: https://youtu.be/odTg-nGIfwE
*/

-- Creating the dataset

CREATE TABLE sale (merchant VARCHAR(20), amount INT, pay_mode VARCHAR(10));
INSERT INTO sale VALUES('merchant_1',150,'cash');
INSERT INTO sale VALUES('merchant_1',500,'online');
INSERT INTO sale VALUES('merchant_2',450,'online');
INSERT INTO sale VALUES('merchant_1',100,'cash');
INSERT INTO sale VALUES('merchant_3',600,'cash');
INSERT INTO sale VALUES('merchant_5',200,'online');
INSERT INTO sale VALUES('merchant_2',100,'online');
SELECT * FROM sale;
+------------+--------+----------+
| merchant   | amount | pay_mode |
+------------+--------+----------+
| merchant_1 |    150 | cash     |
| merchant_1 |    500 | online   |
| merchant_2 |    450 | online   |
| merchant_1 |    100 | cash     |
| merchant_3 |    600 | cash     |
| merchant_5 |    200 | online   |
| merchant_2 |    100 | online   |
+------------+--------+----------+

-- Solution

-- Used SUM() on entire CASE statement to get the aggregated value

SELECT merchant, 
SUM(CASE WHEN pay_mode = 'cash' THEN amount ELSE 0 END) AS cash_amount,
SUM(CASE WHEN pay_mode = 'online' THEN amount ELSE 0 END) AS online_amount
FROM sale
GROUP BY merchant;

-- Output

+------------+-------------+---------------+
| merchant   | cash_amount | online_amount |
+------------+-------------+---------------+
| merchant_1 |         250 |           500 |
| merchant_2 |           0 |           550 |
| merchant_3 |         600 |             0 |
| merchant_5 |           0 |           200 |
+------------+-------------+---------------+
