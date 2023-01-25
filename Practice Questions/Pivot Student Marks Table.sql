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

