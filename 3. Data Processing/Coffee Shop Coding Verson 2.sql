-- Databricks notebook source

SELECT *
 FROM `v2coffeecoding`.`data`.`bright_coffee`;

 DESCRIBE v2coffeecoding.data.bright_coffee;



--checking product_category
SELECT DISTINCT product_category
FROM Coffee_Shop.coffee_data.coffee_shop_dataset;
----------------------------------------------------
--cleaning product_category
SELECT 
    CASE 
        WHEN product_category = 'NULL' THEN 'unknown'
        WHEN product_category = ' ' THEN 'unknown'
        ELSE product_category
    END AS product_cat
FROM v2coffeecoding.data.bright_coffee;

----------------------------------------------------
--cleaning product_category
SELECT 
    CASE 
        WHEN product_category = 'NULL' THEN 'unknown'
        WHEN product_category = ' ' THEN 'unknown'
        ELSE product_category
    END AS product_cat
FROM v2coffeecoding.data.bright_coffee;

-------------------------------------------------
--checking product_type
SELECT DISTINCT product_type
FROM  v2coffeecoding.data.bright_coffee;
------------------------------------------------------
--cleaning product_type
SELECT 
    CASE 
        WHEN product_type = 'NULL' THEN 'unknown'
        WHEN product_type = ' ' THEN 'unknown'
        ELSE product_type
    END AS product_typ
FROM Coffee_Shop.coffee_data.coffee_shop_dataset;--checking product_type
SELECT DISTINCT product_type
FROM  v2coffeecoding.data.bright_coffee;
------------------------------------------------------


--creating the revenue column 
SELECT transaction_qty,
       unit_price,
       (transaction_qty*unit_price) AS Total_Amount
FROM v2coffeecoding.data.bright_coffee;

---------------------------------------------------------------
--checking duplicates
SELECT *,
      COUNT(*) AS Duplicates_cnt
FROM  Coffee_Shop.coffee_data.coffee_shop_dataset
GROUP BY ALL
HAVING COUNT(*)>1;

---------------------------------------------------------------


SELECT DISTINCT transaction_date
FROM  Coffee_Shop.coffee_data.coffee_shop_dataset

SELECT DISTINCT DATE_FORMAT(transaction_time, 'MMMM') AS month_name
FROM coffee_shop.coffee_data.coffee_shop_dataset;

---------------------------------------------------------------

SELECT DISTINCT DATE_FORMAT(transaction_time, 'HH:mm:ss') AS Time
FROM v2coffeecoding.data.bright_coffee;


SELECT DISTINCT DATE_FORMAT(transaction_time, 'MMMM') AS month_name
FROM v2coffeecoding.data.bright_coffee;

--time buckets
SELECT
  CASE 
    WHEN HOUR(transaction_time) BETWEEN 7 AND 9 THEN 'Morning'
    WHEN HOUR(transaction_time) BETWEEN 10 AND 12 THEN 'Afternoon'
    WHEN HOUR(transaction_time) BETWEEN 13 AND 15 THEN 'Evening'
    WHEN HOUR(transaction_time) BETWEEN 16 AND 18 THEN 'Night'
    WHEN HOUR(transaction_time) >= 19 AND HOUR(transaction_time) <= 20 THEN 'Closing hours'
    ELSE 'Night'
  END AS Time_bucket
FROM v2coffeecoding.data.bright_coffee;
---------------------------------------------------------------

--Creating Revenue column
SELECT transaction_qty,
        product_type,
        product_category,
        unit_price,
        (unit_price*transaction_qty) AS Total_Amount
FROM v2coffeecoding.data.bright_coffee;

SELECT transaction_qty,
        product_type,
        product_category,
        unit_price,
        ROUND(SUM(unit_price*transaction_qty),2) AS Total_Amount
FROM v2coffeecoding.data.bright_coffee
GROUP BY transaction_qty, unit_price,product_type,
        product_category;



--string to numeric
SELECT SUM(transaction_qty) AS total_daily_sales,
       ROUND(SUM(CAST(transaction_qty AS DOUBLE) * CAST (REPLACE (unit_price, ',', '.') AS DOUBLE)), 0) AS  total_amount
FROM v2coffeecoding.data.bright_coffee
GROUP BY transaction_qty;

------------------------------------------------------------------------


SELECT
product_category,
product_type,
product_detail,
unit_price,
SUM(transaction_qty) AS total_transaction_qty,
ROUND(SUM(transaction_qty * unit_price), 2) AS total_price
FROM v2coffeecoding.data.bright_coffee
GROUP BY
product_category,
product_type,
product_detail,
unit_price
ORDER BY total_price DESC;

----------------------------------------------------------------

--total revenue per store location
SELECT store_location, SUM(unit_price * transaction_qty) AS Total_revenue
FROM v2coffeecoding.data.bright_coffee
GROUP BY store_location
ORDER BY Total_revenue DESC;

--product perf
SELECT product_category, SUM(unit_price * transaction_qty) AS Total_revenue
FROM v2coffeecoding.data.bright_coffee
GROUP BY product_category
ORDER BY Total_revenue DESC;

------------------------------------------------------------------

SELECT
       MAX (transaction_qty * unit_price) AS Highest_product,
       MIN (transaction_qty * unit_price) AS Lowest_product
FROM v2coffeecoding.data.bright_coffee;



SELECT MIN(transaction_date) AS Earliest_date, MAX(transaction_date) AS Latest_date
FROM v2coffeecoding.data.bright_coffee;


SELECT product_type, SUM(transaction_qty) AS Total_units_sold
FROM v2coffeecoding.data.bright_coffee
GROUP BY product_type
ORDER BY Total_units_sold DESC;

