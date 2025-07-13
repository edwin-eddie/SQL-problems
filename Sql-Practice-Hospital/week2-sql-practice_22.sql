# For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

select  concat(p.first_name, ' ', p.last_name) as patient_name,
diagnosis,concat(d.first_name, ' ', d.last_name) AS doctor_name
from admissions a  join doctors d on a.attending_doctor_id = d.doctor_id join patients p on a.patient_id = p.patient_id
