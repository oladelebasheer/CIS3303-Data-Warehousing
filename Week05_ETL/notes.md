# Week 5 – ETL (Extract, Transform, Load)

## 1. What is ETL?
ETL = Extract, Transform, Load.  
It is the process that moves data from source systems into the data warehouse.

- **Extract** → Collect data from multiple sources (databases, APIs, files).
- **Transform** → Clean, standardize, and integrate data (e.g., fix formats, remove duplicates).
- Load → Insert transformed data into fact and dimension tables.


## 2. Types of Loading
- Full Load → Replace all data each time.
- Incremental Load → Only load new or changed data.


## 3. ETL Example Workflow
1. Extract data from OLTP system (`sales_transactions`).
2. Store in a **staging table** (`staging_sales`).
3. Transform (remove invalid rows, convert dates).
4. Load into the warehouse (`fact_sales`, `dim_customer`).

## 4. Common ETL Challenges
- Handling duplicates
- Data type mismatches
- Missing values
- Slowly Changing Dimensions (SCDs)

## 5. ETL vs ELT
- ETL → Transform before loading (common in traditional DW).
- ELT → Load raw data, transform inside warehouse (common in cloud DW).
