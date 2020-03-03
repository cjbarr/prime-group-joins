-- Get all customers and their addresses.

SELECT * FROM customers JOIN addresses ON customers.id = addresses.customer_id;

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM orders JOIN line_items ON orders.id = line_items.order_id JOIN products ON line_items.product_id = products.id;
-- Which warehouses have cheetos?
SELECT warehouse_id FROM warehouse_product WHERE product_id = 5;

-- Which warehouses have diet pepsi?

SELECT warehouse_id FROM warehouse_product WHERE product_id = 6;

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, last_name, count(orders.id)
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id 
JOIN orders
ON addresses.id = orders.address_id
GROUP BY customers.first_name, customers.last_name
;

-- How many customers do we have?
SELECT COUNT(*) FROM customers;

-- How many products do we carry?

SELECT COUNT(*) FROM products;
-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product WHERE product_id = 6 ;

-- Stretch
-- How much was the total cost for each order?

-- How much has each customer spent in total?
-- How much has each customer spent in total? Customers who have spent $0 should still


CREATE TABLE person (
id SERIAL PRIMARY KEY,
name varchar(25)
);

INSERT INTO person (name) VALUES ('Corey'), ('Casie'), ('Jessie'), ('Megan'),('Shawn');


SELECT * FROM person;

CREATE TABLE hobby (
id SERIAL PRIMARY KEY,
description varchar(100)
);

INSERT INTO hobby (description) VALUES ('Piano'), ('Soccer'), ('Hula'), ('Skiing'), ('Computers');

SELECT * FROM hobby;


CREATE TABLE person_hobby (
id SERIAL PRIMARY KEY,
person_id INT REFERENCES person,
hobby_id INT REFERENCES hobby,
skill INT
);

INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill") VALUES (5, 2, 3), (5, 3, 2), (5, 5, 5),
(4, 4, 2), (4, 5, 2), (2, 3, 1), (2, 1, 3),
(3, 2, 2), (3, 1, 1), (3, 4, 3), (1, 1, 2);

SELECT * FROM person_hobby;

SELECT id as personHobby_id FROM person_hobby;


SELECT * FROM person
JOIN person_hobby
ON person.id = person_hobby.person_id
JOIN hobby 
ON hobby.id = person_hobby.hobby_id
WHERE person.id = 3;

SELECT hobby.description, person_hobby.skill FROM hobby JOIN person_hobby ON hobby.id = person_hobby.hobby_id WHERE person_hobby.person_id = 3;
