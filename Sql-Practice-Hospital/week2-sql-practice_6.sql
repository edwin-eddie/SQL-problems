# Show the total amount of male patients and the total amount of female patients in the patients table.
# Display the two results in the same row.

#  Below is to Understand how the query works 
select patient_id, gender, CASE WHEN gender='M' THEN patient_id else NULL END AS is_male,
CASE WHEN gender = 'F' THEN patient_id ELSE null END AS is_female
from patients

# Solution 1 using count()

select count(CASE WHEN gender='M' THEN patient_id else NULL END) AS male_count,
count(CASE WHEN gender = 'F' THEN patient_id ELSE null END) AS female_count
from patients


# Solution 2 using Sum()

select sum(CASE WHEN gender='M' THEN 1 else 0 END) AS male_count,
sum(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
from patients
