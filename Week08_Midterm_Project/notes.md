# Week 8 – OLAP (Online Analytical Processing)

## 1. What is OLAP?
- OLAP = Online Analytical Processing.
- Enables fast analysis of large multidimensional datasets.
- Focus: *Analysis* (vs OLTP = transactions).

---

## 2. OLAP Types
- **MOLAP**: Multidimensional OLAP (pre-computed cubes).
- **ROLAP**: Relational OLAP (uses relational DB + SQL).
- **HOLAP**: Hybrid OLAP (mix of MOLAP & ROLAP).

---

## 3. OLAP Operations
1. **Cube** → Generate all possible groupings of dimensions.
2. **Roll-up** → Aggregate data (e.g., from day → month → year).
3. **Drill-down** → Reverse of roll-up (year → month → day).
4. **Slice** → Fix one dimension (e.g., sales in 2023 only).
5. **Dice** → Select multiple dimensions (e.g., sales in 2023, Region = West).
6. **Pivot (Rotate)** → Reorient dimensions (rows ↔ columns).

---

## 4. Example Use Case
- Fact table: `fact_sales`
- Dimensions: `dim_product`, `dim_customer`, `dim_date`
- OLAP helps answer:
  - "Total sales by product, region, and year"
  - "Monthly trend of laptop sales"
  - "Which customer segment spent the most in Q1 2024?"
