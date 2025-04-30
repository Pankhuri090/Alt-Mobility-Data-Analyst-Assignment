--Query 1: Complete Order + Payment Details Report
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.order_amount,
    p.payment_id,
    p.payment_date,
    p.payment_status,
    p.payment_method,
    p.payment_amount
FROM 
    customer_orders o
LEFT JOIN 
    payments p 
ON 
    o.order_id = p.order_id
ORDER BY 
    o.order_date;


