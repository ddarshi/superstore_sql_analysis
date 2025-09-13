USE superstore_db;

--Most valuable customer in terms of profit
SELECT Top 20 
       Customer_Name,
       ROUND(SUM(Profit),3) As Total_Profit,
       ROUND(SUM(Sales),3) As Total_Sales,
       COUNT(DISTINCT Order_ID) AS Num_Orders
From superstore
Group by Customer_ID,Customer_Name
Order by Total_Profit DESC;

--Customer segment Profitability
SELECT Segment,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Profit),3) AS Total_Profit,
       ROUND(SUM(Profit)/NULLIF(SUM(Sales),0)*100,2) AS Profit_Margin
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

--Customer Retention(repeat customer)
WITH CustomerOrders AS (
    SELECT Customer_ID, COUNT(*) AS Order_Count
    FROM superstore
    GROUP BY Customer_ID
),
FirstPurchase AS (
    SELECT COUNT(*) AS Total_Customers
    FROM CustomerOrders
),
RepeatPurchase AS (
    SELECT COUNT(*) AS Returning_Customers
    FROM CustomerOrders
    WHERE Order_Count >= 2
),
MultiPurchase AS (
    SELECT COUNT(*) AS Loyal_Customers
    FROM CustomerOrders
    WHERE Order_Count >= 3
)
SELECT 
    CAST(r.Returning_Customers AS FLOAT) / f.Total_Customers AS Repeat_Rate,
    CAST(m.Loyal_Customers AS FLOAT) / f.Total_Customers AS Retention_3plus
FROM FirstPurchase f
JOIN RepeatPurchase r ON 1=1 --CROSS JOIN(1=1)
JOIN MultiPurchase m ON 1=1;