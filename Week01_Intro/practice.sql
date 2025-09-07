-- OLTP Example: Find the latest transaction for a customer
SELECT customer_id, product_id, purchase_date
FROM sales_transactions
WHERE customer_id = 101
ORDER BY purchase_date DESC
LIMIT 1;

-- OLAP Example: Summarize yearly sales
SELECT YEAR(sale_date) AS year, SUM(amount) AS total_sales
FROM fact_sales
GROUP BY YEAR(sale_date)
ORDER BY year;
