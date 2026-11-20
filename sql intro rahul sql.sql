
CREATE DATABASE kirana_store_dbse;

USE kirana_store_dbse;


-- 1. CREATE PRODUCTS TABLE


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price_inr DECIMAL(8,2),
    stock_qty INT
);



-- 2. INSERT 12 PRODUCTS


INSERT INTO products
(product_id, product_name, category, unit_price_inr, stock_qty)
VALUES
(1, 'Toor Dal', 'Pulses', 180.00, 15),
(2, 'Moong Dal', 'Pulses', 140.00, 25),
(3, 'Chana Dal', 'Pulses', 90.00, 12),

(4, 'Basmati Rice', 'Grains', 250.00, 10),
(5, 'Wheat Flour', 'Grains', 45.00, 30),
(6, 'Rice', 'Grains', 60.00, 18),

(7, 'Sunflower Oil', 'Oils', 190.00, 8),
(8, 'Mustard Oil', 'Oils', 160.00, 22),
(9, 'Groundnut Oil', 'Oils', 650.00, 14),

(10, 'Potato Chips', 'Snacks', 20.00, 50),
(11, 'Biscuits', 'Snacks', 30.00, 16),
(12, 'Namkeen', 'Snacks', 80.00, 19);


-- 3. CREATE SALES TABLE

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE
);

-- 4. INSERT 15 SALES RECORDS


INSERT INTO sales
(product_id, quantity, sale_date)
VALUES
(1, 2, '2026-10-01'),
(2, 5, '2026-10-01'),
(3, 3, '2026-10-01'),

(4, 2, '2026-10-02'),
(5, 4, '2026-10-02'),
(6, 6, '2026-10-02'),
(7, 1, '2026-10-02'),

(8, 3, '2026-10-03'),
(9, 2, '2026-10-03'),
(10, 8, '2026-10-03'),

(11, 5, '2026-10-04'),
(12, 4, '2026-10-04'),
(1, 3, '2026-10-04'),

(4, 2, '2026-10-05'),
(7, 6, '2026-10-05');



-- 5. FINAL VERIFICATION


SHOW TABLES;

DESCRIBE products;

DESCRIBE sales;

SELECT * FROM products;

SELECT * FROM sales;
