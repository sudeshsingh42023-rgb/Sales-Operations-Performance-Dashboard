-- =====================================================================
-- Sales & Operations Performance Dashboard — KPI Queries
-- Data source: retail_sales_dataset.csv loaded into table `retail_sales`
-- Columns: OrderID, OrderDate, Month, Region, Category, Channel,
--          UnitPrice, Quantity, Revenue, DeliveryDays, Delayed,
--          CustomerID, ChurnRisk
-- =====================================================================

-- 1. Monthly revenue trend
SELECT
    Month,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_count
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- 2. Revenue and average order value by region
SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_count,
    ROUND(SUM(Revenue) / COUNT(DISTINCT OrderID), 2) AS avg_order_value
FROM retail_sales
GROUP BY Region
ORDER BY total_revenue DESC;

-- 3. Revenue by product category and sales channel (pivot-style)
SELECT
    Category,
    Channel,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT OrderID) AS order_count
FROM retail_sales
GROUP BY Category, Channel
ORDER BY Category, total_revenue DESC;

-- 4. Delivery performance by region (% of orders delayed beyond 5 days)
SELECT
    Region,
    COUNT(*) AS total_orders,
    SUM(Delayed) AS delayed_orders,
    ROUND(100.0 * SUM(Delayed) / COUNT(*), 1) AS pct_delayed,
    ROUND(AVG(DeliveryDays), 2) AS avg_delivery_days
FROM retail_sales
GROUP BY Region
ORDER BY pct_delayed DESC;

-- 5. Delivery performance by channel (Online vs In-Store)
SELECT
    Channel,
    ROUND(AVG(DeliveryDays), 2) AS avg_delivery_days,
    ROUND(100.0 * SUM(Delayed) / COUNT(*), 1) AS pct_delayed
FROM retail_sales
GROUP BY Channel;

-- 6. Customer churn-risk distribution and associated revenue exposure
SELECT
    ChurnRisk,
    COUNT(DISTINCT CustomerID) AS customers,
    ROUND(SUM(Revenue), 2) AS revenue_at_risk
FROM retail_sales
GROUP BY ChurnRisk
ORDER BY CASE ChurnRisk WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END;

-- 7. Top 5 highest-revenue categories overall
SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Category
ORDER BY total_revenue DESC
LIMIT 5;

-- 8. Month-over-month revenue growth rate
SELECT
    Month,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(
        100.0 * (SUM(Revenue) - LAG(SUM(Revenue)) OVER (ORDER BY Month))
        / NULLIF(LAG(SUM(Revenue)) OVER (ORDER BY Month), 0), 1
    ) AS mom_growth_pct
FROM retail_sales
GROUP BY Month
ORDER BY Month;
