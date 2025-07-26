# 176. Second Highest Salary

#1) subquery  Approach
select max(salary) as SecondHighestSalary from Employee where salary < (select distinct max(salary) from  Employee)


#2) using RowNumber

with CTE as(
select 
    distinct salary,  
    row_number() over(order by salary desc) as rn
from Employee)
select  max(case when rn = 2 then salary else NULL end) as SecondHighestSalary
from CTE 
