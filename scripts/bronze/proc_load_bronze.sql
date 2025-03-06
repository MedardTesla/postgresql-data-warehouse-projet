
CREATE OR replace PROCEDURE bronze.load_bronze
  () LANGUAGE plpgsql
AS
  $$
  DECLARE
    start_time timestamp;
    end_time timestamp;
  BEGIN
    RAISE notice '=========================================';
    RAISE notice 'Loading Bronze Layer';
    RAISE notice '=========================================';
    RAISE notice '------------------------------------------';
    RAISE notice 'Loading CRM table';
    RAISE notice '------------------------------------------';
    RAISE notice 'Truncating table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;
    
    RAISE notice '>> Inserting table: bronze.crm_cust_info';
    start_time = now();
    copy bronze.crm_cust_info FROM 'C:\sql\dwh_project\source_crm\cust_info.csv' WITH ( format csv, header TRUE, delimiter ',', NULL '', encoding 'UTF8' );
    end_time = now();
    RAISE notice 'Load duration: % s', end_time - start_time;
    RAISE notice '';
    RAISE notice 'Truncating table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info ;
    
    RAISE notice '>>Inserting table: bronze.crm_prd_info';
    start_time = now();
    copy bronze.crm_prd_info FROM 'C:\sql\dwh_project\source_crm\prd_info.csv' WITH ( format csv, header TRUE, delimiter ',', NULL '', encoding 'UTF8' );
    end_time = now();
    RAISE notice 'Load duration: % s', end_time - start_time;
    RAISE notice '';
    RAISE notice 'Truncating table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details ;
    
    RAISE notice '>>Inserting table: bronze.crm_sales_details';
    start_time = now();
    copy bronze.crm_sales_details FROM 'C:\sql\dwh_project\source_crm\sales_details.csv' WITH ( format csv, header TRUE, delimiter ',', NULL '', encoding 'UTF8' );
    end_time = now();
    RAISE notice 'Load duration: % s', end_time - start_time;
    RAISE notice '------------------------------------------';
    RAISE notice 'Loading ERP table';
    RAISE notice '------------------------------------------';
    RAISE notice '';
    RAISE notice 'Truncating table: bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12 ;
    
    RAISE notice '>>Inserting table: bronze.erp_cust_az12';
    start_time = now();
    copy bronze.erp_cust_az12 FROM 'C:\sql\dwh_project\source_erp\CUST_AZ12.csv' WITH ( format csv, header TRUE, delimiter ',', NULL '', encoding 'UTF8' );
    end_time = now();
    RAISE notice 'Load duration: % s', end_time - start_time;
    RAISE notice '';
    RAISE notice 'Truncating table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101 ;
    
    RAISE notice '>>Inserting table: bronze.erp_loc_a101';
    start_time = now();
    copy bronze.erp_loc_a101 FROM 'C:\sql\dwh_project\source_erp\LOC_A101.csv' WITH ( format csv, header TRUE, delimiter ',', NULL '', encoding 'UTF8' );
    end_time = now();
    RAISE notice 'Load duration: % s', end_time - start_time;
    RAISE notice '';
    RAISE notice 'Truncating table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2 ;
    
    RAISE notice '>>Inserting table: bronze.erp_px_cat_g1v2';
    start_time = now();
    copy bronze.erp_px_cat_g1v2 FROM 'C:\sql\dwh_project\source_erp\PX_CAT_G1V2.csv' WITH ( format csv, header TRUE, delimiter ',', NULL '', encoding 'UTF8' );
    end_time = now();
    RAISE notice 'Load duration: % s', end_time - start_time;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE notice 'Une erreur inattendue s''est produite : %', SQLERRM;
  END;
  $$;
