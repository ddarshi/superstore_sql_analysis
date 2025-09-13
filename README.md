# superstore_sql_analysis
Uncovering Sales &amp; Profitability Trends: SQL Analysis of Superstore Data using SQL SERVER
# Superstore SQL Analyses

A collection of SQL scripts to analyze the *Sample Superstore* dataset.  
This repo contains focused queries for sales, customers, shipping, discounts, profitability, and top-performing products & categories.

---

## Table of contents
- [Project structure](#project-structure)
- [Files & purpose](#files--purpose)
- [Prerequisites](#prerequisites)
- [How to run the queries](#how-to-run-the-queries)
- [Load dataset (quick tips)](#load-dataset-quick-tips)

- [Contributing](#contributing)


---

## Project structure

---

## Files & purpose
- `sql/Sales analysis.sql`  
  Contains queries for overall sales trends, monthly/yearly aggregates, top regions and segments.
- `sql/Customer analysis.sql`  
  Customer segmentation, repeat customers, order counts, basic cohort queries.
- `sql/Shipping analysis.sql`  
  Shipping mode analysis, average shipping time.
- `sql/Discount analysis.sql`  
  How discounts affect sales and margin, discount buckets.
- `sql/Profitability analysis.sql`  
  Profit margins by category/segment, loss-making orders.
- `sql/Top performing product and category by sales and profit.sql`  
  Top SKUs, categories and their contribution to revenue & profit.

---

## Prerequisites
- A SQL client (MySQL Workbench, SQL Server Management Studio, SQLite Browser, DBeaver, etc.)
- The Sample Superstore dataset (CSV). Place it in a table named, or update the scripts to match, e.g. `orders` or `sample_superstore`.
- Basic familiarity with loading CSV to SQL (or use pandas to insert to a DB).

---

## How to run the queries
1. Load the `Sample Superstore` CSV into your database (see next section).  
2. Open any `.sql` file in your SQL client.  
3. If your table name differs from what the script expects, open the file and replace the table name at top (e.g., `sample_superstore` → `orders`).  
4. Execute the script or select specific queries to run.

---

## Load dataset (quick tips)
- **MySQL Workbench**: Server → Data Import or use *Table Data Import Wizard* to import CSV into a new table.
- **SQLite**: Use DB Browser for SQLite → Import CSV to a new table.
- **DBeaver**: Right-click connection → Tools → Import CSV.
- **Python (pandas)** to load CSV into SQL:
```python
import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv("SampleSuperstore.csv")
engine = create_engine("mysql+pymysql://user:pass@localhost/superstore")
df.to_sql("orders", engine, if_exists="replace", index=False)


