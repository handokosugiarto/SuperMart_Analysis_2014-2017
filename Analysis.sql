--- Total Sales, Quantity, Average Selling Price, Avg Discount,avg cost and Total Profits by Segment
SELECT
	segment,
	total_sales,
	total_profits,
	average_price,
	total_sales-total_profits AS cost,
	ROUND(AVG(total_sales-total_profits) OVER(),2) AS average_cost,
	average_discount
FROM(
SELECT 
	Segment,
	ROUND(SUM(sales),2) AS total_sales,
	SUM(Quantity) AS total_quantity,
	ROUND(SUM(sales)/(sum(quantity)*(1- AVG(Discount))),2) AS average_price,
	ROUND(AVG(discount),2) AS average_discount,
	ROUND(SUM(profit),2) AS total_profits
	
FROM dbo.Superstore 
GROUP BY Segment) AS a

ORDER BY total_sales DESC

--- Total Sales, Quantity, Average Selling Price, Avg Discount, Avg cost and Total Profits by Category

SELECT
	category,
	total_sales,
	total_profits,
	average_price,
	total_sales-total_profits AS cost,
	ROUND(AVG(total_sales-total_profits) OVER(),2) AS average_cost,
	average_discount
FROM(
SELECT 
	Category,
	ROUND(SUM(sales),2) AS total_sales,
	SUM(Quantity) AS total_quantity,
	ROUND(SUM(sales)/(sum(quantity)*(1- AVG(Discount))),2) AS average_price,
	ROUND(AVG(discount),2) AS average_discount,
	ROUND(SUM(profit),2) AS total_profits
	
FROM dbo.Superstore 
GROUP BY Category) AS a

ORDER BY total_sales DESC

--- Total Sales, Quantity, Average Selling Price, Avg Discount, Avg cost and Total Profits by SubCategory
SELECT
	sub_category,
	total_sales,
	total_profits,
	average_price,
	total_sales-total_profits AS cost,
	ROUND(AVG(total_sales-total_profits) OVER(),2) AS average_cost,
	average_discount
FROM(
SELECT 
	Sub_Category,
	ROUND(SUM(sales),2) AS total_sales,
	SUM(Quantity) AS total_quantity,
	ROUND(SUM(sales)/(sum(quantity)*(1- AVG(Discount))),2) AS average_price,
	ROUND(AVG(discount),2) AS average_discount,
	ROUND(SUM(profit),2) AS total_profits
	
FROM dbo.Superstore 
GROUP BY Sub_Category) AS a

ORDER BY total_sales DESC

--- Total Sales, Quantity, Average Selling Price, Avg Discount, and Total Profits by Region
SELECT 
	Region,
	ROUND(SUM(sales),2) AS total_sales,
	SUM(Quantity) AS total_quantity,
	ROUND(SUM(sales)/(sum(quantity)*(1- AVG(Discount))),2) AS average_price,
	ROUND(AVG(discount),2) AS average_discount,
	ROUND(SUM(profit),2) AS total_profits
FROM dbo.Superstore
GROUP BY Region
ORDER BY total_sales DESC

--- Total Revenue,Profits, and Orders by each customer

SELECT 
	customer_name,
	ROUND(SUM(sales),2) AS total_sales,
	ROUND(SUM(profit),2) AS total_profit,
	COUNT(DISTINCT order_id) AS total_order
FROM dbo.Superstore
GROUP BY Customer_Name
ORDER BY total_sales DESC

	--- Change Over Time Analysis

SELECT 
	DATETRUNC(month,order_date) order_month, 	
	SUM(quantity) AS total_quantity,
	ROUND(SUM(Sales),1) AS total_sales,
	ROUND(SUM(profit),1) AS total_profit,
	COUNT(DISTINCT customer_id) AS total_customers
	FROM dbo.Superstore
	GROUP BY DATETRUNC(month,order_date)
	ORDER BY DATETRUNC(month,order_date);

