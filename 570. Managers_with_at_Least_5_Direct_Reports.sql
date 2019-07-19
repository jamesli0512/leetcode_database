/*
The Employee table holds all employees including their managers. 
Every employee has an Id, and there is also a column for the manager Id.
+------+----------+-----------+----------+
|Id    |Name 	  |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	  |A 	      |null      |
|102   |Dan 	  |A 	      |101       |
|103   |James 	  |A 	      |101       |
|104   |Amy 	  |A 	      |101       |
|105   |Anne 	  |A 	      |101       |
|106   |Ron 	  |B 	      |101       |
+------+----------+-----------+----------+

Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. 
For the above table, your SQL query should return:
+-------+
| Name  |
+-------+
| John  |
+-------+
*/

# Write your MySQL query statement below

SELECT
    e1.Name
FROM
    Employee e1
    JOIN
    (
        SELECT e2.ManagerId 
        FROM Employee e2
        GROUP BY e2.ManagerId
        HAVING COUNT(e2.ManagerId) >= 5
    ) e3
    ON
    e1.Id = e3.ManagerId
;
