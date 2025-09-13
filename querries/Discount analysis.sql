USE superstore_db;

-- Discount bucket analysis
SELECT
    Discount_Bucket,
    COUNT(*) AS Num_Orders,
    ROUND(SUM(Sales),3) AS Total_Sales,
    ROUND(SUM(Profit),3) AS Total_Profit,
    ROUND(SUM(Quantity),3) AS Total_Quantity,
    ROUND(AVG(Profit),3) AS Avg_Profit_per_record,
    ROUND(AVG(Quantity),3) AS Avg_Quantity_per_record,
    ROUND(SUM(Profit)*1.0/NULLIF(SUM(Sales),0),3) AS Profit_Margin
FROM (
    SELECT *,
        CASE
            WHEN Discount IS NULL THEN 'Unknown'
            WHEN Discount < 0.05 THEN '0-5%'
            WHEN Discount < 0.15 THEN '5-15%'
            WHEN Discount < 0.30 THEN '15-30%'
            ELSE '30%+'
        END AS Discount_Bucket
    FROM superstore
) t
GROUP BY Discount_Bucket
ORDER BY
    -- order buckets logically
    CASE Discount_Bucket
        WHEN '0-5%' THEN 1
        WHEN '5-15%' THEN 2
        WHEN '15-30%' THEN 3
        WHEN '30%+' THEN 4
        ELSE 5
    END;

-- Avg discount vs avg margin per product (helps see trend)
SELECT
    Product_Name,
    ROUND(AVG(Discount),3) AS Avg_Discount,
    ROUND(SUM(Sales),3) AS Total_Sales,
    ROUND(SUM(Profit),3) AS Total_Profit,
    ROUND(SUM(Profit)*1.0/NULLIF(SUM(Sales),0),3) AS Profit_Margin
FROM superstore
GROUP BY Product_Name
HAVING COUNT(*) >= 5   -- optional: only products with >=5 orders to reduce noise
ORDER BY Avg_Discount DESC;  -- see high-discount products and their margin