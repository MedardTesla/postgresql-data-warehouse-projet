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



-- Créer la base de données 'DataWarehouse'
-- La base de données a été créée avec pgAdmin
CREATE DATABASE DataWarehouse;

-- Vérifier si la base de données a été créée

-- Se connecter à la base de données 'DataWarehouse' avant d'exécuter les requêtes suivantes

-- Créer les schémas
CREATE SCHEMA bronze; -- Schéma pour les données brutes
CREATE SCHEMA silver; -- Schéma pour les données transformées
CREATE SCHEMA gold;   -- Schéma pour les données agrégées et prêtes à l'utilisation 
