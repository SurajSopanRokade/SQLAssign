SELECT * FROM classicmodels.customers;
SELECT o.orderNumber, customername, c.customernumber, c.salesrepemployeenumber, phone, SUM(quantityordered*priceeach)
FROM orders o 
INNER JOIN orderdetails o1 ON (o.orderNumber=o1.orderNumber)
INNER JOIN customers c ON (c.customerNumber=o.customerNumber)
GROUP BY orderNumber;

SELECT o.orderNumber, customername, c.customernumber, c.salesrepemployeenumber, phone, SUM(quantityordered*priceeach)
FROM customers c 
INNER JOIN orders o ON (c.customerNumber=o.customerNumber)
INNER JOIN orderdetails o1 ON (o.orderNumber=o1.orderNumber)
GROUP BY orderNumber;

SELECT * FROM ordersdetailss;

-- create view for products whose buyprice are higher than avg price

SELECT AVG(buyPrice)
FROM products;

SELECT * 
FROM products 
WHERE buyprice>(SELECT AVG(buyPrice)
FROM products);

SELECT * FROM products_buy_price_more_than_avg;

SELECT customerName, COUNT(orderNumber)
FROM customers 
INNER JOIN orders USING (customerNumber)
GROUP BY customerName;

SELECT * FROM cust_name_order_count;
-- We can make changes in original table by using simple view
UPDATE simpleview
SET first_name='RAJ'
WHERE employee_id=1;

SELECT table_name, is_updatable
FROM information_schema.views
WHERE table_schema='testcoursedb';

