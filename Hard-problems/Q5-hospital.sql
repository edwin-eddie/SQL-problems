-- Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.
-- Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance group.

with CTE AS(
select patient_id, 
	   case when patient_id % 2 = 0 then 'YES' else 'NO' END AS has_insurance,
       case when patient_id % 2 = 0 then 10 else 50 end as cost_after_insurance
from admissions)
select has_insurance, sum(cost_after_insurance) from CTE
group by has_insurance


================================================================================

select case when patient_id % 2 = 0 then 'YES' else 'NO' END AS has_insurance,
       sum(case when patient_id % 2 = 0 then 10 else 50 end) as cost_after_insurance
from admissions
group by has_insurance
