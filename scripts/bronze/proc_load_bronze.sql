

create or replace procedure bronze.load_bronze()
language plpgsql
as $$
declare 
	start_time timestamp;
	end_time timestamp;
begin 
	
	raise notice '=========================================';
	raise notice 'Loading Bronze Layer';
	raise notice '=========================================';
	
	raise notice '------------------------------------------';
	raise notice 'Loading CRM table';
	raise notice '------------------------------------------';

	raise notice 'Truncating table: bronze.crm_cust_info';
	truncate table bronze.crm_cust_info;
	raise notice '>> Inserting table: bronze.crm_cust_info';
	start_time = now();
	copy bronze.crm_cust_info
	from 'C:\sql\dwh_project\source_crm\cust_info.csv'
	with (
		format csv,
		header true,
		delimiter ',',
		null '',
		encoding 'UTF8'
	);
	end_time = now();
	raise notice 'Load duration: % s', end_time - start_time;
	
	
	
	raise notice '';
	raise notice 'Truncating table: bronze.crm_prd_info';
	truncate table bronze.crm_prd_info ;
	raise notice '>>Inserting table: bronze.crm_prd_info';

	start_time = now();
	copy bronze.crm_prd_info
	from 'C:\sql\dwh_project\source_crm\prd_info.csv'
	with (
		format csv,
		header true,
		delimiter ',',
		null '',
		encoding 'UTF8'
	);

	end_time = now();
	raise notice 'Load duration: % s', end_time - start_time;

	raise notice '';
	raise notice 'Truncating table: bronze.crm_sales_details';
	truncate table bronze.crm_sales_details ;
	raise notice '>>Inserting table: bronze.crm_sales_details';
	
	start_time = now();
	copy bronze.crm_sales_details
	from 'C:\sql\dwh_project\source_crm\sales_details.csv'
	with (
		format csv,
		header true,
		delimiter ',',
		null '',
		encoding 'UTF8'
	);
	end_time = now();
	raise notice 'Load duration: % s', end_time - start_time;

	raise notice '------------------------------------------';
	raise notice 'Loading ERP table';
	raise notice '------------------------------------------';
	

	

	
	raise notice '';
	raise notice 'Truncating table: bronze.erp_cust_az12';
	truncate table bronze.erp_cust_az12 ;
	raise notice '>>Inserting table: bronze.erp_cust_az12';
	start_time = now();
	copy bronze.erp_cust_az12
	from 'C:\sql\dwh_project\source_erp\CUST_AZ12.csv'
	with (
		format csv,
		header true,
		delimiter ',',
		null '',
		encoding 'UTF8'
	);
	end_time = now();
	raise notice 'Load duration: % s', end_time - start_time;
	
	raise notice '';
	raise notice 'Truncating table: bronze.erp_loc_a101';
	truncate table bronze.erp_loc_a101  ;
	raise notice '>>Inserting table: bronze.erp_loc_a101';

	start_time = now();
	copy bronze.erp_loc_a101
	from 'C:\sql\dwh_project\source_erp\LOC_A101.csv'
	with (
		format csv,
		header true,
		delimiter ',',
		null '',
		encoding 'UTF8'
	);
	end_time = now();
	raise notice 'Load duration: % s', end_time - start_time;
	
	raise notice '';
	raise notice 'Truncating table: bronze.erp_px_cat_g1v2';
	truncate table bronze.erp_px_cat_g1v2  ;
	raise notice '>>Inserting table: bronze.erp_px_cat_g1v2';

	start_time = now();
	copy bronze.erp_px_cat_g1v2
	from 'C:\sql\dwh_project\source_erp\PX_CAT_G1V2.csv'
	with (
		format csv,
		header true,
		delimiter ',',
		null '',
		encoding 'UTF8'
	);
	end_time = now();
	raise notice 'Load duration: % s', end_time - start_time;
exception 
    when  others then 
        raise notice 'Une erreur inattendue s''est produite : %', SQLERRM;
end;

$$;

