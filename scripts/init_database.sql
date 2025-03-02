
-- Create Database 'DataWarehouse'
-- Database was created with pgadmin
create database DataWarehouse;
-- select * from pg_database where datname='datawarehouse';
-- connect to database datawarehouse before executing the following query
-- Create  Schema
create schema bronze;

create schema silver;

create schema gold;
