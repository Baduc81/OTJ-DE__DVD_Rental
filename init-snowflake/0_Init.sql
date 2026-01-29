
USE ROLE ACCOUNTADMIN;
-- ---------------DROP IF EXISTS TO AVOID CONFLICTS WHEN RE-RUNNING THE SCRIPT----------------
-- DROP STORAGE INTEGRATION IF EXISTS S3_DVD_RENTAL_INTEGRATION;

-- ----------------------------THIS BELOW COMMAND CAN ONLY RUN BY ACCOUNT ADMIN--------------------------------------------
CREATE WAREHOUSE IF NOT EXISTS transforming;

CREATE DATABASE IF NOT EXISTS dvd_rental; 

CREATE OR REPLACE SCHEMA dvd_rental.bronze;

CREATE OR REPLACE SCHEMA dvd_rental.silver;

CREATE OR REPLACE SCHEMA dvd_rental.gold;

DESC STORAGE INTEGRATION S3_DVD_RENTAL_INTEGRATION;

CREATE OR REPLACE FILE FORMAT dvd_rental.bronze.csv_ff
    TYPE = 'CSV'
    FIELD_DELIMITER = ',',
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    ESCAPE_UNENCLOSED_FIELD = '\\'
    NULL_IF = ('', 'NULL');

-- Create external stage
CREATE OR REPLACE STAGE dvd_rental.bronze.dvd_rental_stage
    STORAGE_INTEGRATION = S3_DVD_RENTAL_INTEGRATION
    URL = 's3://dvd-rental-ducpb7-tuantd24/data/'
    FILE_FORMAT = dvd_rental.bronze.csv_ff;


-- List files in the stage
LIST @dvd_rental.bronze.dvd_rental_stage;