--- Cumulative Analysis

SELECT
	order_month,
	total_sales,
	SUM(total_sales) OVER(ORDER BY order_month) AS running_total_sales,
	total_profit,
	SUM(total_profit) OVER(ORDER BY order_month) AS running_total_profit,
	total_quantity,
	SUM(total_quantity) OVER(ORDER BY order_month) AS running_total_quantity,
	ROUND(AVG(total_sales/total_quantity) OVER(ORDER BY order_month),1) AS moving_average_price
FROM(

SELECT 
	DATETRUNC(month,order_date) AS order_month,
	ROUND(SUM(sales),1) AS total_sales,
	ROUND(SUM(profit),1) AS total_profit,
	SUM(quantity) AS total_quantity
FROM dbo.Superstore
GROUP BY DATETRUNC(month,order_date)) AS a



--- Performance Analysis

SELECT 
	order_year,
	Sub_Category,
	current_sales,
	AVG(current_sales) OVER(PARTITION BY sub_category) AS average_sales,
	ROUND(current_sales-AVG(current_sales) OVER(PARTITION BY sub_category),1) AS diff_avg,
	CASE WHEN ROUND(current_sales-AVG(current_sales) OVER(PARTITION BY sub_category),1) >0 THEN 'Above Avg'
		 WHEN ROUND(current_sales-AVG(current_sales) OVER(PARTITION BY sub_category),1) <0 THEN 'Below Avg'
		 ELSE 'Avg'
		 END AS Avg_change,

--- Year on Year Analysis
	LAG(current_sales) OVER (PARTITION BY sub_category ORDER BY order_year) AS previous_sales,
	ROUND(current_sales-LAG(current_sales) OVER (PARTITION BY sub_category ORDER BY order_year),1) AS diff_py, 
	CASE WHEN ROUND(current_sales-LAG(current_sales) OVER (PARTITION BY sub_category ORDER BY order_year),1)>0 THEN 'Increase'
		 WHEN ROUND(current_sales-LAG(current_sales) OVER (PARTITION BY sub_category ORDER BY order_year),1)<0 THEN 'Decrease'
		 ELSE 'No Change'
		 END AS py_change


FROM(

SELECT 
	DATETRUNC(year,order_date) AS order_year,
	Sub_Category,
	ROUND(SUM(sales),1) AS current_sales

FROM dbo.Superstore
GROUP BY DATETRUNC(year,order_date),Sub_Category) AS a

--- Profits

SELECT 
	order_year,
	Sub_Category,
	current_profit,
	AVG(current_profit) OVER(PARTITION BY sub_category) AS average_profit,
	ROUND(current_profit-AVG(current_profit) OVER(PARTITION BY sub_category),1) AS diff_avg,
	CASE WHEN ROUND(current_profit-AVG(current_profit) OVER(PARTITION BY sub_category),1) >0 THEN 'Above Avg'
		 WHEN ROUND(current_profit-AVG(current_profit) OVER(PARTITION BY sub_category),1) <0 THEN 'Below Avg'
		 ELSE 'Avg'
		 END AS Avg_change,

--- Year on Year Analysis
	LAG(current_profit) OVER (PARTITION BY sub_category ORDER BY order_year) AS previous_profit,
	ROUND(current_profit-LAG(current_profit) OVER (PARTITION BY sub_category ORDER BY order_year),1) AS diff_py, 
	CASE WHEN ROUND(current_profit-LAG(current_profit) OVER (PARTITION BY sub_category ORDER BY order_year),1)>0 THEN 'Increase'
		 WHEN ROUND(current_profit-LAG(current_profit) OVER (PARTITION BY sub_category ORDER BY order_year),1)<0 THEN 'Decrease'
		 ELSE 'No Change'
		 END AS py_change


FROM(

SELECT 
	DATETRUNC(year,order_date) AS order_year,
	Sub_Category,
	ROUND(SUM(Profit),1) AS current_profit

FROM dbo.Superstore
GROUP BY DATETRUNC(year,order_date),Sub_Category) AS a

