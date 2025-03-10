
CALL bronze.load_bronze();



CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
BEGIN
    RAISE NOTICE '=========================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '=========================================';

    RAISE NOTICE '------------------------------------------';
    RAISE NOTICE 'Loading CRM table';
    RAISE NOTICE '------------------------------------------';
    RAISE NOTICE '';

    -- Chargement de bronze.crm_cust_info
    RAISE NOTICE 'Truncating table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;

    RAISE NOTICE '>> Inserting table: bronze.crm_cust_info';
    start_time := NOW();
    COPY bronze.crm_cust_info
    FROM 'C:\sql\dwh_project\source_crm\cust_info.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        NULL '',
        ENCODING 'UTF8'
    );
    end_time := NOW();
    RAISE NOTICE 'Load duration: %', (end_time - start_time);

    -- Chargement de bronze.crm_prd_info
    RAISE NOTICE '';
    RAISE NOTICE 'Truncating table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;

    RAISE NOTICE '>> Inserting table: bronze.crm_prd_info';
    start_time := NOW();
    COPY bronze.crm_prd_info
    FROM 'C:\sql\dwh_project\source_crm\prd_info.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        NULL '',
        ENCODING 'UTF8'
    );
    end_time := NOW();
    RAISE NOTICE 'Load duration: %', (end_time - start_time);

    -- Chargement de bronze.crm_sales_details
    RAISE NOTICE '';
    RAISE NOTICE 'Truncating table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;

    RAISE NOTICE '>> Inserting table: bronze.crm_sales_details';
    start_time := NOW();
    COPY bronze.crm_sales_details
    FROM 'C:\sql\dwh_project\source_crm\sales_details.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        NULL '',
        ENCODING 'UTF8'
    );
    end_time := NOW();
    RAISE NOTICE 'Load duration: %', (end_time - start_time);

    RAISE NOTICE '------------------------------------------';
    RAISE NOTICE 'Loading ERP table';
    RAISE NOTICE '------------------------------------------';

    -- Chargement de bronze.erp_cust_az12
    RAISE NOTICE '';
    RAISE NOTICE 'Truncating table: bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12;

    RAISE NOTICE '>> Inserting table: bronze.erp_cust_az12';
    start_time := NOW();
    COPY bronze.erp_cust_az12
    FROM 'C:\sql\dwh_project\source_erp\CUST_AZ12.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        NULL '',
        ENCODING 'UTF8'
    );
    end_time := NOW();
    RAISE NOTICE 'Load duration: %', (end_time - start_time);

    -- Chargement de bronze.erp_loc_a101
    RAISE NOTICE '';
    RAISE NOTICE 'Truncating table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;

    RAISE NOTICE '>> Inserting table: bronze.erp_loc_a101';
    start_time := NOW();
    COPY bronze.erp_loc_a101
    FROM 'C:\sql\dwh_project\source_erp\LOC_A101.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        NULL '',
        ENCODING 'UTF8'
    );
    end_time := NOW();
    RAISE NOTICE 'Load duration: %', (end_time - start_time);

    -- Chargement de bronze.erp_px_cat_g1v2
    RAISE NOTICE '';
    RAISE NOTICE 'Truncating table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    RAISE NOTICE '>> Inserting table: bronze.erp_px_cat_g1v2';
    start_time := NOW();
    COPY bronze.erp_px_cat_g1v2
    FROM 'C:\sql\dwh_project\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        NULL '',
        ENCODING 'UTF8'
    );
    end_time := NOW();
    RAISE NOTICE 'Load duration: %', (end_time - start_time);

EXCEPTION
    WHEN others THEN
        RAISE NOTICE 'Une erreur inattendue s''est produite : %', SQLERRM;
END;
$$;
