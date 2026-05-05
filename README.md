# SQL Migration Engine: Relational Database Design & Analytics

## Project Overview
This repository demonstrates a complete end-to-end database engineering workflow, transforming a flat, denormalized data source into a fully optimized relational schema[cite: 1]. The project covers schema architecture, data migration logic (ETL), and the implementation of advanced analytical tools using Stored Procedures and Views[cite: 1].

## Technical Features
* **Normalized Schema Design:** Designed a 7-table relational model enforcing referential integrity through primary and foreign key constraints[cite: 1].
* **ETL & Data Migration:** Developed scripts to extract and clean data from a denormalized source, using `DISTINCT` and `GROUP BY` logic to ensure data quality during the transition[cite: 1].
* **Advanced Analytics:** Implemented **Window Functions** (e.g., `SUM OVER`) and conditional logic (`CASE` statements) to generate real-time business insights[cite: 1].
* **Automation:** Built reusable Stored Procedures to handle complex queries like running totals and monthly revenue tracking[cite: 1].

## Repository Structure
* **`/schema`**: Contains `create_tables.sql`, defining the database structure and relational constraints[cite: 1].
* **`/migration`**: Contains `data_migration.sql`, the logic used to populate the new schema from the source data[cite: 1].
* **`/scripts`**: 
    * `views.sql`: Pre-defined virtual tables for market analysis and sales tiering[cite: 1].
    * `stored_procedures.sql`: Functional business logic for dynamic reporting[cite: 1].

## Key SQL Concepts Implemented
* **DDL/DML:** Table creation, constraints, and complex data insertion[cite: 1].
* **Referential Integrity:** Managing `FOREIGN_KEY_CHECKS` during environment resets[cite: 1].
* **Analytical Functions:** Utilizing `PARTITION BY` and `OVER` for financial trend analysis[cite: 1].
* **Data Aggregation:** Advanced joining and grouping to derive "Sales Tiers" (Platinum, Gold, Silver) based on revenue[cite: 1].

## How to Use
1. Run `schema/create_tables.sql` to initialize the database structure[cite: 1].
2. Execute `migration/data_migration.sql` to import and clean the source data[cite: 1].
3. Load the files in `scripts/` to enable the analytics dashboard and procedures[cite: 1].
