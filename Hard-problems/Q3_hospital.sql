-- Show patient_id, first_name, last_name, and attending doctor's specialty.
-- Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
-- Check patients, admissions, and doctors tables for required information.


select 
	p.patient_id, 
    p.first_name as patient_first_name, 
    p.last_name as patient_last_name,
	d.specialty AS attending_doctor_specialty
from patients p 
	inner join admissions a on p.patient_id = a.patient_id 
    inner join doctors d on d.doctor_id = a. attending_doctor_id
where 
	diagnosis = 'Epilepsy' and 
    d.first_name = 'Lisa'
