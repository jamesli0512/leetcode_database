/*
Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/

# Write your MySQL query statement below
SELECT * AS ConsecutiveNums
FROM Logs t1, Logs t2, Logs t3
WHERE t1.Num = t2.Num 
    AND t2.Num = t3.Num 
    And t1.id = t2.id - 1 
    AND t2.id = t3.id - 1;
