-- Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.

with CTE as(
select province_name,
case when province_name= 'Ontario' then 1 else 0 end as flag
from province_names 
order by flag desc,province_name)
select province_name from cte

-------------------------------------------------------------
select province_name
from province_names
order by
  (case when province_name = 'Ontario' then 0 else 1 end),
  province_name
