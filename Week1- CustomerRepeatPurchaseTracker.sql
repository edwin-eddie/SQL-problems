#Find customers who made at least two purchases in different months.

SELECT cust_id 
FROM orders 
GROUP BY cust_id
HAVING COUNT(DISTINCT MONTH(order_date)) >= 2;


# To List the Months use  String_agg()

SELECT 
  cust_id,
  STRING_AGG(DISTINCT CAST(MONTH(order_date) AS VARCHAR), ', ') AS months
FROM orders
GROUP BY cust_id
HAVING COUNT(DISTINCT MONTH(order_date)) >= 2;
