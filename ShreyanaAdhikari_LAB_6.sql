use my_db;
CREATE VIEW employee_office_view AS
SELECT CONCAT(e.firstName, ' ', e.lastName) AS "Full Name",
       e.email AS "Email",
       o.city AS "Office City"
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;


SELECT * FROM employee_office_view;

CREATE VIEW customer_order_view AS
SELECT c.customerNumber AS "Customer Number",
       c.customerName AS "Customer Name",
       CONCAT(c.contactFirstName, ' ', c.contactLastName) AS "Contact Name",
       o.orderNumber AS "Order Number",
       o.status AS "Order Status",
       SUM(od.quantityOrdered * od.priceEach) AS "Total Amount"
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName,
         c.contactFirstName, c.contactLastName,
         o.orderNumber, o.status;


SELECT * FROM customer_order_view;

CREATE VIEW customer_product_view AS
SELECT c.customerName AS "Customer Name",
       c.city AS "Customer City",
       p.productName AS "Product Name",
       od.quantityOrdered AS "Quantity Ordered"
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;


SELECT * FROM customer_product_view;

CREATE VIEW customer_payment_view AS
SELECT c.customerNumber AS "Customer Number",
       c.customerName AS "Customer Name",
       SUM(p.amount) AS "Total Amount Paid"
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName;


SELECT * FROM customer_payment_view;

CREATE VIEW nyc_customer_products_view AS
SELECT DISTINCT p.productCode,
                p.productName,
                p.productLine,
                p.productScale,
                p.productVendor,
                p.quantityInStock,
                p.buyPrice,
                p.MSRP
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.city = 'NYC';


SELECT * FROM nyc_customer_products_view;

CREATE OR REPLACE VIEW employee_office_view AS
SELECT CONCAT(e.firstName, ' ', e.lastName) AS "Full Name",
       e.email AS "Email",
       e.jobTitle AS "Job Title",
       o.city AS "Office City"
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;


SELECT * FROM employee_office_view;

CREATE OR REPLACE VIEW nyc_customer_products_view AS
SELECT DISTINCT p.productCode,
                p.productName,
                p.productLine,
                p.productScale,
                p.productVendor,
                p.quantityInStock,
                p.buyPrice,
                p.MSRP
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.city IN ('Las Vegas', 'San Francisco');


SELECT * FROM nyc_customer_products_view;

SELECT c.city AS "City",
       SUM(cpv.`Total Amount Paid`) AS "Total Amount Paid By City"
FROM customer_payment_view cpv
JOIN customers c ON cpv.`Customer Number` = c.customerNumber
GROUP BY c.city
ORDER BY SUM(cpv.`Total Amount Paid`) DESC;