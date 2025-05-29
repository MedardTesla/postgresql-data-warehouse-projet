/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================
create or replace view gold.dim_customers as 
SELECT 
		row_number() over (order by cst_id) as customer_key,
		ci.cst_id customer_id,
		ci.cst_key customer_number,
		ci.cst_firstname first_name,
		ci.cst_lastname last_name,
		ela.cntry country,
		ci.cst_marital_status,
		case 
			when ci.cst_gndr != 'n/a' then ci.cst_gndr
			else coalesce(eca.gen, 'n/a')
		end as gender,
		eca.bdate birthdate,
		ci.cst_create_date  create_date
FROM silver.crm_cust_info ci
left join silver.erp_cust_az12 eca on eca.cid = ci.cst_key
left join silver.erp_loc_a101 ela on ela.cid = ci.cst_key;

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================
create or replace view gold.dim_products as
SELECT  
       row_number() over(order by pi.prd_start_dt, pi.prd_key) product_key,
        pi.prd_id product_id,
		pi.prd_key product_number,
		pi.prd_nm product_name,
		pi.cat_id category_id,
		epg.cat category,
		epg.subcat subcategory,
		epg.maintenance,
		pi.prd_cost cost,
		pi.prd_line product_line,
		pi.prd_start_dt start_date
FROM silver.crm_prd_info pi
left join silver.erp_px_cat_g1v2 epg on epg.id = pi.cat_id
where pi.prd_end_dt is null -- filter out all historical data
;
-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================

create or replace view gold.fact_sales as
SELECT sls_ord_num order_number, 
		sd.sls_prd_key,
		dc.customer_key,
		dp.product_key,
		sd.sls_cust_id,
		sd.sls_order_dt order_date, 
		sd.sls_ship_dt shipping_date,
		sd.sls_due_dt due_date, 
		sd.sls_sales sales_amount, 
		sd.sls_quantity quantity, 
		sd.sls_price
FROM silver.crm_sales_details sd
left join  gold.dim_products dp on dp.product_number  = sd.sls_prd_key
left join gold.dim_customers dc on dc.customer_id = sd.sls_cust_id;


