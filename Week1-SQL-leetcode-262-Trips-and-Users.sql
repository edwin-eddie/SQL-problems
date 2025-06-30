#262. Trips and Users

#Brute Force Solution
select request_at as Day, 
ROUND(SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) * 1.0  / COUNT(*), 2) AS 'Cancellation Rate'
from Trips t  
join Users u1 on t.client_id = u1.users_id 
join Users u2 on t.driver_id = u2.users_id 
where u1.banned = 'No' 
and u2.banned = 'No' 
AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
group by request_at 
order by request_at

#Optimized Solution, avoiding multiple joins to same table

WITH valid_users AS (
    SELECT users_id FROM Users WHERE banned = 'No'
)
SELECT 
    request_at AS Day,
    ROUND(SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS "Cancellation Rate"
FROM Trips t
WHERE client_id IN (SELECT users_id FROM valid_users)
  AND driver_id IN (SELECT users_id FROM valid_users)
  AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at
ORDER BY request_at;


# optimzed further with No Joins , No CTE

SELECT 
    request_at AS Day,
    ROUND(
        SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) * 1.0 
        / COUNT(*), 
        2
    ) AS "Cancellation Rate"
FROM Trips
WHERE client_id IN (
        SELECT users_id FROM Users WHERE banned = 'No'
    )
  AND driver_id IN (
        SELECT users_id FROM Users WHERE banned = 'No'
    )
  AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at
ORDER BY request_at;
