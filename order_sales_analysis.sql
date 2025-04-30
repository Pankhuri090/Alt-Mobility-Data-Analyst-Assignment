CREATE TABLE customer_orders (
    order_id UUID PRIMARY KEY,        
    customer_id INT NOT NULL,         
    order_date DATE NOT NULL,         
    order_amount DECIMAL(10, 2),      
    extra_column VARCHAR(255),        -- Placeholder for the empty column
    order_status VARCHAR(20)         
);

DROP TABLE customer_orders;
ALTER TABLE customer_orders DROP COLUMN extra_column;

COPY customer_orders FROM 'C:\Program Files\PostgreSQL\16\customer_orders.csv' WITH (FORMAT csv, HEADER true);
SELECT * FROM customer_orders;



-- Query 1 - Number of orders by status (Completed, Cancelled, Pending, etc.)
SELECT 
    order_status,
    COUNT(order_id) AS total_orders
FROM 
    customer_orders
GROUP BY 
    order_status
ORDER BY 
    total_orders DESC;


--Query 2 - Total sales revenue per month
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(order_amount) AS total_sales
FROM 
    customer_orders
WHERE 
    LOWER(order_status) = 'completed'
GROUP BY 
    month
ORDER BY 
    month;


--query 3 - Average value of completed order
SELECT 
    AVG(order_amount) AS average_order_value
FROM 
    customer_orders
WHERE 
    order_status = 'Completed';



