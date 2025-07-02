-- 184. Department Highest Salary
--can use DenseRank aswell for Raanking, depending upon the business requirements
--Nested CTE Approach

WITH CTE AS(
Select d.name AS Department, e.name AS Employee, e.salary AS Salary
from Employee e left join Department d on e.departmentId  = d.id ),
CTE2 AS(
select *, rank() over(partition by Department Order By Salary desc) AS Rank from CTE ) 
 select Department, Employee, Salary from CTE2 where Rank = 1 


--CTE + SubQuey

WITH CTE AS(
Select d.name AS Department, e.name AS Employee, e.salary AS Salary
from Employee e left join Department d on e.departmentId  = d.id )
select Department, Employee, Salary from (
select *, rank() over(partition by Department Order By Salary desc) AS Rank from CTE ) a
where Rank = 1 
