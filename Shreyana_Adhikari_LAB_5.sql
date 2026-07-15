create database my_db;
use my_db;
Select distinct p.productName, p.productVendor
from products p
join orderdetails od on p.productCode = od.productCode
join orders o on od.orderNumber = o.orderNumber
where o.customerNumber = 103;

select distinct c.customerName, o.orderDate, o.status
from customers c
join orders o on c.customerNumber = o.customerNumber
where o.orderDate between '2003-10-01' and '2003-10-30' 
and o.status = 'shipped';

SELECT DISTINCT c.customerName, c.creditLimit
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IN (10128, 10130, 10136, 10137);

SELECT e.firstName, e.lastName, e.jobTitle
FROM employees e
JOIN offices of ON e.officeCode = of.officeCode
WHERE of.city = 'Sydney';

SELECT DISTINCT p.*
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.contactFirstName = 'Diego'
AND c.contactLastName = 'Freyre';

SELECT e.firstName, e.lastName, e.email
FROM employees e
JOIN offices of ON e.officeCode = of.officeCode
WHERE of.city = 'San Francisco';

SELECT e.firstName, e.lastName, e.jobTitle, e.email
FROM employees e
WHERE e.reportsTo = (
    SELECT employeeNumber
    FROM employees
    WHERE firstName = 'Diane'
    AND lastName = 'Murphy'
);

SELECT p.productName, p.productLine
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
WHERE od.orderNumber = 10100;

SELECT c.customerName, SUM(pay.amount) AS "Total Purchase"
FROM customers c
JOIN payments pay ON c.customerNumber = pay.customerNumber
GROUP BY c.customerNumber, c.customerName
HAVING SUM(pay.amount) > 5000;

SELECT DISTINCT c.customerName
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE p.productName = '1939 Cadillac Limousine';






