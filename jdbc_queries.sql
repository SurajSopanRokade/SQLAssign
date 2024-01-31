--  show employees with highest salary
SELECT MAX(salary)
FROM employees;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary IN (SELECT MAX(salary)
FROM employees);

--  show employees with lowest salary
SELECT MIN(salary)
FROM employees;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary IN (SELECT MIN(salary)
FROM employees);

--  list employees who start with name 'A'
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'A%';

--  show employees who are hired in 2017
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE YEAR(hire_date)='1987';

-- list department which has highest no of employees
SELECT department_id, COUNT(employee_id)
FROM employees
GROUP BY department_id
ORDER BY COUNT(employee_id) DESC LIMIT 1;

--  show top 3 list of managers who has maximum no of employees under them
SELECT department_id, COUNT(employee_id)
FROM employees
GROUP BY department_id
ORDER BY COUNT(employee_id) DESC LIMIT 1;