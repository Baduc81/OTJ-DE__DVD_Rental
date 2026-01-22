# End-to-End Data Engineering Pipeline (OTJ Project)

## Project Overview

This repository contains the final project of my **On-the-Job Training (OTJ)** program at **FPT**, where I worked in the role of **Data Engineer**.

The objective of this project is to design and implement a **production-style, end-to-end data pipeline**, covering the full lifecycle of data engineering:
- Infrastructure provisioning
- Data ingestion
- Data modeling and transformation
- Analytics and visualization
- CI/CD and code governance

The project follows modern data engineering best practices and demonstrates how raw transactional data can be transformed into analytics-ready datasets for business intelligence.

## Dataset

- **Source**: PostgreSQL Sample Database (Neon)
- **Link**: https://neon.com/postgresql/postgresql-getting-started/postgresql-sample-database
- **Type**: OLTP transactional database

### Description

The dataset simulates a real-world PostgreSQL transactional system, including entities such as customers, orders, products, and sales-related data.  
It is used as the **source system** for building the end-to-end data pipeline.


## Architecture Overview

The pipeline is designed following a modern cloud-based data platform architecture:

```
PostgreSQL (Source System)
         ↓
Amazon S3 (Raw / Bronze Layer)
         ↓
Snowflake Data Warehouse
  * Bronze Layer
  * Silver Layer
  * Gold Layer
        ↓
dbt (Transformations & Data Modeling)
        ↓
Power BI (Semantic Model & Reports)
````

This layered approach ensures scalability, maintainability, and clear separation of responsibilities across the pipeline.

## Technology Stack

- **Cloud Provider**: AWS
- **Infrastructure as Code**: Terraform
- **Object Storage**: Amazon S3
- **Data Warehouse**: Snowflake
- **Transformation & Modeling**: dbt
- **CI/CD**: GitHub Actions
- **Version Control**: GitHub (with branch protection)
- **Visualization**: Power BI
- **Source Database**: PostgreSQL (Neon)

## Data Layer Design

### Bronze Layer
- Raw data ingested from PostgreSQL
- Minimal transformation
- Schema closely mirrors source tables
- Used for traceability and auditing

### Silver Layer
- Cleaned and standardized data
- Data quality checks applied
- Business keys and relationships defined
- Ready for analytical transformations

### Gold Layer
- Analytics-ready fact and dimension tables
- Optimized for BI and reporting
- Designed following dimensional modeling principles


## dbt Project Structure

---

## Infrastructure as Code (Terraform)

Terraform is used to provision and manage AWS resources, including:

* S3 buckets for raw data storage
* IAM roles and policies
* Supporting infrastructure required for the pipeline

This ensures:

* Reproducibility
* Environment consistency
* Infrastructure version control

## CI/CD and Branch Protection Strategy

### Git Workflow

* `main` branch is protected
* Feature development is done via feature branches
* Pull Requests are required for merging
* Code review is enforced

### GitHub Actions

The CI/CD pipeline includes:

* dbt compile
* dbt test
* dbt run (on merge to main)

This ensures code quality, data reliability, and safe deployments.

## Power BI Analytics

* Snowflake serves as the data source
* Gold layer tables are exposed to Power BI
* A semantic model is created for reporting
* Dashboards provide business insights based on transformed data

## How to Run the Project (High-Level)

1. Provision infrastructure using Terraform
2. Extract data from PostgreSQL and upload to S3 (Raw/Bronze)
3. Load data from S3 into Snowflake
4. Run dbt models to build Silver and Gold layers
5. Connect Snowflake to Power BI for reporting

## Documentation

Additional documentation can be found in the `docs/` directory, including:

* Architecture diagrams
* Data model explanations
* Design decisions and assumptions

## Learning Outcomes

Through this project, I gained hands-on experience with:

* Designing scalable end-to-end data pipelines
* Applying data warehousing best practices
* Managing cloud infrastructure using Terraform
* Implementing CI/CD for data engineering workflows
* Building analytics-ready datasets for BI tools
* Working with modern data stack technologies

## Author

* **Name**: Phan Ba Duc and Tran Dang Tuan
* **Role**: Data Engineer Intern (On-the-Job Training Program)
* **Company**: FPT Software
