#185. Department Top Three Salaries

#My Solution : used Window function, and CTE

WITH CTE AS(
select e.name as Employee,e.salary as Salary, d.name as Department,
dense_rank() over(partition by e.departmentId order by salary desc) as dense_rank
from Employee e join Department d 
on e.departmentId = d.id ) 
 select Department, Employee, Salary from CTE where dense_rank <= 3

#Sub Query Approach

select Department, Employee, Salary from(
select e.name as Employee,e.salary as Salary, d.name as Department,
dense_rank() over(partition by e.departmentId order by salary desc) as dense_rank
from Employee e join Department d 
on e.departmentId = d.id ) a 
where dense_rank <= 3
