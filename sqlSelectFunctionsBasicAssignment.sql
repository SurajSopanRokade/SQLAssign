USE testcoursedb;
-- 1. Write a query to display the names (first_name, last_name) using alias name 
-- “First Name", "Last Name"
SELECT first_name AS "First Name",last_name AS "Last Name"
FROM employees;

-- 2. Write a query to get unique department ID from employee table.
SELECT DISTINCT dept_id
FROM employee;

-- 3. Write a query to get all employee details from the employee table order by first 
-- name, descending
SELECT *
FROM employees
ORDER BY
First_Name DESC;

-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the 
-- employees (PF is calculated as 12% of salary).
SELECT First_Name, Last_Name, SALARY, SALARY*0.12 AS "pf"
FROM employees;

-- 5. Write a query to get the employee ID, names (first_name, last_name), salary 
-- in ascending order of salary.
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY
salary DESC;

-- 6. Write a query to get the total salaries payable to employees
SELECT SUM(SALARY) AS "Payable salary"
FROM employees;

-- 7. Write a query to get the maximum and minimum salary from employees table
SELECT MAX(SALARY) AS "MAX SALARY", MIN(SALARY) AS "MIN SALARY"
FROM employees;

-- 8. Write a query to get the average salary and number of employees in the 
-- employees table
SELECT AVG(SALARY) AS "AVERAGE", count(DISTINCT EMPLOYEE_ID) AS "NUMBER OF EMPOYEES"
FROM employees;

-- 9. Write a query to get the number of employees working with the company.
SELECT COUNT(DISTINCT EMPLOYEE_ID)
FROM employees;

-- 10. Write a query to get the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JOB_ID)
FROM employees;

-- 11. Write a query get all first name from employees table in upper case.
SELECT UPPER(FIRST_NAME)
FROM employees;

-- 12. Write a query to get the first 3 characters of first name from employees table
SELECT SUBSTRING(FIRST_NAME,1,3)
FROM employees;

-- 13. Write a query to calculate 171*214+625.
SELECT 171*214+625;

-- 14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of 
-- all the employees from employees table.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS "FULL NAME"
FROM employees;

-- 15. Write a query to get first name from employees table after removing white 
-- spaces from both side.
SELECT TRIM(' ' FROM FIRST_NAME) AS "TRIM"
FROM employees;

-- 16. Write a query to get the length of the employee names (first_name, 
-- last_name) from employees table
SELECT LENGTH(FIRST_NAME) AS "FIRST_NAME", LENGTH(LAST_NAME) AS "LAST_NAME"
FROM employees;

-- 17. Write a query to check if the first_name fields of the employees table contains 
-- numbers.
SELECT * 
FROM employees
WHERE first_name REGEXP(1-9);

-- 18. Write a query to select first 10 records from a table.
SELECT *
FROM employees LIMIT 10;

-- 19. Write a query to get monthly salary (round 2 decimal places) of each and every employee
-- Note : Assume the salary field provides the 'annual salary' information.
SELECT ROUND(SALARY/12,2)
FROM employees;
