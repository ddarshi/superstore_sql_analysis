USE superstore_db;

--Sales by year
Select FORMAT(Order_Date, 'yyyy') AS Year,
       ROUND(SUM(Sales),3) As Yearly_Total_Sales
From superstore
GROUP BY FORMAT(Order_Date, 'yyyy')
ORDER BY Year;

--Regional Profitability
SELECT Region,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Profit),3) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

--Sales trend over time
SELECT FORMAT(Order_Date, 'yyyy-MM') AS Month,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Profit),3) AS Total_Profit
FROM superstore
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

--Sales by year and region
Select Region,
       FORMAT(Order_Date, 'yyyy') AS Year,
       ROUND(SUM(Sales),3) As Yearly_Total_Sales
From superstore
GROUP BY Region, FORMAT(Order_Date, 'yyyy')
ORDER BY Year, Region;

--Sales by region and month
SELECT Region,
       FORMAT(Order_Date, 'yyyy-MM') AS YearMonth,
       ROUND(SUM(Sales),3) AS Total_Sales
FROM superstore
GROUP BY Region, FORMAT(Order_Date, 'yyyy-MM')
ORDER BY YearMonth , Region;







