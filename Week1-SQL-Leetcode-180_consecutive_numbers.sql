-- File: /sql_problems/Week1-SQL-Leetcode-180_consecutive_numbers.sql

-- Problem: Find all numbers that appear at least three times consecutively.
-- Approach: Use LAG and LEAD to find middle element of such triplets.
-- Note: DISTINCT ensures duplicates are not returned.

WITH CTE AS (
  SELECT 
    num, 
    LEAD(num,1) OVER(ORDER BY id) AS lead, 
    LAG(num,1) OVER(ORDER BY id) AS lag 
  FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums 
FROM CTE 
WHERE num = lead AND num = lag;


--self Join Approach

SELECT DISTINCT L1.num AS ConsecutiveNums
FROM Logs L1
JOIN Logs L2 ON L1.id = L2.id - 1
JOIN Logs L3 ON L1.id = L3.id - 2
WHERE L1.num = L2.num AND L2.num = L3.num;


