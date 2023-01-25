/*
Problem statement: Invert this table in below given format
Question link: https://youtu.be/QSwHIi11434
*/

-- Dataset:

CREATE TABLE marks (id INT, subject VARCHAR(20), marks INT);
INSERT INTO marks VALUES(1001,'English',88);
INSERT INTO marks VALUES(1001,'Science',90);
INSERT INTO marks VALUES(1001,'Maths',85);
INSERT INTO marks VALUES(1002,'English',70);
INSERT INTO marks VALUES(1002,'Science',80);
INSERT INTO marks VALUES(1002,'Maths',83);
SELECT * FROM marks;

+------+---------+-------+
| id   | subject | marks |
+------+---------+-------+
| 1001 | English |    88 |
| 1001 | Science |    90 |
| 1001 | Maths   |    85 |
| 1002 | English |    70 |
| 1002 | Science |    80 |
| 1002 | Maths   |    83 |
+------+---------+-------+

-- Solution:

-- Used SUM() to aggregate the values for each student_id & avoid 0 value. MAX() can also be used
SELECT DISTINCT id AS student_id,
SUM(CASE WHEN subject = 'English' THEN marks ELSE 0 END) AS 'English',
SUM(CASE WHEN subject = 'Science' THEN marks ELSE 0 END) AS 'Science',
SUM(CASE WHEN subject = 'Maths' THEN marks ELSE 0 END) AS 'Maths'
FROM marks
GROUP BY 1;

-- Output:

+------------+---------+---------+-------+
| student_id | English | Science | Maths |
+------------+---------+---------+-------+
|       1001 |      88 |      90 |    85 |
|       1002 |      70 |      80 |    83 |
+------------+---------+---------+-------+
