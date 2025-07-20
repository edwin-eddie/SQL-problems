-- We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.

select 
	d.doctor_id, 
    concat(d.first_name,' ',d.last_name) as doctor_name,
    specialty,
    year(admission_date) as selected_year,
    count(*)    
from admissions a inner join doctors d on a.attending_doctor_id = d.doctor_id
group by
	d.doctor_id, 
    concat(d.first_name,' ',d.last_name) ,
    specialty,
    year(admission_date) 
