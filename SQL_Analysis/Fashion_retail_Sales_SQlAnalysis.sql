
CREATE TABLE fashion_retail_sales (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Order_Channel VARCHAR(50),
    Payment_Method VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Age INTEGER,
    Age_Group VARCHAR(20),
    Customer_Type VARCHAR(50),
    Segment VARCHAR(20),
    Product_Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Brand VARCHAR(50),
    Size VARCHAR(10),
    Color VARCHAR(30),
    Units_Sold INTEGER,
    Unit_Price NUMERIC(12, 2),
    "Discount_%" NUMERIC(5, 2),
    Sales_Amount NUMERIC(14, 2),
    Cost_Amount NUMERIC(14, 2),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(30),
    Return_Status VARCHAR(30),
    Order_Year INTEGER,
    Order_Quarter VARCHAR(5),
    Profit NUMERIC(14, 2),
    "Profit_Margin_%" NUMERIC(6, 2),
    Order_Month VARCHAR(20),
    Sales_Category VARCHAR(30),
    Profit_Category VARCHAR(30),
    Customer_Order_Count INTEGER,
    Product_Performance VARCHAR(30),
    Total_Units_Per_Order INTEGER,
    Order_Size VARCHAR(30)
);

select * from fashion_retail_sales


-- 1. Find the total sales.
SELECT SUM(Sales_Amount) AS Total_Sales
FROM Fashion_Retail_Sales;


-- 2. Find the total profit.
SELECT SUM(Profit) AS Total_Profit
FROM Fashion_Retail_Sales;


-- 3. Find the total number of orders.
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Fashion_Retail_Sales;


-- 4. Find the total number of customers.
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Fashion_Retail_Sales;


-- 5. Find the average order value.
SELECT
    SUM(Sales_Amount) / COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM Fashion_Retail_Sales;


-- 6. Find total sales by product category.
SELECT
    Product_Category,
    SUM(Sales_Amount) AS Total_Sales
FROM Fashion_Retail_Sales
GROUP BY Product_Category
ORDER BY Total_Sales DESC;


-- 7. Find total sales by region.
SELECT
    Region,
    SUM(Sales_Amount) AS Total_Sales
FROM Fashion_Retail_Sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 8. Find total profit by product category.
SELECT
    Product_Category,
    SUM(Profit) AS Total_Profit
FROM Fashion_Retail_Sales
GROUP BY Product_Category
ORDER BY Total_Profit DESC;


-- 9. Find total profit by region.
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM Fashion_Retail_Sales
GROUP BY Region
ORDER BY Total_Profit DESC;


-- 10. Find monthly sales.
SELECT
    Order_Year,
    Order_Month,
    SUM(Sales_Amount) AS Monthly_Sales
FROM Fashion_Retail_Sales
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;


-- 11. Find the top 10 customers by total spending.
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales_Amount) AS Total_Spending
FROM Fashion_Retail_Sales
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Spending DESC
LIMIT 10;


-- 12. Find repeat customers who placed more than one order.
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Fashion_Retail_Sales
GROUP BY Customer_ID, Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY Total_Orders DESC;


-- 13. Find the average spending per customer.
SELECT AVG(Customer_Spending) AS Average_Customer_Spending
FROM (
    SELECT
        Customer_ID,
        SUM(Sales_Amount) AS Customer_Spending
    FROM Fashion_Retail_Sales
    GROUP BY Customer_ID
) AS Customer_Summary;


-- 14. Find the top 10 products by sales.
SELECT
    Product_Name,
    SUM(Units_Sold) AS Total_Units_Sold,
    SUM(Sales_Amount) AS Total_Sales
FROM Fashion_Retail_Sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 15. Find the bottom 10 products by sales.
SELECT
    Product_Name,
    SUM(Units_Sold) AS Total_Units_Sold,
    SUM(Sales_Amount) AS Total_Sales
FROM Fashion_Retail_Sales
GROUP BY Product_Name
ORDER BY Total_Sales ASC
LIMIT 10;


-- 16. Find the 10 most profitable products.
SELECT
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM Fashion_Retail_Sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;


-- 17. Rank customers based on their total sales.
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
FROM (
    SELECT
        Customer_ID,
        Customer


-- 18. Rank products based on total units sold.

SELECT
    Product_Name,
    SUM(Units_Sold) AS Total_Units_Sold,
    RANK() OVER (
        ORDER BY SUM(Units_Sold) DESC
    ) AS Product_Rank
FROM Fashion_Retail_Sales
GROUP BY Product_Name
ORDER BY Product_Rank;


-- 19. Calculate monthly sales growth percentage.

WITH Monthly_Sales AS (
    SELECT
        Order_Year,
        Order_Month,
        SUM(Sales_Amount) AS Total_Sales
    FROM Fashion_Retail_Sales
    GROUP BY Order_Year, Order_Month
),
Sales_Growth AS (
    SELECT
        Order_Year,
        Order_Month,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Order_Year, Order_Month
        ) AS Previous_Month_Sales
    FROM Monthly_Sales
)
SELECT
    Order_Year,
    Order_Month,
    Total_Sales,
    Previous_Month_Sales,
    ROUND(
        (Total_Sales - Previous_Month_Sales)
        / NULLIF(Previous_Month_Sales, 0) * 100,
        2
    ) AS Growth_Percentage
FROM Sales_Growth
ORDER BY Order_Year, Order_Month;



-- 20. Rank product categories based on total sales.

SELECT
    Product_Category,
    SUM(Sales_Amount) AS Total_Sales,
    RANK() OVER (
        ORDER BY SUM(Sales_Amount) DESC
    ) AS Category_Rank
FROM Fashion_Retail_Sales
GROUP BY Product_Category
ORDER BY Category_Rank;