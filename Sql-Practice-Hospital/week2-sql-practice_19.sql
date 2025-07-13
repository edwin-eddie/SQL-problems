# Show first_name, last_name, and the total number of admissions attended for each doctor.
# Every admission has been attended by a doctor.

select first_name, last_name, count(*) AS admissions_total
from admissions a inner join doctors d on a.attending_doctor_id = d.doctor_id
group by first_name, last_name
