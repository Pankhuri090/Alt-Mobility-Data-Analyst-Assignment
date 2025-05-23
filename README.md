#Revenue & Retention Tracker with SQL & Power BI
The goal was to extract insights from customer order and payment datasets using SQL and visualize customer retention through Power BI.


# 📁 Datasets Used
-> customer_orders.csv — Contains information about customer orders (Order ID, Customer ID, Order Date, Order Amount, Order Status).

-> payments.csv — Contains payment transactions (Payment ID, Order ID, Payment Status, Payment Method, Payment Amount, Payment Date).

# 🛠️ Tools and Technologies
SQL (PostgreSQL) — for data analysis
Power BI — for visualization
GitHub — for version control

# 🎯 Problem Statements and Approach

# 1. Order and Sales Analysis
Analyzed order status distribution (Completed, Cancelled, Pending).
Calculated monthly revenue trends.
Computed average order value.

Key SQL Files:
order_sales_analysis.sql

# 2. Customer Analysis
Identified repeat customers.
Segmented customers into New and Returning per month.
Classified customers based on Lifetime Value (High, Medium, Low).

Key SQL Files:
customer_analysis.sql

# 3. Payment Status Analysis
Investigated payment success and failure rates.
Analyzed payment failure trends over time.
Examined payment issues by different payment methods.

Key SQL Files:
payment_status_analysis.sql

# 4. Order Details Report
Combined orders and payments into a detailed report.
Added calculated fields like Payment Completion Percentage and Payment Delay Days.

Key SQL Files:
order_details_report.sql

# 📈 Visualization: Customer Retention Cohort Analysis
Built a cohort analysis to track how many customers from each cohort month made repeat purchases over the following months.

# 📌 How to Run This Project
Run the SQL scripts inside the SQL/ folder on the datasets.
Visualizations are available inside the Visualizations/ folder.
The complete summary report is available inside Summary_of_Findings.pdf.





