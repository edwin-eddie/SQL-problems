


with cte as(
select num, lead(num,1) over(order by id) as lead, lag(num,1) over(order by id) as lag from logs)
select distinct num as ConsecutiveNums from cte where num = lag and num = lead

