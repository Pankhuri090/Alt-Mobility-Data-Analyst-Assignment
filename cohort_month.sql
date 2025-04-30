WITH customer_first_order AS (
    SELECT 
        customer_id,
        MIN(DATE_TRUNC('month', order_date)) AS cohort_month
    FROM 
        customer_orders
    GROUP BY 
        customer_id
),
customer_orders_monthly AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', order_date) AS order_month
    FROM 
        customer_orders
)
SELECT
    f.cohort_month,
    o.order_month,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM
    customer_first_order f
JOIN 
    customer_orders_monthly o
ON 
    f.customer_id = o.customer_id
GROUP BY
    f.cohort_month, o.order_month
ORDER BY 
    f.cohort_month, o.order_month;
