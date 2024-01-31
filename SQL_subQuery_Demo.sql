-- Subquery assignment
-- Find out all the employees who worked in the offices located in USA
SELECT * FROM classicmodels.offices;
SELECT officeCode 
FROM offices
WHERE country IN ('USA');

SELECT *
FROM employees 
WHERE officeCode IN (SELECT officeCode 
FROM offices
WHERE country IN ('USA'));

-- Write a query to find out customer who has highest payment
SELECT * FROM classicmodels.payments;
SELECT MAX(amount) FROM payments;

SELECT customerNumber
FROM payments
WHERE amount IN (SELECT MAX(amount) FROM payments);

SELECT *
FROM customers
WHERE customerNumber IN (SELECT customerNumber
FROM payments
WHERE amount IN (SELECT MAX(amount) FROM payments));

-- Find customers whose payments are greater than average payments
SELECT AVG (amount) from payments;
SELECT DISTINCT customerNumber 
FROM payments
WHERE amount > (SELECT AVG (amount) from payments);

SELECT *
FROM customers 
WHERE customerNumber IN (SELECT DISTINCT customerNumber 
FROM payments
WHERE amount > (SELECT AVG (amount) from payments));

-- Find a customers who have not placed any orders
SELECT * FROM classicmodels.orders;
SELECT Distinct customerNumber
FROM orders;

SELECT * 
FROM Customers 
WHERE customerNumber NOT IN (SELECT Distinct customerNumber
FROM orders);

-- Find maximum, minimum and average number of items in sales order
SELECT ordernumber, COUNT(ordernumber) AS ITEMS
FROM orderdetails
GROUP BY ordernumber ;

SELECT MAX(ITEMS), MIN(ITEMS), AVG(ITEMS)
FROM (SELECT ordernumber, COUNT(ordernumber) AS ITEMS
FROM orderdetails
GROUP BY ordernumber ) AS LINEITEMS;

-- Select the product whose buyprice are greater than average buyprice of all the product in each productline
SELECT productCode, productline, buyprice
FROM products p1
WHERE buyprice >(SELECT AVG(buyprice)
FROM products
WHERE productline=p1.productline);

