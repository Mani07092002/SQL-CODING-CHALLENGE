CREATE DATABASE Ecommerce;
go
use Ecommerce
go
---------------------------Ecommerce-------------------------------------------
CREATE TABLE customers (
    customer_id Numeric(3) PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id Numeric(3) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    Description VARCHAR(50),
    stockQuantity Numeric(3) NOT NULL
);


CREATE TABLE cart (
    cart_id Numeric(3) PRIMARY KEY,
    customer_id Numeric(3),
    product_id Numeric(3),
    quantity Numeric(3)
);

CREATE TABLE orders (
    orderID Numeric(3) PRIMARY KEY,
    customer_id Numeric(3),
    orderDate DATE,
    totalAmount DECIMAL(10, 2)
);

CREATE TABLE order_items (
    orderItemID Numeric(3) PRIMARY KEY,
    orderID Numeric(3),
    product_id Numeric(3),
    quantity Numeric(3),
    itemAmount DECIMAL(10, 2)
);

ALTER TABLE cart
ADD CONSTRAINT fk_customer_cart
FOREIGN KEY (customer_id) REFERENCES customers(customer_Id);

ALTER TABLE cart
ADD CONSTRAINT fk_product_cart
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE orders
ADD CONSTRAINT fk_customer_orders
FOREIGN KEY (customer_id) REFERENCES customers(customer_ID);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_order_items
FOREIGN KEY (orderID) REFERENCES orders(orderID);

ALTER TABLE order_items
ADD CONSTRAINT fk_product_order_items
FOREIGN KEY (product_id) REFERENCES products(product_id);
INSERT INTO customers (customer_id, firstName, lastName, email, address)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St, City'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '456 Elm St, Town'),
(3, 'Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5, 'David', 'Lee', 'david@example.com', '234 Cedar St, District'),
(6, 'Laura', 'Hall', 'laura@example.com', '567 Birch St, County'),
(7, 'Michael', 'Davis', 'michael@example.com', '890 Maple St, State'),
(8, 'Emma', 'Wilson', 'emma@example.com', '321 Redwood St, Country'),
(9, 'William', 'Taylor', 'william@example.com', '432 Spruce St, Province'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '765 Fir St, Territory');
select * from customers
INSERT INTO products (product_id, name, description, price, stockQuantity)
VALUES
(1, 'Laptop', 'High-performance laptop', 800.00, 10),
(2, 'Smartphone', 'Latest smartphone', 600.00, 15),
(3, 'Tablet', 'Portable tablet', 300.00, 20),
(4, 'Headphones', 'Noise-canceling', 150.00, 30),
(5, 'TV', '4K Smart TV', 900.00, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
(7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
(9, 'Blender', 'High-speed blender', 70.00, 20),
(10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

select * from products

INSERT INTO cart (cart_id, customer_id, product_id, quantity)
VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

INSERT INTO orders (orderID, customer_id, orderDate, totalAmount)
VALUES
(1, 1, '2023-01-05', 1200.00),
(2, 2, '2023-02-10', 900.00),
(3, 3, '2023-03-15', 300.00),
(4, 4, '2023-04-20', 150.00),
(5, 5, '2023-05-25', 1800.00),
(6, 6, '2023-06-30', 400.00),
(7, 7, '2023-07-05', 700.00),
(8, 8, '2023-08-10', 160.00),
(9, 9, '2023-09-15', 140.00),
(10, 10, '2023-10-20', 1400.00);
INSERT INTO order_items (orderItemID, orderID, product_id, quantity, itemAmount)
VALUES
(1, 1, 1, 2, 1600.00),
(2, 1, 3, 1, 300.00),
(3, 2, 2, 3, 1800.00),
(4, 3, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);

select * from products
1)UPDATE products
SET price = 800.00
WHERE name = 'Refrigerator';

2)DELETE FROM cart
WHERE customer_id = 1;

select * from cart
3)
SELECT *
FROM products
WHERE price < 100.00;
4)
SELECT *
FROM products
WHERE stockQuantity > 5;

5)SELECT *
FROM orders
WHERE totalAmount BETWEEN 500.00 AND 1000.00;

6)
SELECT *
FROM products
WHERE name LIKE '%r';

7)
SELECT *
FROM cart
WHERE customer_id = 5;

8)
SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.orderDate) = 2023;

9)
SELECT product_id, name, MIN(stockQuantity) AS minimumStockQuantity
FROM products
GROUP BY product_id, name;

10)
SELECT c.customer_id, c.firstName, c.lastName, SUM(o.totalAmount) AS totalSpent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName;

11)SELECT c.customer_id, c.firstName, c.lastName, AVG(o.totalAmount) AS averageOrderAmount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName;

12)
SELECT c.customer_id, c.firstName, c.lastName, COUNT(o.orderID) AS numberOfOrders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName;
13)
SELECT c.customer_id, c.firstName, c.lastName, MAX(o.totalAmount) AS maximumOrderAmount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName;

14)SELECT c.customer_id, c.firstName, c.lastName, SUM(o.totalAmount) AS totalSpent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName
HAVING SUM(o.totalAmount) > 1000;

15)
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM cart
);

16)
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

17)
SELECT p.product_id, p.name,
       (SUM(oi.itemAmount) / (SELECT SUM(itemAmount) FROM order_items) * 100) AS revenuePercentage
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;

18)
SELECT *
FROM products
WHERE stockQuantity < (
    SELECT AVG(stockQuantity)
    FROM products
);


19)
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE totalAmount > 1000 ----Assume Above 1000 as HighValue
);