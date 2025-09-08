create database DApractice;
use DApractice;

SELECT * FROM Superstore_clean;

-- 1. Total Sales, Profit, Quantity per Category
SELECT 
    Category, 
    SUM(Sales) AS TotalSales, 
    SUM(Profit) AS TotalProfit, 
    SUM(Quantity) AS TotalQuantity
FROM Superstore_clean
GROUP BY Category
ORDER BY TotalSales DESC;

-- 2. Top 10 Customers by Sales
SELECT TOP 10 Customer_Name, 
       SUM(Sales) AS TotalSales
FROM Superstore_clean
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

-- 3. Sales Trend per Month
SELECT 
    YEAR([Order_Date]) AS OrderYear,
    MONTH([Order_Date]) AS OrderMonth,
    SUM(Sales) AS TotalSales
FROM Superstore_clean
GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
ORDER BY OrderYear, OrderMonth;

-- 4. Products with Negative Profit
SELECT Product_Name, 
       SUM(Sales) AS TotalSales, 
       SUM(Profit) AS TotalProfit
FROM Superstore_clean
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY TotalProfit ASC;

-- 5. Regional Sales Performance
SELECT Region, 
       SUM(Sales) AS TotalSales, 
       SUM(Profit) AS TotalProfit
FROM Superstore_clean
GROUP BY Region
ORDER BY TotalSales DESC;

-- 6. Average Delivery Days per Region
SELECT 
    Region,
    AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS AvgDeliveryDays
FROM Superstore_clean
GROUP BY Region;

-- 7. Top 5 States by Profit
SELECT TOP 5
    State, 
    SUM(Profit) AS TotalProfit
FROM Superstore_clean
GROUP BY State
ORDER BY TotalProfit DESC;

-- 8. Rata-rata Discount per Sub-Category
SELECT 
    Sub_Category,
    AVG(Discount) AS AvgDiscount
FROM Superstore_clean
GROUP BY Sub_Category
ORDER BY AvgDiscount DESC;

-- 9. Profit Margin per Product
SELECT 
    Product_Name,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    CASE 
        WHEN SUM(Sales) <> 0 THEN (SUM(Profit) / SUM(Sales)) * 100
        ELSE 0
    END AS ProfitMarginPct
FROM Superstore_clean
GROUP BY Product_Name
ORDER BY ProfitMarginPct DESC;

-- 10. Customer Segmentation berdasarkan Sales dan Profit
SELECT 
    Segment,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM Superstore_clean
GROUP BY Segment
ORDER BY TotalSales DESC;