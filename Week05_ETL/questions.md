# Week 6 – ETL Tools

## 1. Why ETL Tools?
- SQL-only ETL works, but tools provide:
  - Drag-and-drop workflows
  - Automation & scheduling
  - Error handling & logging
  - Integration with multiple sources

---

## 2. Major ETL Tools

### a) SSIS (SQL Server Integration Services)
- Part of Microsoft SQL Server.
- Provides a GUI for building ETL workflows.
- Common tasks: Data Flow (extract & load), Control Flow (scheduling, loops), Error Handling.

### b) Talend (Open Source)
- Java-based, supports connectors for many databases & APIs.
- Community & Enterprise editions available.
- Drag-and-drop pipelines.

### c) Informatica PowerCenter
- Enterprise ETL leader.
- Handles large-scale data movement.
- Strong metadata & lineage features.

### d) Pentaho Data Integration (Kettle)
- Open-source ETL tool.
- Intuitive graphical designer.
- Popular in academic and small business use.

---

## 3. Example: SSIS Workflow
1. Extract → Read from CSV file (`sales.csv`).
2. Transform → Convert dates, remove duplicates.
3. Load → Insert into `fact_sales`.

---

## 4. ETL Tool Categories
- **On-premise**: SSIS, Informatica, Pentaho.
- **Cloud-based**: Talend Cloud, AWS Glue, Azure Data Factory.

---

## 5. Why Use ETL Tools over Scripts?
- Faster development.
- Error recovery.
- Scheduling & monitoring.
- Scalable for enterprise workloads.
