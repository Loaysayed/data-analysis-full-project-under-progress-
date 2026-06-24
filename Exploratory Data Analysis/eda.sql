# /*

# Exploratory Data Analysis (EDA)

Purpose:
This script performs exploratory data analysis on the Gold Layer of the
Data Warehouse to understand the dataset, validate data quality, and
identify key business insights before building dashboards and reports.

Analysis Performed:
- Examined product categories, subcategories, and products.
- Analyzed the available sales date range.
- Identified the youngest and oldest customers.
- Calculated key business metrics including:
* Total Sales
* Average Sales
* Total Quantity Sold
* Average Selling Price
* Total Orders
* Total Customers
* Customers Who Placed Orders
- Evaluated sales performance by:
* Category and Subcategory
* Country
* Product
- Analyzed average product cost across categories.

Outcome:
The analysis provides a high-level understanding of customer behavior,
product performance, sales trends, and overall business performance,
serving as a foundation for dashboard development and advanced analytics.

===============================================================================
*/
        -- a look on categories, subcategories and products
select category, subcategory, product_name from dim_products;


        -- date range
select min(order_date),
       max(order_date),
       date_diff( month, min(order_date), max(order_date)) as months_range
         from fact_sales;


         -- youngest and oldest customer
select min(birth_date),
       max(birth_date),
       date_diff( year, min(birth_date), getdate()) as oldest_customer,
       date_diff( year, max(birth_date), getdate()) as youngest_customer
       from dim_customers;


        -- total sales, avg sales, total quantity and avg selling price

select sum(sales_amount) as total_sales,
       avg(sales_amount) as avg_sales,
       sum(quantity) as total_quantity,
       avg(price) as avg_selling_price
 from fact_sales;

       -- number of orders
select count(order_number)
from fact_sales;

        -- number of customers
select count(customer_sk)
from dim_customers;

       -- number of customers that placed an order
select count(distinct customer_sk)
from fact_sales;

            -- business metrics
select 'total sales' as measure_name, sum(sales_amount) as measure_value from fact_sales
union all
select 'avg sales' as measure_name, avg(sales_amount) as measure_value from fact_sales
union all
select 'total quantity' as measure_name,sum(quantity) as measure_value from fact_sales
union all
select 'avg selling price' as measure_name, avg(price) as measure_value from fact_sales
union all
select 'total orders' as measure_name, count(order_number) as measure_value from fact_sales
union all
select 'total customers' as measure_name, count(customer_sk) as measure_value from dim_customers
union all
select 'total customers that placed an order' as measure_name, count(distinct customer_sk) as measure_value from fact_sales;





        -- total sales by category and subcategory
select p.category,
       p.subcategory,
       sum(s.sales_amount) as total_sales
from fact_sales s
left join dim_products p
on s.product_sk = p.product_sk
group by category, subcategory;


        -- avg cost for each category
select category, avg(product_cost) as avg_cost
from dim_products
group by category;


        -- total sales by country
select c.country,
       sum(s.sales_amount) as total_sales
from fact_sales s
left join dim_customers c
on s.customer_sk = c.customer_sk
group by c.country
order by total_sales desc;

        -- total sales by product
select 
        row_number() over(order by sum(sales_amount) desc) as rank,
        p.product_name,
        sum(sales_amount) as total_sales
from fact_sales s
left join dim_products p
on s.product_sk = p.product_sk
group by p.product_name
order by total_sales desc;








