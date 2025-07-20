-- select concat(Round(SUM(case when gender ='M' then 1 else 0 end)*100.0/count(*),2),'%')  as percentage_of_male_patients
-- from patients


select concat(Round(SUM(case when gender ='M' then 1 else 0 end)*100.0/count(*),2),'%')  as percentage_of_male_patients
from patients


