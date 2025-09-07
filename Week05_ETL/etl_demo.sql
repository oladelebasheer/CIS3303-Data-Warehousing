------------------------------------------------------------
-- Step 1: Extract (simulate data coming from OLTP system)
------------------------------------------------------------
CREATE TABLE sales_transactions (
    sale_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    sale_date VARCHAR(20), -- stored as string in source
    amount DECIMAL(10,2)
);

INSERT INTO sales_transactions VALUES
(1, 'Alice Johnson', 'Laptop', '2023-01-01', 1200.00),
(2, 'Bob Smith', 'Desk Chair', '2023-01-02', -50.00), -- invalid amount
(3, 'Charlie Lee', 'Laptop', '01-03-2023', 1300.00);  -- different date format

------------------------------------------------------------
-- Step 2: Staging Area
------------------------------------------------------------
CREATE TABLE staging_sales (
    sale_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- Transform while inserting into staging
INSERT INTO staging_sales (sale_id, customer_name, product_name, sale_date, amount)
SELECT 
    sale_id,
    customer_name,
    product_name,
    -- Convert string to DATE format
    STR_TO_DATE(sale_date, '%Y-%m-%d'),
    amount
FROM sales_transactions
WHERE amount > 0; -- remove invalid amounts

------------------------------------------------------------
-- Step 3: Dimension Tables
------------------------------------------------------------
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

-- Load unique customers
INSERT INTO dim_customer (customer_id, customer_name)
SELECT ROW_NUMBER() OVER (), customer_name
FROM (SELECT DISTINCT customer_name FROM staging_sales) c;

-- Load unique products
INSERT INTO dim_product (product_id, product_name)
SELECT ROW_NUMBER() OVER (), product_name
FROM (SELECT DISTINCT product_name FROM staging_sales) p;

------------------------------------------------------------
-- Step 4: Fact Table
------------------------------------------------------------
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- Load facts by joining staging with dimensions
INSERT INTO fact_sales (sale_id, customer_id, product_id, sale_date, amount)
SELECT 
    s.sale_id,
    c.customer_id,
    p.product_id,
    s.sale_date,
    s.amount
FROM staging_sales s
JOIN dim_customer c ON s.customer_name = c.customer_name
JOIN dim_product p ON s.product_name = p.product_name;
