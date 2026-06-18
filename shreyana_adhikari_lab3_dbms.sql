CREATE database if not exists my_db;
USE my_db;
SELECT firstName AS "First Name", lastName AS "Last Name"
FROM employees;
SELECT CONCAT(firstName, ' ', lastName) AS "Full Name"
FROM employees;
SELECT *
FROM employees
ORDER BY firstName DESC;
SELECT COUNT(*) AS "Total Numer of Employees"
FROM employees;
SELECT DISTINCT jobTitle
FROM employees;
SELECT productName, productLine, productDescription, quantityInStock
FROM products
WHERE quantityInStock = (SELECT MAX(quantityInStock) FROM products);
SELECT customerName AS "Name of Customer",
       CONCAT(contactFirstName, ' ', contactLastName) AS "Contact Person",
       city,
       country
FROM customers
WHERE city IN ('Nantes', 'Las Vegas', 'Madrid');
SELECT DISTINCT productLine
FROM products;
SELECT SUM(quantityInStock) AS "Total Stock - Motorcycles"
FROM products
WHERE productLine = 'Motorcycles';
SELECT orderNumber, orderDate, customerNumber
FROM orders
WHERE status = 'In Process';

