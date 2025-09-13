USE superstore_db;

-- Sub-category profitability overview(worst performing)
SELECT
    Sub_Category,
    ROUND(SUM(Sales),3) AS Total_Sales,
    ROUND(SUM(Profit),3) AS Total_Profit,
    ROUND(SUM(Profit)*1.0/NULLIF(SUM(Sales),0),3) AS Profit_Margin
FROM superstore
GROUP BY Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Profit_Margin ASC;   -- worst first

--Underperforming segments (profit margin < 5%)
SELECT Segment,
       Category,
       Sub_Category,
       ROUND(SUM(Sales),3) AS Total_Sales,
       ROUND(SUM(Profit),3) AS Total_Profit,
       ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Sales),0),3) AS Profit_Margin
FROM superstore
GROUP BY Segment, Category, Sub_Category
HAVING ROUND(SUM(Sales),3) > 10000
   AND ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Sales),0),3) < 0.05
ORDER BY Profit_Margin ASC;

--Product profitability overview(worst performing)
SELECT
    Product_Name,
    Sub_Category,
    ROUND(SUM(Sales),3) AS Total_Sales,
    ROUND(SUM(Quantity),3) AS Total_Quantity,
    ROUND(SUM(Profit),3) AS Total_Profit,
    ROUND(SUM(Profit)*1.0/NULLIF(SUM(Sales),0),3) AS Profit_Margin
FROM superstore
WHERE Sub_Category IN ( 'Tables','Bookcases','Supplies')
GROUP BY Product_Name,Sub_Category
ORDER BY Sub_Category,Total_Profit ASC;   -- show worst furniture products first

-- Products with high sales but negative profit
SELECT 
    Product_Name,
    ROUND(SUM(Sales),3) AS Total_Sales,
    ROUND(SUM(Quantity),3) AS Total_Quantity,
    ROUND(SUM(Profit),3) AS Total_Profit,
    ROUND(SUM(Profit)*1.0/NULLIF(SUM(Sales),0),2) AS Profit_Margin
FROM superstore
GROUP BY Product_Name
HAVING ROUND(SUM(Profit),3) < 0
ORDER BY Total_Sales DESC;