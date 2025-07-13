# For each doctor, display their id, full name, and the first and last admission date they attended.

select attending_doctor_id as doctor_id, concat(first_name, ' ', last_name) as full_name,
min(admission_date) AS first_admission_date, max(admission_date) as last_admission_date
from admissions a inner join doctors d on a.attending_doctor_id = d.doctor_id
group by attending_doctor_id
