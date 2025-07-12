#Show unique first names from the patients table which only occurs once in the list.

select first_name from patients
group by first_name having count(*) = 1
