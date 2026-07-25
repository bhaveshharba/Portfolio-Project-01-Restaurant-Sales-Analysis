CREATE DATABASE restaurant_sales_analysis;
USE restaurant_sales_analysis;

SELECT COUNT(*) FROM sales_data;

ALTER TABLE sales_data 
MODIFY COLUMN Order_Date DATE;

-- Analyze Data

-- 1.Finding Total Revenue

SELECT SUM(Order_Total) AS Total_Revenue 
FROM sales_data;

-- 2. Finding Average Order values

SELECT AVG(Order_Total) AS Average_Order 
FROM sales_data;

SELECT ROUND(AVG(order_total),2) AS Average_Order
FROM sales_data;


-- 3. Finding Total Orders

SELECT COUNT(Order_ID) AS Total_Orders 
FROM sales_data;

-- 4. Finding Total Customers

SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers 
FROM sales_data;

-- 5. Finding Top 10 Customers

SELECT Customer_ID, SUM(Order_Total) AS Total_Spent
FROM sales_data
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10; 

-- 6. Monthly Sales 

SELECT YEAR(Order_Date) AS year, MONTH(Order_Date) AS month, SUM(Order_Total) AS monthly_sales
FROM sales_data
GROUP BY
YEAR(Order_Date),
MONTH(Order_Date)
ORDER BY
YEAR(Order_Date),
MONTH(Order_Date);
    
-- 7. revenue by year

SELECT YEAR(Order_Date) AS year, SUM(Order_Total) AS yearly_sales
FROM sales_data
GROUP BY YEAR(Order_Date)
ORDER BY YEAR(Order_Date);

-- 8. Revenue by Category

SELECT Category, SUM(Order_Total) AS Revenue
FROM sales_data
GROUP BY Category
ORDER BY Revenue DESC;

-- 9. Top Selling Items (Revenue)

SELECT Item, SUM(Order_Total) AS Revenue
FROM sales_data
GROUP BY Item
ORDER BY Revenue DESC
LIMIT 10;


-- 10. Highest Priced Items

SELECT Item, Price
FROM sales_data
ORDER BY Price DESC
LIMIT 1;


-- 11. Most Ordered Items

SELECT Item, SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY ITEM
ORDER BY Total_Quantity DESC
LIMIT 5;

-- 12. Payment Method Distribution

SELECT Payment_Method, Count(*) AS Total_Orders
FROM sales_data
GROUP BY Payment_Method;

-- 13. Sales by Payment Method

SELECT Payment_Method, SUM(Order_Total) AS Revenue
FROM sales_data
GROUP BY Payment_Method
ORDER BY Revenue DESC;

-- 14. Daily Sales

SELECT Order_Date, SUM(Order_Total) AS Revenue
FROM sales_data
GROUP BY Order_Date
ORDER BY Order_Date;

-- 15. Average Quantity per Order

SELECT AVG(Quantity) AS Average_Quantity
FROM sales_data;

SELECT ROUND(AVG(Quantity),0) AS Average_Quantity
FROM sales_data;

-- 16. Revenue by Day of Week

SELECT DAYNAME(Order_Date) AS day_name, SUM(Order_Total) AS revenue
FROM sales_data
GROUP BY day_name;

-- 17. Revenue Percentage by Category

SELECT Category, SUM(Order_Total) AS revenue, 
ROUND(SUM(Order_Total) * 100 /(SELECT SUM(order_total) FROM sales_data),2) AS revenue_percentage
FROM sales_data
GROUP BY Category;

-- 18. Top 5 Days with Highest Sales

SELECT Order_Date, SUM(Order_Total) AS sales
FROM sales_data
GROUP BY Order_Date
ORDER BY sales DESC
LIMIT 5;

-- 19. Customer Lifetime Value

SELECT Customer_Id, COUNT(Order_Id) AS total_orders, SUM(Order_Total) AS lifetime_value
FROM sales_data
GROUP BY Customer_Id
ORDER BY lifetime_value DESC;