USE challenges;

CREATE TABLE IF NOT EXISTS products(
id INTEGER,
product_name VARCHAR(255),
category VARCHAR(255)
);

INSERT INTO products VALUES(1, 'Phone 14', 'Electronics');
INSERT INTO products VALUES(2, 'MacBook Air', 'Electronics');
INSERT INTO products VALUES(3, 'Sony Headphones', 'Accessories');
INSERT INTO products VALUES(4, 'Fitbit Charge 5', 'Wearables');
INSERT INTO products VALUES(5, 'Google Pixel 7', 'Electronics');
INSERT INTO products VALUES(6, 'iPad Pro', 'Electronics');
INSERT INTO products VALUES(7, 'Samsung Galaxy Buds', 'Accessories');

SELECT * FROM products;

DROP TABLE IF EXISTS sales;

CREATE TABLE IF NOT EXISTS sales(
id INTEGER,
product_id INTEGER,
sale_date DATE,
quantity_sold INTEGER,
unit_price DECIMAL(7, 2)
);

INSERT INTO sales VALUES(101, 1, '2023-07-05', 5, 560);
INSERT INTO sales VALUES(102, 1, '2023-07-15', 10, 560);
INSERT INTO sales VALUES(103, 2, '2023-07-15', 2, 900);
INSERT INTO sales VALUES(104, 3, '2023-07-10', 5, 120);
INSERT INTO sales VALUES(105, 1, '2023-07-10', 3, 560);
INSERT INTO sales VALUES(106, 4, '2023-07-20', 4, 150);
INSERT INTO sales VALUES(107, 5, '2023-07-22', 6, 550);
INSERT INTO sales VALUES(108, 5, '2023-07-15', 4, 550);
INSERT INTO sales VALUES(109, 6, '2023-07-03', 1, 1200);
INSERT INTO sales VALUES(110, 7, '2023-07-06', 6, 95);
INSERT INTO sales VALUES(111, 7, '2023-07-15', 5, 95);
INSERT INTO sales VALUES(112, 3, '2023-07-17', 3, 120);
INSERT INTO sales VALUES(113, 2, '2023-07-12', 1, 900);
INSERT INTO sales VALUES(114, 4, '2023-07-15', 5, 150);
INSERT INTO sales VALUES(115, 6, '2023-07-25', 2, 1200);

SELECT * FROM sales;

SELECT p.product_name, s.sale_date, MAX(s.quantity_sold * s.unit_price) AS total_order_cost
FROM sales s LEFT OUTER JOIN products p ON s.product_id = p.id
WHERE MONTH(s.sale_date) = 7 AND YEAR(s.sale_date) = 2023
GROUP BY product_name, sale_date
ORDER BY total_order_cost DESC
LIMIT 1;

SELECT p.product_name, s.sale_date, MAX(s.quantity_sold * s.unit_price) AS total_order_cost
FROM sales s LEFT OUTER JOIN products p ON s.product_id = p.id
WHERE MONTH(s.sale_date) = 7 AND YEAR(s.sale_date) = 2023
GROUP BY product_name, sale_date
ORDER BY total_order_cost DESC
LIMIT 3;

SELECT sale_date, SUM(quantity_sold * unit_price) AS total_daily_sales
FROM sales
WHERE MONTH(sale_date) = 7 AND YEAR(sale_date) = 2023
GROUP BY sale_date
ORDER BY total_daily_sales DESC
LIMIT 3;

