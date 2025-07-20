-- For each day display the total amount of admissions on that day. Display the amount changed from the previous date.

select 
	admission_date, 
	count(*) admisssion_day,
    count(*) - lag(count(*)) over(order by admission_date) AS ADMISSION_COUNT_CHANGE
from admissions
group by admission_date
