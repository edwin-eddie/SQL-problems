-- 3497. Analyze Subscription Conversion 

select 
    user_id , 
     ROUND(AVG(case when activity_type = 'free_trial' then activity_duration  else NULL end),2) as trial_avg_duration,
     ROUND(AVG(case when activity_type = 'paid' then activity_duration else NULL end),2)  as paid_avg_duration      
from UserActivity
group by user_id
having AVG(case when activity_type = 'paid' then activity_duration  else NULL end) is not null 
order by user_id
