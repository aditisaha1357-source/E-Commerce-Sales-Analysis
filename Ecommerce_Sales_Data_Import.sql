CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;

CREATE TABLE retail_sales_raw (
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    ship_mode TEXT,
    customer_name TEXT,
    segment TEXT,
    state TEXT,
    country TEXT,
    market TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales TEXT,
    quantity TEXT,
    discount TEXT,
    profit TEXT,
    shipping_cost TEXT,
    order_priority TEXT,
    year TEXT
);

LOAD DATA LOCAL INFILE 'C:/Users/sai/Downloads/NEW_SQL_CSV 2(CLEAN_DATA).csv'
INTO TABLE retail_sales_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows
FROM retail_sales_raw;

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

SELECT *
FROM retail_sales_raw
LIMIT 10;

DESCRIBE retail_sales_raw;

USE ecommerce_sales;

CREATE TABLE retail_sales1 (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    state VARCHAR(100),
    country VARCHAR(100),
    market VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(25),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name VARCHAR(255),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(15,4),
    shipping_cost DECIMAL(12,2),
    order_priority VARCHAR(20),
    year INT
);

SHOW TABLES;

SELECT COUNT(*) AS raw_rows
FROM retail_sales_raw;

SHOW VARIABLES LIKE 'local_infile';

SELECT DATABASE();

SHOW TABLES;

SELECT *
FROM retail_sales_raw
LIMIT 100;

SELECT *
FROM retail_sales1
LIMIT 100;

DESCRIBE retail_sales1;

INSERT INTO retail_sales1 (
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_name,
    segment,
    state,
    country,
    market,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    shipping_cost,
    order_priority,
    year
)
SELECT
    TRIM(order_id),
    STR_TO_DATE(TRIM(order_date), '%Y-%m-%d'),
    STR_TO_DATE(TRIM(ship_date), '%Y-%m-%d'),
    TRIM(ship_mode),
    TRIM(customer_name),
    TRIM(segment),
    TRIM(state),
    TRIM(country),
    TRIM(market),
    TRIM(region),
    TRIM(product_id),
    TRIM(category),
    TRIM(sub_category),
    TRIM(product_name),
    CAST(NULLIF(TRIM(sales), '') AS DECIMAL(12,2)),
    CAST(NULLIF(TRIM(quantity), '') AS UNSIGNED),
    CAST(NULLIF(TRIM(discount), '') AS DECIMAL(5,2)),
    CAST(NULLIF(TRIM(profit), '') AS DECIMAL(15,4)),
    CAST(NULLIF(TRIM(shipping_cost), '') AS DECIMAL(12,2)),
    TRIM(order_priority),
    CAST(NULLIF(TRIM(year), '') AS UNSIGNED)
FROM retail_sales_raw;

SELECT COUNT(*) AS total_rows
FROM retail_sales1;

SELECT *
FROM retail_sales1
LIMIT 100;

DESCRIBE retail_sales1;
