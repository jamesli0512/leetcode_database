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
/* For the follow-up question:*/

SELECT MAX(America) AS 'America', MAX(Asia) AS 'Asia', MAX(Europe) AS 'Europe'
FROM (
    SELECT 
        CASE WHEN continent = 'America' THEN @r1 := @r1 + 1
             WHEN continent = 'Asia'    THEN @r2 := @r2 + 1
             WHEN continent = 'Europe'  THEN @r3 := @r3 + 1 END AS 'row_id',
        CASE WHEN continent = 'America' THEN name END AS 'America',
        CASE WHEN continent = 'Asia'    THEN name END AS 'Asia',
        CASE WHEN continent = 'Europe'  THEN name END AS 'Europe'
    FROM student, (SELECT @r1 := 0, @r2 := 0, @r3 := 0) AS row_id
    ORDER BY name
) t
GROUP BY row_id;