SELECT 
	DATETRUNC(year,order_date) AS order_year,
	region,
	ROUND(SUM(sales),1) AS total_sales,
	ROUND(SUM(profit),1) AS total_profit,
	ROUND(SUM(sales),1)-ROUND(SUM(profit),1) AS total_cost,
	COUNT(order_id) AS total_order,
	COUNT(DISTINCT Customer_ID) AS total_customer

FROM dbo.Superstore
GROUP BY DATETRUNC(year,order_date), region
ORDER BY  DATETRUNC(year,order_date)
--- Part to Whole Analysis

SELECT
	category,
	total_sales,
	overall_sales,
	CONCAT(ROUND(total_sales/overall_sales*100,1),'%') AS percentage_of_total,
	total_profit,
	overall_profit,
	CONCAT(ROUND(total_profit/overall_profit*100,1),'%') AS percentage_of_total
	
FROM
(SELECT 
	category,
	ROUND(SUM(sales),1) AS total_sales,
	(SELECT ROUND(SUM(sales),1) FROM dbo.Superstore) AS overall_sales,
	ROUND(SUM(profit),1) AS total_profit,
	(SELECT ROUND(SUM(Profit),1) FROM dbo.Superstore) AS overall_profit


FROM dbo.Superstore
GROUP BY Category) AS a
ORDER BY total_sales DESC
	
--- Data Segmentation
SELECT   cost_range, COUNT(product_id) AS total_products
FROM

(SELECT 
	product_id,
	sub_category,
	CASE WHEN total_sales-total_profit <1000 THEN 'Below $1,000'
	     WHEN total_sales-total_profit BETWEEN 1000 AND 5000 THEN '$1K - $5K'
		 WHEN total_sales-total_profit BETWEEN 5001 AND 10000 THEN '$5K - $10K'
		 WHEN total_sales-total_profit BETWEEN 10001 AND 15000 THEN '$10K - $15K'
		 WHEN total_sales-total_profit BETWEEN 15001 AND 20000 THEN '$15K - $20K'
		 ELSE 'Above $20K' END AS cost_range
	
FROM(
SELECT
	product_id,
	sub_category,
	ROUND(SUM(sales),1) AS total_sales,
	ROUND(SUM(profit),1) AS total_profit

FROM dbo.superstore
GROUP BY Product_ID,Sub_Category) AS a) AS b
GROUP BY cost_range 
ORDER BY total_products DESC

 SELECT 
	customer_segment,
	COUNT(customer_id) AS total_customers,
	SUM(total_spending) AS total_spending,
	ROUND(AVG(total_spending),1) AS average_spending,
	(SELECT ROUND(SUM(sales),1) FROM dbo.Superstore) AS overall_spending,
	CONCAT(ROUND(SUM(total_spending)/(SELECT ROUND(SUM(sales),1) FROM dbo.Superstore)*100,1),'%') AS percentage
 FROM(
 SELECT 
	customer_id,
	total_spending,
	lifespan,
	CASE WHEN lifespan >=12  AND total_spending <5000 THEN 'Low Spending and Loyal'
		 WHEN lifespan >=12  AND total_spending BETWEEN 5000 AND 15000 THEN 'Medium Spending and loyal'
		 WHEN lifespan >=12  AND total_spending >15000 THEN 'High Spending and Loyal'	 
		 ELSE 'New customer' END AS customer_segment
FROM(

SELECT 
	Customer_ID,
	ROUND(SUM(sales),1) AS total_spending,
	MIN(order_date) AS first_order,
	MAX(order_date) AS last_order,
	DATEDIFF(month,MIN(order_date), MAX(order_date)) AS lifespan
FROM dbo.Superstore
GROUP BY Customer_ID) AS a) AS b
GROUP BY customer_segment
ORDER BY COUNT(customer_id) DESC

