# Week 4 – Advanced Data Modeling

## 1. Snowflake Schema
- An extension of the **star schema** where dimension tables are **normalized** into multiple related tables.
- Reduces data redundancy but increases query complexity.

### Example
- `dim_product` split into:
  - `dim_product` (product_id, product_name, category_id)
  - `dim_category` (category_id, category_name)

---

## 2. Fact Constellation (Galaxy Schema)
- Multiple fact tables share common dimensions.
- Useful when different business processes (e.g., Sales, Shipments) are analyzed together.

---

## 3. Slowly Changing Dimensions (SCD)
Dimensions change over time. SCD strategies handle historical tracking:

- **Type 1**: Overwrite old data (no history).
- **Type 2**: Keep history by adding a new row (valid_from, valid_to).
- **Type 3**: Add a new column to store previous value.

---

## 4. Example: Customer Dimension
- **Type 1**: Update customer’s region directly.
- **Type 2**: Insert new record with new region + validity dates.
- **Type 3**: Add `previous_region` column.
