CREATE DATABASE AGGREGATEFUNCTIONSASSIGN; 
-- 1. Write a query to list the number of jobs available in the employees table
SELECT COUNT(DISTINCT JOB_ID)
FROM employees;

-- 2. Write a query to get the total salaries payable to employees.
SELECT SUM(salary) AS TOTALPAYABLE
FROM employees;

-- 3. Write a query to get the minimum salary from employees table
SELECT MIN(salary) AS MINIMUM
FROM employees;

-- 4. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT job_id ,MAX(salary)
FROM employees
WHERE job_id='it_prog';

-- 5. Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(salary), COUNT(*)
FROM employees
WHERE department_id=90;

-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(SALARY) AS MAX, MIN(SALARY) AS MIN, SUM(SALARY) AS SUM ,AVG(SALARY) AS AVG
FROM employees;

-- 7. Write a query to get the number of employees with the same job.
SELECT job_id , COUNT(job_id) AS EMPLOYEES
FROM employees
group by job_id;

-- 8. Write a query to get the difference between the highest and lowest salaries.
SELECT  MAX(salary) - MIN(salary) AS DIFFERENCE 
FROM employees;

-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT manager_id, first_name , MIN(salary)
FROM employees
GROUP BY manager_id;

-- 10. Write a query to get the department ID and the total salary payable in each department
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

-- 11. Write a query to get the average salary for each job ID excluding programmer
SELECT job_id , AVG(salary)
FROM employees
where job_id !='it_Prog'
GROUP BY job_id;

-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department
-- ID 90 only.
SELECT job_id , AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
where department_id=90
GROUP BY job_id;

-- 13. Write a query to get the job ID and maximum salary of the 
-- employees where maximum salary is greater than or equal to $4000.
SELECT job_id
FROM jobs
WHERE MAX_SALARY >='4000';

SELECT job_id, salary
FROM employees
WHERE job_id IN (SELECT job_id FROM employees);

-- 14. Write a query to get the average salary for all departments 
-- employing more than 10 employees.
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>10;