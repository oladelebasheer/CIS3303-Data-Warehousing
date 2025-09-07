-- Dimension: Customer
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    date_id INT,
    amount DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);

-- Insert sample data
INSERT INTO dim_customer VALUES (1, 'Alice Johnson', 'North');
INSERT INTO dim_customer VALUES (2, 'Bob Smith', 'South');

INSERT INTO dim_product VALUES (101, 'Laptop', 'Electronics');
INSERT INTO dim_product VALUES (102, 'Desk Chair', 'Furniture');

INSERT INTO dim_date VALUES (20230101, '2023-01-01', 1, 1, 2023);
INSERT INTO dim_date VALUES (20230102, '2023-01-02', 2, 1, 2023);

INSERT INTO fact_sales VALUES (1, 1, 101, 20230101, 1200.00, 1);
INSERT INTO fact_sales VALUES (2, 2, 102, 20230102, 150.00, 2);

-- Example OLAP-style queries
-- 1. Total sales by region
SELECT c.region, SUM(f.amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.region;

-- 2. Sales by product category
SELECT p.category, SUM(f.amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category;

-- 3. Sales by year
SELECT d.year, SUM(f.amount) AS total_sales
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year;
