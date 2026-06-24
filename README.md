# data-analysis-full-project-under-progress-

## Overview

This project focuses on building the Gold Layer of a Data Warehouse and performing Exploratory Data Analysis (EDA) to prepare data for business reporting and analytics.

The Gold Layer was designed using a Star Schema model, providing clean and business-ready datasets that can be directly consumed by BI tools.

The next phase of the project is building an interactive Power BI dashboard based on the analytical model.

---

## Gold Layer Design

The analytical layer was built using dimensional modeling techniques and consists of:

### Dimension Tables

#### dim_customers

Customer-related information including:

* Customer Details
* Gender
* Marital Status
* Birth Date
* Country

#### dim_products

Product-related information including:

* Category
* Subcategory
* Product Name
* Product Cost
* Product Line

### Fact Table

#### fact_sales

Contains sales transactions and business measures such as:

* Sales Amount
* Quantity Sold
* Price
* Order Date
* Ship Date
* Due Date

The fact table is linked to the dimension tables using surrogate keys to support efficient analytical queries.

---

## Exploratory Data Analysis (EDA)

The following analyses were performed on the Gold Layer:

### Business Metrics

* Total Sales
* Average Sales
* Total Quantity Sold
* Average Selling Price
* Total Orders
* Total Customers
* Customers Who Placed Orders

### Customer Analysis

* Youngest Customer
* Oldest Customer

### Product Analysis

* Sales by Category
* Sales by Subcategory
* Sales by Product
* Average Product Cost by Category

### Geographic Analysis

* Sales by Country

### Time Analysis

* Minimum Order Date
* Maximum Order Date
* Sales Date Range

---

## Repository Structure

```text
project/
│
├── Gold Layer/
│   ├── ddl_gold.sql
│
├── Exploratory Data Analysis/
│   └── eda.sql
│
└── README.md
```

---

## Technologies Used

* SQL
* Databricks SQL
* Data Modeling
* Star Schema
* Data Analysis
* Git & GitHub
* Power BI (In Progress)

---

## Upcoming Phase

Power BI Dashboard Development

Planned dashboard features:

* Executive Sales Overview
* Product Performance Analysis
* Customer Insights
* Geographic Analysis
* KPI Monitoring
* Sales Trends Analysis

---

## Key Skills Demonstrated

* Dimensional Modeling
* Star Schema Design
* Data Warehousing Concepts
* SQL Analytics
* Exploratory Data Analysis (EDA)
* Business Metrics Development
* Databricks SQL
* Data Preparation for BI Reporting
