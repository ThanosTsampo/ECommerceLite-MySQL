USE ECommerceLite;

-- Καθαρισμός τυχόν προηγούμενου staging πίνακα
DROP TABLE IF EXISTS staging_products;

-- Δημιουργία staging πίνακα με VARCHAR για να αποφύγουμε σφάλματα τύπων δεδομένων
CREATE TABLE staging_products (
    product_name VARCHAR(255),
    category VARCHAR(255),
    price VARCHAR(255),
    stock_quantity VARCHAR(255)
) ENGINE=InnoDB;

INSERT INTO staging_products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', '29.99', '150'),
('Mechanical Keyboard', 'Electronics', '89.99', '80'),
('Gaming Monitor 27"', 'Electronics', '249.99', '45'),
('Ergonomic Chair', 'Furniture', '199.50', '20'),
('Standing Desk', 'Furniture', '350.00', '15'),
('Coffee Mug', 'Home & Kitchen', '12.50', '200'),
('Stainless Steel Water Bottle', 'Home & Kitchen', '22.00', '120');

-- Απενεργοποιούμε προσωρινά τους ελέγχους ξένων κλειδιών για ασφάλεια
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Products;
SET FOREIGN_KEY_CHECKS = 1;

-- ETL Transformation & Load
INSERT INTO Products (product_name, category, price, stock_quantity)
SELECT 
    TRIM(product_name) AS product_name,
    TRIM(category) AS category,
    CAST(REPLACE(REPLACE(price, '"', ''), '''', '') AS DECIMAL(10,2)) AS price,
    CAST(NULLIF(TRIM(stock_quantity), '') AS SIGNED) AS stock_quantity
FROM staging_products
WHERE price IS NOT NULL AND price != '';

SELECT * FROM Products;