--- Reporting

WITH base_query AS(
/*===========================================================================
1) Base Query: Retrives core columns from tables
=============================================================================*/

SELECT
	order_id,
	product_id,
	order_date,
	customer_id,
	customer_name,
	segment,
	sales,
	quantity,
	profit

FROM dbo.Superstore)

, customers_aggregation AS(
/*===========================================================================
2) Customer Aggregations: Summarizes key metrics at the customer level
=============================================================================*/
SELECT 
	customer_id,
	customer_name,
	segment,
	COUNT (DISTINCT Order_ID) AS total_orders,
	ROUND(SUM(sales),1) AS total_sales,
	ROUND(SUM(quantity),1) AS total_quantity,
	ROUND(SUM(profit),1) AS total_profits,
	COUNT(DISTINCT product_id) AS total_products,
	MAX(order_date) AS last_order_date,
	DATEDIFF(month,MIN(order_date),MAX(order_date)) AS lifespan
FROM base_query
GROUP BY
	customer_id,
	customer_name,
	segment)

SELECT
	customer_id,
	customer_name,
	segment,
	CASE WHEN lifespan >=12  AND total_sales <5000 THEN 'Low Spending and Loyal'
		 WHEN lifespan >=12  AND total_sales BETWEEN 5000 AND 15000 THEN 'Medium Spending and loyal'
		 WHEN lifespan >=12  AND total_sales >15000 THEN 'High Spending and Loyal'	 
		 ELSE 'New customer' END AS customer_segment,
	last_order_date,
	DATEDIFF(month, last_order_date,GETDATE()) AS recency,
	total_orders,
	total_sales,
	total_quantity,
	total_profits,
	total_products,
	lifespan,
--- Compute Average Order Value
	CASE WHEN total_sales = 0 THEN 0
		 ELSE ROUND(total_sales/total_orders,1) 
		 END AS average_order_value,
--- Compute Average Monthly Spend
	CASE WHEN lifespan = 0 THEN total_sales
	ELSE ROUND(total_sales/lifespan,1) 
	END AS average_monthly_spend

FROM customers_aggregation


WITH product_query AS(
	SELECT 
		order_id,
		order_date,
		customer_id,
		product_id,
		category,
		sub_category,
		product_name,
		ROUND(sales,1) AS sales,
		quantity,
		ROUND(profit,1) AS profit,
		ROUND((sales-profit),1) AS cost

	FROM dbo.Superstore),

 product_aggregation AS (SELECT 
	product_id,
	category,
	sub_category,
	product_name,
	COUNT(order_id) AS total_orders,
	SUM(sales) AS total_sales,
	SUM(quantity) AS total_quantity,
	ROUND(SUM(profit),1) AS total_profit,
	SUM(cost) AS total_cost,
	COUNT(DISTINCT customer_id) AS total_customers,
	MIN(order_date) AS first_order,
	MAX(order_date) AS last_order,
	DATEDIFF(month,MIN(order_date), MAX(order_date)) AS lifespan
	

FROM product_query
GROUP BY
	product_id,
	category,
	sub_category,
	product_name)

SELECT 
	product_id,
	category,
	sub_category,
	product_name,
	total_orders,
	total_sales,
	total_quantity,
	total_profit,
	total_cost,
	total_customers, 
	lifespan,
	CASE WHEN total_sales < 1200 THEN 'Low Performers'
	     WHEN total_sales BETWEEN 1200 AND 5000 THEN 'Mid Performers'
		 ELSE 'High Performers' END AS product_segment,
	DATEDIFF(month,last_order, GETDATE()) AS recency,
	CASE WHEN total_sales = 0 THEN 0
		 ELSE ROUND(total_sales/total_orders,1) 
		 END AS average_order_revenue,
	CASE WHEN lifespan = 0 THEN total_sales
	ELSE ROUND(total_sales/lifespan,1) 
	END AS average_monthly_revenue


FROM product_aggregation 
