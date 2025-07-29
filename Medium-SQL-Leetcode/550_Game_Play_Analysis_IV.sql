-- 550. Game Play Analysis IV


with cte as(
    select player_id,
    event_date, lead(event_date,1) over(partition by player_id order by event_date) as next_login,
    ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
from Activity)
select 
    Round(count(player_id)*1.0/(select count(distinct player_id) from Activity),2) as fraction from cte 
where rn = 1 AND datediff(day,event_date,next_login) = 1
