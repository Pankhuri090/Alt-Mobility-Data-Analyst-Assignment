--Query 1: Customers who ordered more than once
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM 
    customer_orders
GROUP BY 
    customer_id
HAVING 
    COUNT(order_id) > 1
ORDER BY 
    total_orders DESC;


--Query 2: Classify customers as New or Returning each month
WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        customer_orders
    GROUP BY 
        customer_id
)
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    CASE 
        WHEN o.order_date = f.first_order_date THEN 'New Customer'
        ELSE 'Returning Customer'
    END AS customer_type,
    COUNT(DISTINCT o.customer_id) AS customer_count
FROM 
    customer_orders o
JOIN 
    first_orders f ON o.customer_id = f.customer_id
GROUP BY 
    month, customer_type
ORDER BY 
    month, customer_type;


--Query 3: Classify customers by total spend
SELECT 
    customer_id,
    SUM(order_amount) AS lifetime_value,
    CASE
        WHEN SUM(order_amount) >= 50000 THEN 'High Value'
        WHEN SUM(order_amount) BETWEEN 20000 AND 49999 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM 
    customer_orders
GROUP BY 
    customer_id
ORDER BY 
    lifetime_value DESC;
