# Week 7 – Data Loading & Performance Optimization

## 1. Data Loading Strategies
- **Bulk Load**: Insert large volumes at once (faster, but may bypass constraints).
- **Trickle Load**: Insert small increments (real-time or near real-time).
- **Batch Load**: Load in scheduled batches (daily, weekly).

---

## 2. Indexing
- Improves query speed by creating search paths.
- Types:
  - **B-Tree Index**: General-purpose.
  - **Bitmap Index**: Efficient for low-cardinality columns (e.g., gender).
  - **Clustered Index**: Data physically ordered by index key.

---

## 3. Partitioning
- Splits large tables into smaller chunks (by date, region, etc.).
- Benefits:
  - Faster queries (pruning).
  - Parallel processing.
  - Easier maintenance.

---

## 4. Query Optimization Techniques
- Use **EXPLAIN PLAN** to check execution.
- Avoid `SELECT *` → select only required columns.
- Use joins carefully (avoid Cartesian products).
- Pre-aggregate in ETL rather than during queries.

---

## 5. Real-World Example
- Fact table with billions of sales rows partitioned by year.
- Queries on 2024 data only scan the 2024 partition, improving performance.
