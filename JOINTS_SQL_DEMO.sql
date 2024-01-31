-- INNER JOINT
-- find order along with its details
SELECT * FROM classicmodels.orderdetails;
SELECT * FROM classicmodels.orders;
SELECT o.orderNumber, productCode, quantityOrdered, priceEach, orderDate, status, customerNumber
FROM orders o
-- INNER JOIN orderDetails USING (orderNumber);
-- or
INNER JOIN orderDetails ON o.orderNumber=orderdetails.orderNumber;

-- LEFT JOINT
-- find all countries info along with location info
SELECT c.country_id, c.country_name, l.country_id,city
FROM countries c
LEFT JOIN locations l ON c.country_id=l.country_id;

-- find country that does not have locations in the locations
SELECT c.country_id, c.country_name, l.country_id,city
FROM countries c
LEFT JOIN locations l ON c.country_id=l.country_id
WHERE l.country_id IS NULL;

-- SELF JOINT
SELECT e.employeeNumber, CONCAT(e.firstname,' ',e.lastname)
AS 'employee', e.reportsTo AS 'ManagerNumber',
CONCAT(m.firstname,' ',m.lastname) AS 'Manager'
FROM employees e
INNER JOIN employees m
ON e.reportsTo=m.employeeNumber;

-- RIGHT JOINT
-- Find all employee number and customer number where employee work as salesrepnumber
SELECT employeeNumber, customernumber
FROM customers
RIGHT JOIN employees
ON salesRepEmployeeNumber=employeeNumber
ORDER BY employeeNumber;

SELECT r.region_name, c.country_name, l.street_address, l.city
FROM regions r
LEFT JOIN countries c ON c.REGION_ID = r.REGION_ID
LEFT JOIN locations l ON l.COUNTRY_ID=c.COUNTRY_ID
WHERE C.COUNTRY_ID IN ('US','UK','CN');


