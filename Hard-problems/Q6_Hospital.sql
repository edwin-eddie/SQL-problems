-- Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name

with cte as(
select  
	province_name, 
    count(*) as cnt,
    sum(case when gender = 'F' then 1 else 0 end) AS female_count,
    sum(case when gender = 'M' then 1 else 0 end) As male_count
    from province_names inner join patients using(province_id)
group by province_name)
select province_name from cte where male_count > female_count
