USE my_db;
SELECT *
FROM employees
WHERE extension LIKE 'x2%'
AND employeeNumber BETWEEN 1200 AND 1500;
SELECT productLine, SUM(quantityInStock) AS "Total Quantity In Stock"
FROM products
GROUP BY productLine;
SELECT status, COUNT(*) AS "Total Orders"
FROM orders
WHERE status IN ('Cancelled', 'Disputed', 'In Process', 'On Hold')
GROUP BY status;
SELECT jobTitle, COUNT(*) AS "Number of Employees"
FROM employees
GROUP BY jobTitle;
SELECT customerNumber, SUM(amount) AS "Total Payment"
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 200000;
SELECT city, COUNT(*) AS "Number of Customers"
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;
SELECT country, COUNT(*) AS "Number of Customers"
FROM customers
GROUP BY country
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;
SELECT customerNumber, COUNT(*) AS "Total Shipped Orders"
FROM orders
WHERE status = 'Shipped'
GROUP BY customerNumber
HAVING COUNT(*) > 5;