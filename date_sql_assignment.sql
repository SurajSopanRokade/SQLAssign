-- 1.	Find the names of employees hired in the last 3 months
SELECT first_name, last_name
FROM employees e
WHERE (datediff(current_date(),hire_date)/30)<3;

-- 2.	Retrieve employees hired on a specific date
SELECT employee_id, first_name, last_name
FROM employees
WHERE hire_date='1987-6-20';

-- 3.	Count the number of employees hired each year
SELECT year(hire_date), COUNT(employee_id)
FROM employees
GROUP BY year(hire_date);

-- 4.	List employees with birthdays in the next 30 days
SELECT employee_id, first_name, hire_date
FROM employees
WHERE adddate(hire_date, interval 37 YEAR) BETWEEN current_date() AND adddate(current_date(), interval 1 month);


-- 5.	Find employees who have been with the company for more than 5 years
SELECT employee_id, first_name, hire_date
FROM employees
WHERE year(hire_date)<(year(current_date())-5);


-- 6.	Calculate the average age of employees
SELECT AVG();

-- 7.	List employees with no hire date (potentially missing data)
SELECT employee_id, first_name
FROM employees
WHERE hire_date IS NULL;

-- 8.	Find the earliest and latest hire dates
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC LIMIT 1;

SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date ASC LIMIT 1;

-- 9.	Retrieve employees with the same birth date
SELECT   hire_date, COUNT(employee_id)
FROM employees 
GROUP BY HIRE_DATE;

-- 10.	List employees and their age in descending order
SELECT employee_id, first_name, datediff(current_date(),hire_date)/365 AS 'YEARS'
FROM employees
ORDER BY hire_date DESC;

-- 11.	Find employees hired in the current year
SELECT employee_id, first_name, hire_date
FROM employees
WHERE year(hire_date) = year(current_date());

-- 12.	Count the number of employees born in each month
SELECT month(hire_date), COUNT(employee_id)
FROM employees
GROUP BY month(hire_date);

-- 13.	List employees with a hire date and a birth date on the same day
SELECT birth_date
FROM employees;

SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date= (SELECT birth_date
FROM employees);

-- 14.	Find employees with a birth date in a specific range
SELECT employee_id, first_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1987-4-1' AND '1987-8-12'; 

-- 15.	Calculate the total number of years of experience for all employees
SELECT employee_id, first_name, last_name, datediff(current_date(),hire_date)/365 AS exp
FROM employees;

-- 16.	Find employees with an upcoming work anniversary within the next month
SELECT employee_id , first_name, last_name, hire_date
FROM employees 
WHERE adddate(hire_date, INTERVAL 37 year) BETWEEN current_date() AND adddate(current_date(), interval 1 month);

-- 17.	Retrieve employees who were born on a weekend (Saturday or Sunday)
SELECT *
FROM employees
WHERE dayofweek(hire_date) IN (1 OR 7);

-- 18.	List employees who have not celebrated their birthdays yet this year
SELECT employee_id, first_name, hire_date
FROM employees
WHERE adddate(hire_date, interval 37 year) BETWEEN current_date AND adddate(current_date(), interval 9 month);

-- 20.	Find employees with a hire date on a weekday (Monday to Friday)
SELECT *
FROM employees
WHERE dayofweek(hire_date) IN (2,6);