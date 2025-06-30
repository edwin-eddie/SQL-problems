#183. Customers Who Never Order

select name as Customers from customers where id NOT IN (select customerId from orders)
