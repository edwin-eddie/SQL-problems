-- Problem: Find customers with the highest daily total order cost between Feb 1, 2019 and May 1, 2019.
-- Note: Output column must be named 'max_cost' as per platform expectation.

SELECT TOP 2 
    c.first_name,
    o.order_date,
    SUM(o.total_order_cost) AS max_cost
FROM customers c
JOIN orders o ON c.id = o.cust_id 
WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY c.first_name, o.order_date 
ORDER BY max_cost DESC;
