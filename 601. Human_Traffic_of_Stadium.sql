/*
X city built a new stadium, each day many people visit it and the stats are saved as these columns: id, visit_date, people
Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).

For example, the table stadium:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+

For the sample data above, the output is:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+

Note:
Each day only have one row record, and the dates are increasing with id increasing.
*/

# Write your MySQL query statement below

SELECT s.*
FROM stadium s
LEFT JOIN stadium lag1 ON s.id = lag1.id - 1
LEFT JOIN stadium lag2 ON s.id = lag2.id - 2
LEFT JOIN stadium lead1 ON s.id = lead1.id + 1
LEFT JOIN stadium lead2 ON s.id = lead2.id + 2
WHERE (s.people >= 100 AND lag1.people >= 100 AND lag2.people >= 100)
    OR
      (s.people >= 100 AND lead1.people >= 100 AND lead2.people >= 100)
    OR
      (s.people >= 100 AND lag1.people >= 100 AND lead1.people >= 100)
ORDER BY s.id;
