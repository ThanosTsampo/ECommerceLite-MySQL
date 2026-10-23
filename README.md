# 🛒 ECommerceLite - End-to-End SQL & ETL Pipeline

An enterprise-ready, lightweight MySQL database project simulating an e-commerce backend. It demonstrates clean data engineering workflows including **ETL data ingestion & cleansing**, **relational schema design**, **automated triggers**, and **business intelligence analytics**.

---

## 🛠️ Project Structure & Architecture

The project consists of 5 modular SQL scripts and verification screenshots:

1. **`01_Create_Database_And_Tables.sql`**: Database creation, schema design (DDL), and referential integrity via Primary and Foreign Keys.
2. **`02_ETL_Products.sql`**: Staging table pattern and ETL data transformation pipeline (`TRIM`, `CAST`, `NULLIF`).
3. **`03_Populate_Remaining_Data.sql`**: Seed data population for Users, Orders, and OrderItems, with `UNION ALL` row count verification.
4. **`04_Business_Queries.sql`**: Business intelligence queries demonstrating Joins, Aggregations, `COALESCE`, and defensive edge-case handling (`IFNULL`/`CONCAT`).
5. **`05_Triggers_And_Automation.sql`**: Automated real-time inventory management using an `AFTER INSERT` trigger.

---

## 📸 Database Setup & ETL Verification

### 1. Product ETL Pipeline Verification
Transforms and cleans raw staging product data into the production catalog.

![ETL Verification](./02_ETL_Products_Verification.png)

### 2. Database Row Count Verification
Cross-checks record counts across all relational tables using `UNION ALL`.

![Row Counts](./03_Database_Row_Counts.png)

---

## 📊 Business Analytics & Automation Queries

### 1. Revenue Calculation per Order
* **Methods:** `INNER JOIN`, `GROUP BY`, `SUM()`

### 2. Top-Selling Products Tracking
* **Methods:** `JOIN`, `GROUP BY`, `ORDER BY DESC`

### 3. Customer Lifetime Value (CLV) with Edge-Case Handling
* **Methods:** `LEFT JOIN`, `COALESCE()`, `CONCAT()`, `IFNULL()` (ensuring zero-spend and unregistered users are cleanly reported without `NULL` distortions).

### 4. Real-Time Inventory Automation (Trigger)
* **Methods:** `CREATE TRIGGER`, `AFTER INSERT`, transactional `UPDATE` on stock quantities to prevent overselling.

---

## 🚀 Technologies Used
- **DBMS:** MySQL Server 8.0
- **Tool:** DBeaver Community
- **Version Control:** Git & GitHub

---

## 💡 Key SQL & Engineering Techniques Demonstrated
* **Data Cleaning & Casting:** `TRIM()`, `REPLACE()`, `CAST()`, `NULLIF()`
* **Defensive Programming:** `IFNULL(CONCAT(...))` for safe string concatenation.
* **Database Automation:** Row-level triggers for implicit inventory synchronization.
* **Set-Based Operations:** Efficient table joins and aggregations instead of procedural loops.