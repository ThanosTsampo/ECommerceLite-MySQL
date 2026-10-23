USE ECommerceLite;

-- ---------------------------------------------------------------------
-- 1. Populate Orders Table
-- ---------------------------------------------------------------------
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES
(1, '2023-04-10 10:00:00', 'Completed', 119.98),
(2, '2023-04-11 15:30:00', 'Completed', 249.99),
(1, '2023-04-15 12:45:00', 'Pending', 350.00),
(3, '2023-04-18 16:20:00', 'Completed', 41.99),
(4, '2023-04-20 09:10:00', 'Cancelled', 199.50),
(5, '2023-04-22 14:00:00', 'Completed', 102.49);

-- ---------------------------------------------------------------------
-- 2. Populate OrderItems Table
-- ---------------------------------------------------------------------
INSERT INTO OrderItems (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 29.99),
(1, 2, 1, 89.99),
(2, 3, 1, 249.99),
(3, 5, 1, 350.00),
(4, 1, 1, 29.99),
(4, 6, 1, 12.00),
(5, 4, 1, 199.50),
(6, 2, 1, 89.99),
(6, 6, 1, 12.50);

SELECT 'Users' AS Table_Name, COUNT(*) AS Row_Count FROM Users
UNION ALL
SELECT 'Products' AS Table_Name, COUNT(*) AS Row_Count FROM Products
UNION ALL
SELECT 'Orders' AS Table_Name, COUNT(*) AS Row_Count FROM Orders
UNION ALL
SELECT 'OrderItems' AS Table_Name, COUNT(*) AS Row_Count FROM OrderItems;