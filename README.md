# data-analysis-full-project

## Overview

This project demonstrates an end-to-end Business Intelligence solution, starting from building the Gold Layer of a Data Warehouse, performing Exploratory Data Analysis (EDA), and developing an interactive Power BI dashboard for business reporting and decision-making.

The Gold Layer was designed using a Star Schema model to provide clean, business-ready datasets optimized for analytical queries and reporting.

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

## Power BI Dashboard

An interactive Power BI dashboard was developed using the Gold Layer to transform business data into actionable insights through advanced analytics and dynamic visualizations.

### Dashboard Features

#### Executive Overview

* KPI Cards
* Total Sales
* Total Orders
* Total Customers
* Total Quantity Sold
* Average Order Value

#### Sales Analysis

* Year-over-Year (YoY) Sales Analysis
* Monthly Sales Trends
* Sales Performance by Country
* Sales Performance by Category
* Sales Performance by Subcategory

#### Customer Analysis

* Customer Segmentation
* Customer Distribution Analysis
* Customer Purchase Insights

#### Advanced Analytics

* Dynamic Visual Switching using Field Parameters
* Why Analysis for identifying sales decline
* Interactive Country Filtering using SVG Flags
* Drill-through Navigation
* Custom Tooltips
* Dynamic Slicers

---

## Repository Structure

```text
project/
│
├── Docs/
│   ├── star_schema.jpeg
│   └── dashboard.png
│
├── Gold Layer/
│   └── ddl_gold.sql
│
├── Exploratory Data Analysis/
│   └── eda.sql
│
├── Power BI Dashboard/
│   ├── Overview.png
│   ├── Cohort & Why Analysis.png
│   └── Sales Dashboard.pbix
│
└── README.md
```

---

## Technologies Used

* SQL Server
* Databricks SQL
* Power BI
* DAX
* Data Modeling
* Star Schema
* Data Warehousing
* Data Analysis
* GitHub

---

## Key Skills Demonstrated

* Data Warehousing
* Dimensional Modeling
* Star Schema Design
* SQL Analytics
* Exploratory Data Analysis (EDA)
* Business Metrics Development
* Databricks SQL
* Power BI Dashboard Development
* DAX
* KPI Design
* Year-over-Year (YoY) Analysis
* Customer Segmentation
* Field Parameters
* Why Analysis
* What-IF Analysis
* Interactive Dashboard Design
* Business Intelligence Reporting
* Data Visualization
* Data Preparation for BI Reporting
