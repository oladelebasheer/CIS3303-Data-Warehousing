# Week 2 – Data Warehouse Architecture

## 1. What is DW Architecture?
The architecture of a Data Warehouse describes how data flows from source systems to the warehouse and finally to end-users (analysts, managers).

It includes:
- **Source Systems** (OLTP databases, files, APIs, etc.)
- **ETL Layer** (Extract, Transform, Load)
- **Data Warehouse Storage** (fact & dimension tables)
- **Presentation Layer** (BI tools, dashboards, OLAP cubes)

---

## 2. Types of Architectures
1. **Two-Tier Architecture**
   - Data warehouse + client tools.
   - Simple, but can cause performance issues with many users.

2. **Three-Tier Architecture** *(most common)*
   - **Bottom Tier**: Data sources + ETL layer
   - **Middle Tier**: Data warehouse (central repository) + OLAP servers
   - **Top Tier**: BI tools and applications

3. **Data Mart**
   - A subset of a data warehouse.
   - Can be **dependent** (from central DW) or **independent** (built directly from sources).

---

## 3. Metadata in Data Warehousing
- Metadata = “data about data”.
- Two types:
  - **Technical metadata**: table definitions, ETL rules, lineage.
  - **Business metadata**: business terms, KPIs, metrics.

---

## 4. Example Flow
1. Data extracted from sales, HR, CRM systems.
2. Cleaned & transformed in ETL process.
3. Loaded into fact and dimension tables.
4. Users query data via OLAP/BI tools.

---
