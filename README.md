# Data Warehouse and Analytics Project

Welcome to the Data Warehouse and Analytics Project repository! 🚀
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

## 🏗️ Data Architecture


The data architecture for this project follows Medallion Architecture Bronze, Silver, and Gold layers:
![Logo](https://github.com/MedardTesla/sql-data-wherehouse-projet/blob/main/medallion_architecture.drawio.png)

1. **Bronze Layer** : Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer** : This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer** : Houses business-ready data modeled into a star schema required for reporting and analytics.


##  Project Requirements

### Objectives
Develop a modern data warehouse using Postgresql to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

## 📖 Project Overview
This project involves:

Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
Data Modeling: Developing fact and dimension tables optimized for analytical queries.
Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.
🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:

1. SQL Development
2. Data Architect
3. Data Engineering
4. ETL Pipeline Developer
5. Data Modeling
6. Data Analytics

### BI: Analytics & Reporting (Data Analysis)
#### Objective
Develop SQL-based analytics to deliver detailed insights into:

- **Customer Behavior**
- **Product Performance**
- **Sales Trends**
  
These insights empower stakeholders with key business metrics, enabling strategic decision-making.

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```
---                   # Dependencies and requirements for the project

## License

This project is licensed under the [MIT License](https://github.com/MedardTesla/sql-data-wherehouse-projet/blob/main/LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🌟 About Me

Hi there! I'm **MINLEKIB Yendouboan**. I'm an Data professional with expertise in SQL, Python, Excel and Power BI, passionate about process automation and data engineering. My goal is to transform raw data into actionable insights to optimize decision-making and improve operational efficiency.
