-- Assume we already have a CSV file imported via SSIS.
-- Staging table
CREATE TABLE staging_orders (
    order_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    order_date DATE,
    order_amount DECIMAL(10,2)
);

-- Example: Insert rows as if SSIS read them from CSV
INSERT INTO staging_orders VALUES
(1, 'Alice Johnson', 'Laptop', '2023-02-01', 1200.00),
(2, 'Bob Smith', 'Desk Chair', '2023-02-02', 300.00),
(3, 'Charlie Lee', 'Laptop', '2023-02-03', 1300.00);

------------------------------------------------------------
-- Load into fact table with joins to dimension tables
------------------------------------------------------------
INSERT INTO fact_sales (sale_id, customer_id, product_id, sale_date, amount)
SELECT 
    o.order_id,
    c.customer_id,
    p.product_id,
    o.order_date,
    o.order_amount
FROM staging_orders o
JOIN dim_customer c ON o.customer_name = c.customer_name
JOIN dim_product p ON o.product_name = p.product_name;
