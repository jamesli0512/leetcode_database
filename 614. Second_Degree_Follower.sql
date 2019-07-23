/*
In facebook, there is a follow table with two columns: followee, follower.
Please write a sql query to get the amount of each follower’s follower if he/she has one.

For example:
+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+

should output:
+-------------+------------+
| follower    | num        |
+-------------+------------+
|     B       |  2         |
|     D       |  1         |
+-------------+------------+

Explaination:
Both B and D exist in the follower list, when as a followee, B's follower is C and D, and D's follower is E. 
A does not exist in follower list.

Note:
Followee would not follow himself/herself in all cases.
Please display the result in follower's alphabet order.
*/

# 1. Write your MySQL query statement below
/*######This solution does not work when follower or followee names are case-sensitive#####*/
SELECT
    f.followee AS 'follower',
    COUNT(DISTINCT CONCAT(f.followee, f.follower)) AS 'num'
FROM 
    follow f
GROUP BY
    f.followee
HAVING
    f.followee IN (SELECT follower FROM follow)
;

# 2. Write your MySQL query statement below
SELECT
    f1.follower,
    COUNT(DISTINCT f2.follower) AS 'num'
FROM
    follow f1
    JOIN
    follow f2
    ON
    f1.follower = f2.followee
GROUP BY 
    f1.follower
ORDER BY
    f1.follower
;
