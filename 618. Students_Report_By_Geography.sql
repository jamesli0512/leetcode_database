/*
A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table student as below.
| name   | continent |
|--------|-----------|
| Jack   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jane   | America   |
 
Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. 
The output headers should be America, Asia and Europe respectively. 
It is guaranteed that the student number from America is no less than either Asia or Europe.

For the sample input, the output is:
| America | Asia | Europe |
|---------|------|--------|
| Jack    | Xi   | Pascal |
| Jane    |      |        |

Follow-up: If it is unknown which continent has the most students, can you write a query to generate the student report?
*/

SELECT
    t1.name AS 'America',
    t2.name AS 'Asia', 
    t3.name AS 'Europe'
FROM
    (SELECT @am:=0, @as:=0, @eu:=0) t0,
    (
     SELECT 
            (@am:=@am+1) AS 'amid',
            name
     FROM 
            student
     WHERE 
            continent = 'America'
     ORDER BY
            name
    ) t1
LEFT JOIN
    (
     SELECT 
            (@as:=@as+1) AS 'asid',
            name
     FROM 
            student
     WHERE 
            continent = 'Asia'
     ORDER BY
            name
    ) t2
ON 
    t1.amid = t2.asid
LEFT JOIN
    (
     SELECT 
            (@eu:=@eu+1) AS 'euid',
            name
     FROM 
            student
     WHERE 
            continent = 'Europe'
     ORDER BY
            name
    ) t3
ON 
    t1.amid = t3.euid
;
