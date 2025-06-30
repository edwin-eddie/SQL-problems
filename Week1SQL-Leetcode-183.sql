#183. Customers Who Never Order

#Solution 1 : Not So optimized , can fail when customerid is NULL in orders table
select name as Customers from customers where id NOT IN (select customerId from orders)

# Solution 2 : Much better
select  name  as Customers from Customers left join Orders on Customers.id = Orders.customerId where Orders.customerId IS NULL

#Solution 3: usig Not Exists

SELECT name AS Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Orders o 
    WHERE o.customerId = c.id
);
