-- =====================================================================
-- Script Name: 04_Business_Queries.sql
-- Project:     ECommerceLite (MySQL)
-- Description: Business analytics queries (JOINs, Aggregations, Group By)
-- =====================================================================

USE ECommerceLite;

-- 1. Total Revenue per Order (JOIN & GROUP BY)
SELECT 
    o.order_id,
    u.first_name,
    u.last_name,
    o.order_date,
    o.status,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY o.order_id, u.first_name, u.last_name, o.order_date, o.status;

-- 2. Top-Selling Products by Quantity Sold
SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Products p
JOIN OrderItems oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_units_sold DESC;

-- 3. Customer Lifetime Value (Total Spent per User)
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0.00) AS lifetime_spend
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id AND o.status = 'Completed'
GROUP BY u.user_id, customer_name
ORDER BY lifetime_spend DESC;