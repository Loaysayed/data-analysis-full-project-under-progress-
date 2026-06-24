# /*

# Gold Layer - Data Modeling

Purpose:
In this step, I built the Gold Layer of the Data Warehouse using a Star Schema
design to prepare the data for reporting and analytics.

```
- Created the Customer Dimension (dim_customers) by integrating customer,
  location, and demographic data.
- Created the Product Dimension (dim_products) by enriching product data
  with category and subcategory information.
- Created the Sales Fact Table (fact_sales) containing transactional sales data
  and linked it to the dimension tables through surrogate keys.

The resulting data model provides a clean, business-friendly structure that
can be directly used for BI reporting, dashboard development, and advanced analytics.
```

===============================================================================
*/



-- dim customers

create view gold.dim_customers as
select
	row_number () over (order by c.cst_id) as customer_sk,
	c.cst_id as customer_id,
	c.cst_key as customer_key,
	c.cst_firstname as first_name,
	c.cst_lastname as last_name,
	l.cntry as country,
	c.cst_marital_status as marital_status,
case
	when c.cst_gndr != 'n/a' then c.cst_gndr
	else coalesce(ca.gen, 'n/a')
end as gender,
	c.cst_create_date as create_date,
	ca.bdate as birth_date
from silver.crm_cust_info c
	left join silver.erp_cust_az12 ca on c.cst_key = ca.cid
	left join silver.erp_loc_a101 l on c.cst_key = l.cid
	

	-- dim products

create view gold.dim_products as
select
	row_number () over (order by p.prd_id) as product_sk,
	p.prd_id as product_id,
	p.prd_key as product_key,
	p.cat_id as category_id,
	pa.cat as category,
	pa.subcat as subcategory,
	pa.maintenance as maintenance,
	p.prd_nm as product_name,
	p.prd_line as product_line,
	p.prd_cost as product_cost,
	p.prd_start_dt as product_start_date
from silver.crm_prd_info p
	left join silver.erp_px_cat_g1v2 pa on p.cat_id = pa.id
where prd_end_dt is null




-- fact sales

create view gold.fact_sales as
select
	s.sls_ord_num as order_number,
	p.product_sk,
	c.customer_sk,
	s.sls_order_dt as order_date,
	s.sls_ship_dt as ship_date,
	s.sls_due_dt as due_date,
	s.sls_sales as sales_amount,
	s.sls_quantity as quantity,
	s.sls_price as price
from silver.crm_sales_details s
	left join gold.dim_customers c on s.sls_cust_id = c.customer_id
	left join gold.dim_products p on s.sls_prd_key = p.product_key
