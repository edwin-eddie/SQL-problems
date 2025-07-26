# 177. Nth Highest Salary


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
            select  max(case when rn = @N then salary else NULL end) as SecondHighestSalary 
            from(
            select distinct salary, dense_rank() over(order by salary desc) as rn
            from Employee ) a
    );
END
