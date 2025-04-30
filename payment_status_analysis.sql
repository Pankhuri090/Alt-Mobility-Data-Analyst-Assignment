CREATE TABLE payments (
    payment_id UUID PRIMARY KEY,       -- Change to UUID to match CSV data
    order_id UUID NOT NULL,            -- Order ID is also UUID
    payment_date DATE,                 -- Date the payment was made
    payment_amount DECIMAL(10, 2),     -- Amount paid in the transaction
    payment_method VARCHAR(20),        -- Payment method (UPI, Card, etc.)
    payment_status VARCHAR(20),        -- Status of the payment (Success, Failed)
    extra_column VARCHAR(255),         -- Placeholder for extra data in the CSV
    FOREIGN KEY (order_id) REFERENCES customer_orders(order_id) -- Links to a valid order
);

SELECT * FROM payments;

COPY payments FROM 'C:\Program Files\PostgreSQL\16\payments.csv' WITH (FORMAT csv, HEADER true);

DROP TABLE payments;

--Query 1: How many payments are successful, failed, pending, etc.
SELECT 
    payment_status,
    COUNT(payment_id) AS total_payments
FROM 
    payments
GROUP BY 
    payment_status
ORDER BY 
    total_payments DESC;


--Query 2: Calculate success and failure rates
SELECT
    ROUND(
        (SUM(CASE WHEN payment_status = 'Success' THEN 1 ELSE 0 END) * 100.0) / COUNT(payment_id),
        2
    ) AS success_rate_percentage,
    ROUND(
        (SUM(CASE WHEN payment_status = 'Failed' THEN 1 ELSE 0 END) * 100.0) / COUNT(payment_id),
        2
    ) AS failure_rate_percentage
FROM
    payments;


--Query 3: Payment failures month-by-month
SELECT 
    DATE_TRUNC('month', payment_date) AS month,
    COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) AS failed_payments,
    COUNT(payment_id) AS total_payments,
    ROUND(
        (COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) * 100.0) / COUNT(payment_id),
        2
    ) AS failure_rate_percentage
FROM 
    payments
GROUP BY 
    month
ORDER BY 
    month;


--Query 4: Which payment methods are failing more?
SELECT 
    payment_method,
    payment_status,
    COUNT(payment_id) AS total_transactions
FROM 
    payments
GROUP BY 
    payment_method, payment_status
ORDER BY 
    payment_method, total_transactions DESC;

