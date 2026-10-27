USE ecommerce_sales;

-- 1.Top 10 Profitable Products

SELECT
product_name,
SUM(profit) AS total_profit
FROM retail_sales1
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- 2.Top 10 Customers by Sales

SELECT
customer_name,
SUM(sales) AS total_sales
FROM retail_sales1
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- 3.Region-wise Total Sales

SELECT
region,
SUM(sales) AS total_sales
FROM retail_sales1
GROUP BY region
ORDER BY total_sales DESC;

-- 4.Category-wise Average Profit

SELECT
category,
AVG(profit) AS average_profit
FROM retail_sales1
GROUP BY category 
ORDER BY average_profit DESC;

-- 5.Highest discount category

SELECT
category,
MAX(discount) AS highest_discount
FROM retail_sales1
GROUP BY category
ORDER BY highest_discount DESC
LIMIT 1;

-- 6.Orders with Negative Profit

SELECT
COUNT(distinct(order_id))
AS negative_profit_orders
FROM retail_sales1
WHERE profit<0;

-- 7.Monthly Sales Trend

SELECT
DATE_FORMAT(order_date,'%Y-%m') 
AS month,
SUM(sales) AS total_sales
FROM retail_sales1
GROUP BY month
ORDER BY month;

-- 8.Market-wise revenue Analysis

SELECT
market,
SUM(sales) AS total_revenue
FROM retail_sales1
GROUP BY market
ORDER BY total_revenue DESC;

-- 9.Top-performing sub-categories

SELECT
sub_category,
SUM(profit) AS total_profit
FROM retail_sales1
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;

-- 10.Ship mode usage Analysis

SELECT
ship_mode,
COUNT(*) AS usage_count
FROM retail_sales1
GROUP BY ship_mode
ORDER BY usage_count DESC;

-- SHORT INSIGHTS BASED ON SQL ANALYSIS

-- 1.Market Generating the Highest Revenue

SELECT
market,
SUM(sales) AS total_revenue
FROM retail_sales1
GROUP BY market
ORDER BY total_revenue DESC
LIMIT 1;

-- 2.Least Profitable Categories

SELECT
category,
SUM(profit) as total_profit
FROM retail_sales1
GROUP BY category
ORDER BY total_profit ASC;

-- 3.Most commonly used shipping mode

SELECT
ship_mode,
COUNT(*) AS usage_count
FROM retail_sales1
GROUP BY ship_mode
ORDER BY usage_count DESC
LIMIT 1;