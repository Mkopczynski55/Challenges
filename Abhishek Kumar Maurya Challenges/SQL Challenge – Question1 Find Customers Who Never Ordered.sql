USE challenges;

CREATE TABLE IF NOT EXISTS customers(
id INTEGER,
name VARCHAR(255)
);

INSERT INTO customers VALUES(1, 'Aarav');
INSERT INTO customers VALUES(2, 'Neha');
INSERT INTO customers VALUES(3, 'Kabir');
INSERT INTO customers VALUES(4, 'Mansi');

SELECT * FROM customers;

CREATE TABLE IF NOT EXISTS orders(
id INTEGER,
customerId INTEGER
);

INSERT INTO orders VALUES(1, 1);
INSERT INTO orders VALUES(2, 2);
INSERT INTO orders VALUES(3, 3);
INSERT INTO orders VALUES(4, 4);

SELECT * FROM orders;

SELECT c.name
FROM customers c LEFT OUTER JOIN orders o ON c.id = o.customerID
WHERE o.customerID IS NULL;