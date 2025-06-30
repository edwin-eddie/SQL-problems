#262. Trips and Users


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
