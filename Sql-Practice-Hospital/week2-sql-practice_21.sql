/*select province_name, count(*) AS patient_count from patients p join province_names pn
on p.province_id = pn.province_id
group by province_name
order  by patient_count desc */

select province_name, count(*) AS patient_count from patients p join province_names pn
on p.province_id = pn.province_id
group by province_name
order  by patient_count desc
