# Superstore SQL Analyses

Uncovering Sales & Profitability Trends: SQL Analysis of Superstore Data using SQL Server  

A collection of SQL scripts to analyze the *Sample Superstore* dataset.  
This repo contains focused queries for sales, customers, shipping, discounts, profitability, and top-performing products & categories.

---

## Table of contents
- [Skills Demonstrated](#skills-demonstrated)
- [Dataset](#dataset)
- [Project structure](#project-structure)
- [Files & purpose](#files--purpose)
- [Prerequisites](#prerequisites)
- [How to run the queries](#how-to-run-the-queries)
- [Load dataset (quick tips)](#load-dataset-quick-tips)
- [Insights & Findings](#insights--findings)

---

## Skills Demonstrated
- **SQL Basics**: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT/TOP`
- **Aggregation**: `SUM`, `COUNT`, `AVG`, `GROUP BY`, `HAVING`
- **Date Functions**: `DATE_FORMAT` (MySQL), `FORMAT` (SQL Server), `DATEDIFF`
- **Joins & CTEs**: Combining tables, customer retention analysis
- **Business Analysis**: Profitability, segmentation, trend analysis

---

## Dataset
- **Source**: Kaggle – [Sample Superstore](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)
- **Size**: ~10,000 records  
- **Features**: Orders, Sales, Profit, Discounts, Customers, Shipping, Regions, Categories

---

## Project structure

---

## Files & purpose
- `sql/Sales analysis.sql` → Overall sales trends, monthly/yearly aggregates, top regions and segments.  
- `sql/Customer analysis.sql` → Customer segmentation, repeat customers, order counts, basic cohort queries.  
- `sql/Shipping analysis.sql` → Shipping mode analysis, average shipping time.  
- `sql/Discount analysis.sql` → How discounts affect sales and margin, discount buckets.  
- `sql/Profitability analysis.sql` → Profit margins by category/segment, loss-making orders.  
- `sql/Top performing product and category by sales and profit.sql` → Top SKUs, categories and their contribution to revenue & profit.  

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
- **Python (pandas)** to load CSV into SQL.  

---

## Insights & Findings
- [Customer Analysis](sql/Customer%20analysis.sql): Most customers purchase repeatedly, but ~20% are one-time buyers → churn risk.  
- [Discount Analysis](sql/Discount%20analysis.sql): Higher discounts directly reduce profit margins → need discount strategy optimization.  
- [Profitability Analysis](sql/Profitability%20analysis.sql): Technology category contributes the highest profit despite fewer orders.  
- [Sales Analysis](sql/Sales%20analysis.sql): West region drives maximum sales; Central shows inconsistent profitability.  
- [Shipping Analysis](sql/Shipping%20analysis.sql): Same-Day shipping incurs higher costs with low incremental sales gain.  
- [Top Products](sql/Top%20performing%20product%20and%20category%20by%20sales%20and%20profit.sql): Chairs and Phones dominate sales; Copiers lead in profit margins.  

---

