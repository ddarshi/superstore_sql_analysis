USE superstore_db;

--Shipping Efficiency
SELECT Ship_Mode,
       AVG(DATEDIFF(day,Order_Date,Ship_Date)) AS Avg_Shipping_Days,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Profit),3) AS Total_Profit
FROM superstore
GROUP BY Ship_Mode;
