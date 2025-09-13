USE superstore_db;

--Total Sales and Total profit by category of product
SELECT Category,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Profit),3) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

--Product performance by sales and profit
SELECT Product_Name,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Quantity),3) AS Total_Quantity,
       ROUND(SUM(Profit),3) AS Total_Profit,
       ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Quantity),0),3) AS Profit_Per_Quantity,
       ROUND((SUM(Profit) * 1.0 / NULLIF(SUM(Sales),0)) * 100,3) AS Profit_Margin_Percent
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit ASC;

--Top 10 products by sales
SELECT TOP 10 
       Product_Name,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Quantity),3) AS Total_Quantity,
       ROUND(SUM(Sales) * 1.0 / NULLIF(SUM(Quantity), 0),3) AS Sales_Per_Quantity
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

--Top 10 products by profit
SELECT TOP 10 
       Product_Name,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Quantity),3) AS Total_Quantity,
       ROUND(SUM(Profit),3) AS Total_Profit,
       ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Quantity),0),3) AS Profit_Per_Quantity,
       ROUND((SUM(Profit) * 1.0 / NULLIF(SUM(Sales),0)) * 100,3) AS Profit_Margin_Percent
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit DESC;

--Bottom 10 products by sales
SELECT TOP 10 
       Product_Name,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Quantity),3) AS Total_Quantity,
       ROUND(SUM(Sales) * 1.0 / NULLIF(SUM(Quantity), 0),3) AS Sales_Per_Quantity
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Sales ASC;

--Bottom 10 products by profit
SELECT TOP 10 
       Product_Name,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Quantity),3) AS Total_Quantity,
       ROUND(SUM(Profit),3) AS Total_Profit,
       ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Quantity),0),3) AS Profit_Per_Quantity,
       ROUND((SUM(Profit) * 1.0 / NULLIF(SUM(Sales),0)) * 100,3) AS Profit_Margin_Percent
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit ASC;


