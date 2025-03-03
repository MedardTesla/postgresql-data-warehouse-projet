/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/



-- Create Database 'DataWarehouse'
-- Database was created with pgadmin
create database DataWarehouse;
-- select * from pg_database where datname='datawarehouse';
-- connect to database datawarehouse before executing the following query
-- Create  Schema
create schema bronze;

create schema silver;

create schema gold;
