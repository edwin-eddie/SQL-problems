# 184. Department Highest Salary

with CTE as
(select 
    d.name as Department ,
    e.name as Employee ,
    Salary, 
    dense_rank() over(partition by d.name order by Salary desc) as rank
from Employee e inner join department d
on e.departmentid = d.id)
select Department, Employee , Salary from CTE where rank = 1
