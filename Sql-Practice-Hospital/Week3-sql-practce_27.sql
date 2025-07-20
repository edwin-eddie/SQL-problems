-- Display a single row with max_visits, min_visits, average_visits where the maximum, minimum and average number of admissions per day is calculated. Average is rounded to 2 decimal places.

--CTE Approach

WITH CTE AS(
select admission_date, count(*) as total_count from admissions
group by admission_date)
select max(total_count) as max_visits, min(total_count) as min_visits, Round(avg(total_count),2)
from CTE

-- Subquery Approach

select 
	max(number_of_visits) as max_visits, 
	min(number_of_visits) as min_visits, 
  round(avg(number_of_visits),2) as average_visits 
from (
  select admission_date, count(*) as number_of_visits
  from admissions 
  group by admission_date
)
