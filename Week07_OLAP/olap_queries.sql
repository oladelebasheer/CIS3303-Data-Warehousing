------------------------------------------------------------
-- 1. Bulk Load Example
------------------------------------------------------------
-- MySQL: Disable constraints for faster load
SET foreign_key_checks = 0;
LOAD DATA INFILE '/path/sales_data.csv'
INTO TABLE fact_sales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SET foreign_key_checks = 1;

------------------------------------------------------------
-- 2. Indexing
------------------------------------------------------------
-- B-Tree Index on sale_date
CREATE INDEX idx_sale_date ON fact_sales(sale_date);

-- Bitmap Index (in Oracle/Postgres)
-- CREATE BITMAP INDEX idx_region ON dim_customer(region);

------------------------------------------------------------
-- 3. Partitioning (MySQL / PostgreSQL style)
------------------------------------------------------------
-- Partition fact_sales by YEAR
CREATE TABLE fact_sales_partitioned (
    sale_id INT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
) PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025)
);

------------------------------------------------------------
-- 4. Query Optimization Example
------------------------------------------------------------
EXPLAIN
SELECT product_id, SUM(amount) as total_sales
FROM fact_sales
WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY product_id;
