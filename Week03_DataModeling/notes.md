# Week 3 – Data Modeling (Star Schema)

## 1. What is Data Modeling in DW?
- Data modeling in a Data Warehouse is about structuring data for analysis.
- Unlike OLTP (normalized), DW models are **denormalized** for fast queries.

---

## 2. Star Schema
- Most common data warehouse schema.
- Structure:
  - **Fact Table** → contains measures (quantitative data like sales, revenue).
  - **Dimension Tables** → contain descriptive attributes (e.g., product name, customer region, time).

### Example:
- Fact table: `fact_sales`
- Dimension tables: `dim_customer`, `dim_product`, `dim_date`

---

## 3. Components
- **Fact Table**
  - Foreign keys to dimensions.
  - Numeric measures (e.g., amount, quantity).
- **Dimension Table**
  - Attributes that describe facts.
  - Hierarchies (e.g., date → month → year).

---

## 4. Example Flow
A retail business wants to analyze:
- Sales by product category
- Sales by region
- Sales by year

We design:
- `fact_sales`
- `dim_customer`
- `dim_product`
- `dim_date`

---
