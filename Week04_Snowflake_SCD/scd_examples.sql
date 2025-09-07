-- Example: Snowflake Schema (Product -> Category)
CREATE TABLE dim_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id)
);

-- Insert sample categories
INSERT INTO dim_category VALUES (1, 'Electronics');
INSERT INTO dim_category VALUES (2, 'Furniture');

-- Insert products
INSERT INTO dim_product VALUES (101, 'Laptop', 1);
INSERT INTO dim_product VALUES (102, 'Desk Chair', 2);

------------------------------------------------------------
-- Slowly Changing Dimensions Examples
------------------------------------------------------------

-- Type 1: Overwrite
UPDATE dim_customer
SET region = 'West'
WHERE customer_id = 1;

-- Type 2: Keep history
ALTER TABLE dim_customer
ADD COLUMN valid_from DATE,
ADD COLUMN valid_to DATE;

-- Insert new row with new region
INSERT INTO dim_customer (customer_id, customer_name, region, valid_from, valid_to)
VALUES (1, 'Alice Johnson', 'West', '2024-01-01', NULL);

-- Close old record
UPDATE dim_customer
SET valid_to = '2023-12-31'
WHERE customer_id = 1 AND valid_to IS NULL;

-- Type 3: Store previous value
ALTER TABLE dim_customer
ADD COLUMN previous_region VARCHAR(50);

UPDATE dim_customer
SET previous_region = region,
    region = 'East'
WHERE customer_id = 2;
