USE challenges;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
user_id INTEGER,
role VARCHAR(255),
banned VARCHAR(3)
);

INSERT INTO users VALUES(1, 'customer', 'No');
INSERT INTO users VALUES(2, 'customer', 'Yes');
INSERT INTO users VALUES(3, 'customer', 'No');
INSERT INTO users VALUES(4, 'vendor', 'No');
INSERT INTO users VALUES(5, 'vendor', 'Yes');
INSERT INTO users VALUES(6, 'customer', 'No');
INSERT INTO users VALUES(7, 'vendor', 'No');
INSERT INTO users VALUES(8, 'customer', 'No');
INSERT INTO users VALUES(9, 'customer', 'Yes');

SELECT * FROM users;

DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders(
id INTEGER,
customer_id INTEGER,
vendor_id INTEGER,
status VARCHAR(255),
ordered_at DATE
);

INSERT INTO orders VALUES(101, 1, 4, 'delivered', '2024-01-01');
INSERT INTO orders VALUES(102, 2, 4, 'rejected_by_vendor', '2024-01-01');
INSERT INTO orders VALUES(103, 3, 4, 'rejected_by_customer', '2024-01-01');
INSERT INTO orders VALUES(104, 3, 5, 'delivered', '2024-01-01');
INSERT INTO orders VALUES(105, 6, 7, 'delivered', '2024-01-02');
INSERT INTO orders VALUES(106, 8, 4, 'delivered', '2024-01-02');
INSERT INTO orders VALUES(107, 1, 4, 'rejected_by_customer', '2024-01-03');
INSERT INTO orders VALUES(108, 3, 4, 'delivered', '2024-01-03');
INSERT INTO orders VALUES(109, 6, 7, 'rejected_by_vendor', '2024-01-04');
INSERT INTO orders VALUES(110, 6, 7, 'rejected_by_customer', '2024-01-04');
INSERT INTO orders VALUES(111, 1, 4, 'delivered', '2024-01-04');
INSERT INTO orders VALUES(112, 8, 7, 'delivered', '2024-01-04');
INSERT INTO orders VALUES(113, 1, 4, 'delivered', '2024-01-05');
INSERT INTO orders VALUES(114, 1, 4, 'rejected_by_customer', '2024-01-05');
INSERT INTO orders VALUES(115, 2, 4, 'rejected_by_vendor', '2024-01-05');

SELECT * FROM orders;

WITH cte1 AS
(
SELECT o1.ordered_at, COUNT(o1.id) AS orderCount
FROM orders o1 LEFT OUTER JOIN users u1 ON o1.customer_id = u1.user_id
WHERE u1.banned = 'No'
GROUP BY o1.ordered_at
),
cte2 AS 
(
SELECT o2.ordered_at, COUNT(o2.id) AS orderCountRejected
FROM orders o2 LEFT OUTER JOIN users u2 ON o2.customer_id = u2.user_id
WHERE u2.banned = 'No' AND LEFT(o2.status, 1) = 'r'
GROUP BY o2.ordered_at
)
SELECT cte1.ordered_at, COALESCE(ROUND(cte2.orderCountRejected / cte1.orderCount, 2), 0) AS rejection_rate
FROM cte1 LEFT OUTER JOIN cte2 on cte1.ordered_at = cte2.ordered_at
ORDER BY cte1.ordered_at ASC;










