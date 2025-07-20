-- Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.)
-- using Sub Query
  
select patient_id, first_name,last_name from patients
where patient_id not in (select patient_id from admissions)


------------------------------------
-- Using Join
  
select p.patient_id, first_name,last_name 
from patients p left join admissions a 
on p.patient_id = a.patient_id
where a.patient_id is null
