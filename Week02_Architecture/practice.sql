-- Example: Create a simple staging table for sales (before ETL loads to DW)
CREATE TABLE staging_sales (
    sale_id INT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- Example: Load cleaned data into the data warehouse fact table
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- Insert from staging into fact table (simulating ETL load)
INSERT INTO fact_sales (sale_id, customer_id, product_id, sale_date, amount)
SELECT sale_id, customer_id, product_id, sale_date, amount
FROM staging_sales
WHERE amount > 0; -- simple transformation rule