SELECT *
 FROM `v2coffeecoding`.`data`.`bright_coffee`;

 DESCRIBE v2coffeecoding.data.bright_coffee;



--checking product_category
SELECT DISTINCT product_category
FROM Coffee_Shop.coffee_data.coffee_shop_dataset;
----------------------------------------------------
--cleaning product_category
SELECT 
    CASE 
        WHEN product_category = 'NULL' THEN 'unknown'
        WHEN product_category = ' ' THEN 'unknown'
        ELSE product_category
    END AS product_cat
FROM v2coffeecoding.data.bright_coffee;

----------------------------------------------------
--cleaning product_category
SELECT 
    CASE 
        WHEN product_category = 'NULL' THEN 'unknown'
        WHEN product_category = ' ' THEN 'unknown'
        ELSE product_category
    END AS product_cat
FROM v2coffeecoding.data.bright_coffee;

-------------------------------------------------
--checking product_type
SELECT DISTINCT product_type
FROM  v2coffeecoding.data.bright_coffee;
------------------------------------------------------
--cleaning product_type
SELECT 
    CASE 
        WHEN product_type = 'NULL' THEN 'unknown'
        WHEN product_type = ' ' THEN 'unknown'
        ELSE product_type
    END AS product_typ
FROM Coffee_Shop.coffee_data.coffee_shop_dataset;--checking product_type
SELECT DISTINCT product_type
FROM  v2coffeecoding.data.bright_coffee;
------------------------------------------------------


--creating the revenue column 
SELECT transaction_qty,
       unit_price,
       (transaction_qty*unit_price) AS Total_Amount
FROM v2coffeecoding.data.bright_coffee;

---------------------------------------------------------------
--checking duplicates
SELECT *,
      COUNT(*) AS Duplicates_cnt
FROM  Coffee_Shop.coffee_data.coffee_shop_dataset
GROUP BY ALL
HAVING COUNT(*)>1;

---------------------------------------------------------------


SELECT DISTINCT transaction_date
FROM  Coffee_Shop.coffee_data.coffee_shop_dataset

SELECT DISTINCT DATE_FORMAT(transaction_time, 'MMMM') AS month_name
FROM coffee_shop.coffee_data.coffee_shop_dataset;

---------------------------------------------------------------

SELECT DISTINCT DATE_FORMAT(transaction_time, 'HH:mm:ss') AS Time
FROM v2coffeecoding.data.bright_coffee;


SELECT DISTINCT DATE_FORMAT(transaction_time, 'MMMM') AS month_name
FROM v2coffeecoding.data.bright_coffee;

--time buckets
SELECT
  CASE 
    WHEN HOUR(transaction_time) BETWEEN 7 AND 9 THEN 'Morning'
    WHEN HOUR(transaction_time) BETWEEN 10 AND 12 THEN 'Afternoon'
    WHEN HOUR(transaction_time) BETWEEN 13 AND 15 THEN 'Evening'
    WHEN HOUR(transaction_time) BETWEEN 16 AND 18 THEN 'Night'
    WHEN HOUR(transaction_time) >= 19 AND HOUR(transaction_time) <= 20 THEN 'Closing hours'
    ELSE 'Night'
  END AS Time_bucket
FROM v2coffeecoding.data.bright_coffee;
---------------------------------------------------------------

--Creating Revenue column
SELECT transaction_qty,
        product_type,
        product_category,
        unit_price,
        (unit_price*transaction_qty) AS Total_Amount
FROM v2coffeecoding.data.bright_coffee;

SELECT transaction_qty,
        product_type,
        product_category,
        unit_price,
        ROUND(SUM(unit_price*transaction_qty),2) AS Total_Amount
FROM v2coffeecoding.data.bright_coffee
GROUP BY transaction_qty, unit_price,product_type,
        product_category;



--string to numeric
SELECT SUM(transaction_qty) AS total_daily_sales,
       ROUND(SUM(CAST(transaction_qty AS DOUBLE) * CAST (REPLACE (unit_price, ',', '.') AS DOUBLE)), 0) AS  total_amount
FROM v2coffeecoding.data.bright_coffee
GROUP BY transaction_qty;

------------------------------------------------------------------------


SELECT
product_category,
product_type,
product_detail,
unit_price,
SUM(transaction_qty) AS total_transaction_qty,
ROUND(SUM(transaction_qty * unit_price), 2) AS total_price
FROM v2coffeecoding.data.bright_coffee
GROUP BY
product_category,
product_type,
product_detail,
unit_price
ORDER BY total_price DESC;

----------------------------------------------------------------

--total revenue per store location
SELECT store_location, SUM(unit_price * transaction_qty) AS Total_revenue
FROM v2coffeecoding.data.bright_coffee
GROUP BY store_location
ORDER BY Total_revenue DESC;

--product perf
SELECT product_category, SUM(unit_price * transaction_qty) AS Total_revenue
FROM v2coffeecoding.data.bright_coffee
GROUP BY product_category
ORDER BY Total_revenue DESC;

------------------------------------------------------------------

SELECT
       MAX (transaction_qty * unit_price) AS Highest_product,
       MIN (transaction_qty * unit_price) AS Lowest_product
FROM v2coffeecoding.data.bright_coffee;



SELECT MIN(transaction_date) AS Earliest_date, MAX(transaction_date) AS Latest_date
FROM v2coffeecoding.data.bright_coffee;


SELECT product_type, SUM(transaction_qty) AS Total_units_sold
FROM v2coffeecoding.data.bright_coffee
GROUP BY product_type
ORDER BY Total_units_sold DESC;
