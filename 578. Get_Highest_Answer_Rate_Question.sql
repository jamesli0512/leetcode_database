/*
Get the highest answer rate question from a table survey_log with these columns:
uid, action, question_id, answer_id, q_num, timestamp.

uid means user id; action has these kind of values: "show", "answer", "skip"; 
answer_id is not null when action column is "answer", while is null for "show" and "skip"; 
q_num is the numeral order of the question in current session.

Write a sql query to identify the question which has the highest answer rate.

Example:
Input:
+------+-----------+--------------+------------+-----------+------------+
| uid  | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+--------------+------------+-----------+------------+
| 5    | show      | 285          | null       | 1         | 123        |
| 5    | answer    | 285          | 124124     | 1         | 124        |
| 5    | show      | 369          | null       | 2         | 125        |
| 5    | skip      | 369          | null       | 2         | 126        |
+------+-----------+--------------+------------+-----------+------------+

Output:
+-------------+
| survey_log  |
+-------------+
|    285      |
+-------------+

Explanation:
question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.
*/

# 1. Write your MySQL query statement below

SELECT t.question_id AS 'survey_log'
FROM
(   
    SELECT 
    s.question_id,
    SUM(CASE WHEN s.action='answer' THEN 1 ELSE 0 END) AS 'q_ans',
    SUM(CASE WHEN s.action='show' THEN 1 ELSE 0 END) AS 'q_show'
    FROM
        survey_log s
    GROUP BY
        s.question_id
) t
ORDER BY (t.q_ans/t.q_show) DESC
LIMIT 1;

# 2.Write your MySQL query statement below
SELECT 
    s.question_id AS 'survey_log'
FROM
    survey_log s
GROUP BY
    s.question_id
ORDER BY
    COUNT(IF(s.action='answer',1,NULL))
    /
    COUNT(IF(s.action='show',1,NULL)) DESC
LIMIT 1;
