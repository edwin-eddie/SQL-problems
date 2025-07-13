# Show all allergies ordered by popularity. Remove NULL values from query.

select allergies, count(allergies) as total_diagnosis 
from patients where allergies is NOt NULL
group by allergies
order by total_diagnosis desc
