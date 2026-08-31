-- JOINS, SUBQUERIES AND VIEWS
CREATE DATABASE Joins;
USE Joins;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers
VALUES
(1, "ALICE", "MUMBAI"),
(2, "BOB", "DELHI"),
(3, "CHARLIE", "BANGLORE"),
(4, "DAVID", "MUMBAI");

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO orders 
VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers;
SELECT * FROM orders;

-- INNER JOIN
SELECT * 
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT * 
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;

-- FULL JOIN / OUTER JOIN
SELECT * FROM customers as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id
UNION
SELECT * FROM customers as c
RIGHT JOIN orders as o
ON c.customer_id = o.customer_id;

-- CROSS JOIN
SELECT * 
FROM customers 
CROSS JOIN orders;

-- SELF JOIN
SELECT * 
FROM customers as c
JOIN customers as s
ON c.customer_id = s.customer_id;

-- LEFT EXCLUSIVE JOIN
SELECT * FROM customers as c LEFT JOIN orders as o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- RIGHT EXCLUSIVE JOIN
SELECT * FROM customers as c RIGHT JOIN orders as o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- SUBQUERIES

SELECT * FROM customers;
SELECT * FROM orders;

-- print orders having amount greater than avg(amount)
SELECT * FROM orders 
WHERE amount > (
	SELECT AVG(amount)
    FROM orders
);

-- print count of orders by each customer
SELECT name, (
	SELECT COUNT(*)
    FROM orders as o
    WHERE o.customer_id = c.customer_id
) as order_count
FROM customers as c;

-- print avg spending of each customer
SELECT
summary.customer_id,
summary.avg_amount
FROM
(
	SELECT
		customer_id, AVG(amount) AS avg_amount
		FROM orders
    GROUP BY customer_id
) AS summary;

-- VIEWS
CREATE VIEW view1 AS
SELECT customer_id, name FROM customers;

SELECT * FROM view1;

SELECT * FROM view1 WHERE name = "ALICE";

CREATE VIEW view2 AS
SELECT c.customer_id, c.name, o.order_id
FROM customers as c
INNER JOIN orders as o
ON c.customer_id = o.customer_id;

SELECT * FROM view2; 

DROP VIEW view1;
DROP VIEW view2;
DROP TABLE customers;
DROP TABLE orders;
DROP DATABASE Joins;