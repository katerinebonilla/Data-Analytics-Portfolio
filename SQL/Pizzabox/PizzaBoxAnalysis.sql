/* 
Pizza Box Stats
*/
SELECT *
FROM pizza_sales
	
-- Finding the total Revenue of all pizza orders
SELECT 
	SUM(total_price) AS total_revenue
FROM pizza_sales
	
-- Finding the Average Order Value 
SELECT 
	(SUM(total_price)/COUNT(DISTINCT order_id)) AS avg_order_value
FROM pizza_sales
	
-- Finding the total pizzas sold
SELECT 
	  SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
	
-- Finding the total number of orders 
SELECT 
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
	
-- Finding Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS avg_pizzas_per_order
FROM pizza_sales
	
-- Orders Per Day 
SELECT 
	DATENAME(DW,order_date) AS day_name,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date) 
	
-- Orders Per Hour 
SELECT 
	DATEPART(HOUR,order_time) AS order_hour,
	COUNT(DISTINCT order_time) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)
	
--Percentage of Sales Per Pizza Category
SELECT 
	pizza_category,CAST(SUM(total_price) AS DECIMAL (10,2)) AS total_revenue,
	CAST(SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS percent_category
FROM pizza_sales
GROUP BY pizza_category
--Percentage of Sales Per Pizza Size
SELECT 
	pizza_size,
	CAST(SUM(total_price)*100 /(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS percent_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY percent_size DESC
	
--Total Pizzas Sold by Pizza Category
SELECT 
	pizza_category,
	SUM(quantity) as pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
	
--Total 5 Best Sellers by Total Pizzas Sold
SELECT 
	TOP 5 pizza_name, 
	SUM(quantity) AS pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY pizzas_sold DESC
	
-- Bottom 5 Best Sellers By Total Pizzas Sold
SELECT 
	TOP 5 pizza_name, 
	SUM(quantity) AS pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY pizzas_sold ASC









