/*
The Numbers table keeps the value of number and its frequency.
+----------+-------------+
|  Number  |  Frequency  |
+----------+-------------|
|  0       |  7          |
|  1       |  1          |
|  2       |  3          |
|  3       |  1          |
+----------+-------------+

In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.
+--------+
| median |
+--------|
| 0.0000 |
+--------+

Write a query to find the median of all numbers and name the result as median.
*/

# Write your MySQL query statement below

SELECT
    AVG(n1.Number) AS 'median'
FROM
    Numbers n1
WHERE
    n1.Frequency 
    >= 
    ABS((SELECT SUM(n2.Frequency) FROM Numbers n2 WHERE n2.Number <= n1.Number)
        - (SELECT SUM(n2.Frequency) FROM Numbers n2 WHERE n2.Number >= n1.Number))
;
