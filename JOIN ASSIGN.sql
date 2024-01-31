-- 1. Write a query to find the addresses (location_id, street_address, city, 
-- state_province, country_name) of all the departments.
SELECT d. department_name,c.COUNTRY_NAME, d.location_id, street_address, city, state_province
FROM departments d
LEFT JOIN locations l USING (location_id)
LEFT JOIN countries c USING (COUNTRY_ID)
WHERE d.LOCATION_ID=l.LOCATION_ID;

-- 2. Write a query to find the names (first_name, last name), department ID 
-- and name of all the employees.
SELECT first_name, last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON (d.department_id= e.department_id);

-- 3. Find the names (first_name, last_name), job, department number, and 
-- department name of the employees who work in London.
SELECT first_name, last_name, job_id, d.department_id, department_name
FROM employees e
INNER JOIN departments d USING (department_id)
INNER JOIN locations l USING (LOCATION_ID)
WHERE city='London';

-- 4. Write a query to find the employee id, name (last_name) along with their 
-- manager_id, manager name (last_name).
SELECT e.employee_id, e.last_name AS 'elast_name', l.employee_id, l.last_name 
FROM employees e
INNER JOIN employees l ON (e.employee_id=l.manager_id);

-- 5. Find the names (first_name, last_name) and hire date of the employees 
-- who were hired after 'Jones'
SELECT hire_date
FROM employees
WHERE last_name='jones';

SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE(hire_date)>(SELECT hire_date
FROM employees
WHERE last_name='jones');

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
INNER JOIN employees e1 ON (e1.last_name='jones')
WHERE e1.hire_date<e.hire_date;

-- 6. Write a query to get the department name and number of employees in the department.
SELECT department_name, COUNT(employee_id)
FROM departments e
LEFT JOIN employees d USING (DEPARTMENT_ID)
GROUP BY Department_id;

-- 7. Find the employee ID, job title, number of days between ending date and 
-- starting date for all jobs in department 90 from job history
SELECT j.employee_id,e.job_title,datediff(j.end_date,j.start_date)   
FROM job_history j 
INNER JOIN jobs e USING(job_id)
WHERE j.department_id=90;

-- 8. Write a query to display the department ID, department name and 
-- manager first name.
SELECT d.department_id, department_name, e.first_name AS 'managername'
FROM departments d
LEFT JOIN employees e ON (e.employee_id=d.manager_id);

-- 9. Write a query to display the department name, manager name, and city.
SELECT department_name, first_name, city
FROM departments d
LEFT JOIN employees e ON (e.employee_id=d.manager_id)
LEFT JOIN locations l ON (d.location_id=l.location_id);

-- 10. Write a query to display the job title and average salary of employees.
SELECT ROUND(AVG(salary),2), job_title
FROM employees e
INNER JOIN jobs j ON (e.job_id=j.job_id)
GROUP BY job_title;

-- 11. Display job title, employee name, and the difference between salary 
-- of the employee and minimum salary for the job.
SELECT job_title, first_name, (e.salary-j.min_salary)
FROM employees e
LEFT JOIN jobs j ON (e.job_id=j.job_id);

-- 12. Write a query to display the job history that were done by any 
-- employee who is currently drawing more than 10000 of salary
SELECT j.*
FROM job_history j
INNER JOIN employees e ON (e.employee_id=j.employee_id)
WHERE e.salary>10000;

-- 13. Write a query to display department name, name (first_name, 
-- last_name), hire date, salary of the manager for all managers whose 
-- experience is more than 15 years.
SELECT department_name, first_name, last_name, e.hire_date, salary
FROM employees e
LEFT JOIN departments d ON (e.employee_id=d.manager_id)
WHERE datediff(current_date(),e.hire_date)>15*365;

 -- ------------------------------------------------------------------------------------------------------
-- 1>	Write a query to select employee with the highest salary
SELECT MAX(salary)
FROM employees;

SELECT * 
FROM employees e
INNER JOIN employees e1 ON (e1.salary=(SELECT MAX(salary)
FROM employees))
WHERE e.salary=e1.salary;

-- 2>	Select employee with the second highest salary
SELECT *
FROM employees e
ORDER BY salary DESC LIMIT 1,1;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT * , MAX(e1.salary)
FROM employees e1
RIGHT JOIN employees e2 ON (e2.salary<(SELECT MAX(salary)
FROM employees));

-- 3>	Write a query to select employees and their corresponding managers and their salaries
SELECT e.first_name AS 'employee', e.salary, e1.first_name AS 'managers', e1.salary
FROM employees e
INNER JOIN employees e1 ON (e.manager_id=e1.employee_id);
 
-- 4>	Write a query to show count of employees under each manager in descending order
SELECT e.manager_id, COUNT(employee_id) AS NO_OF_EMP
FROM employees e
LEFT JOIN departments d ON (d.manager_id=e.employee_id)
GROUP BY e.manager_id
ORDER BY NO_OF_EMP DESC;

SELECT e.first_name, e.last_name, COUNT(e.employee_id) AS no_of_emp
FROM employees e
RIGHT JOIN employees e1 ON (e.employee_id=e1.manager_id)
GROUP BY e.employee_id
ORDER BY no_of_emp DESC;

-- 5>	Find the count of employees in each department
SELECT e.department_id, COUNT(e.employee_id)
FROM employees e
RIGHT JOIN departments e1 ON (e.department_id=e1.department_id)
GROUP BY e.department_id;

-- 6>	Get the count of employees hired year wise
SELECT YEAR(e.hire_date), COUNT(e.employee_id)
FROM employees e
INNER JOIN employees e1 ON (e.employee_id=e1.employee_id)
GROUP BY year(e.hire_date);

-- 7>	Select the employees whose first_name contains “an”
SELECT e.first_name
FROM employees e
INNER JOIN employees e1 ON (e.employee_id=e1.employee_id)
WHERE e1.first_name LIKE '%an%';

-- 8>	Find the employees who joined in August, 1987.
SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
FROM employees e
INNER JOIN employees e1 ON (e.employee_id=e1.employee_id)
WHERE MONTH(e1.hire_date)=8 AND YEAR(e1.hire_date)='1987';

-- 9>	Write an SQL query to display employees who earn more than the average salary in that company
SELECT e.employee_id, e.first_name, e.salary
FROM employees e
INNER JOIN employees e1 ON (e1.employee_id=e.employee_id)
WHERE e1.salary>(SELECT AVG(salary) FROM employees);

-- 10>	Find the maximum salary from each department.
SELECT d.department_id, MAX(salary)
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
GROUP BY e.department_id;

-- 11>	Write a query to make deptid foreign key in employee table.

-- 12>	Write a query to insert multiple rows in both tables using one insert command.

-- 13>	Write a query to show employee names and department names for each employee. 
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON (e.department_id=d.department_id);

-- 14>	Show name of city where ‘Bruce’ is working.
SELECT e.first_name, l.city, d.location_id
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
WHERE e.first_name='Bruce';

-- 15>	Write a query to show name of city and number of employees working in that city.
SELECT l.city, COUNT(employee_id)
FROM employees e
INNER JOIN departments d ON (d.department_id=e.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
GROUP BY l.city;

-- 16>	Show all employees who are working in HR department and having salary less than 5000
SELECT employee_id, first_name, d.department_name, salary
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
WHERE e.salary<50000 AND department_name='Executive';

-- 17>	Show employee having highest salary. 
SELECT e.employee_id, e.first_name, e.salary
FROM employees e
INNER JOIN employees e1 ON (e1.salary=(SELECT MAX(salary) FROM employees))
WHERE e1.salary=e.salary;

-- 18>	Show name of department along with number of employees working in that city.
SELECT d.department_name, COUNT(e.employee_id), l.city
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
GROUP BY department_name, city;

-- 19>	Show city wise number of employees
SELECT city, COUNT(employee_id) AS NO_OF_EMPS
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
GROUP BY city;

-- 20>	Show city name and total salary of employees working in that city.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT city, SUM(e.salary)
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
GROUP BY city;

-- ----------------------------------------------------------------------------------------------------
-- 1.	Write a query to make deptid foreign key in employee table.

-- 2.	Write a query to insert multiple rows in both tables using one insert command.

-- 3.	Write a query to show employee names and department names for each employee.

-- 11.	Show names of all employees working under ‘Nancy’
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
INNER JOIN employees e1 ON (e.manager_id=e1.employee_id)
WHERE e1.first_name='Nancy';

-- 12.	Show names of all employees working in same department as ‘Hermann’ 
SELECT e.employee_id, e.department_id, e.first_name, e.last_name
FROM employees e
INNER JOIN employees e1 ON (e1.department_id=e.department_id)
WHERE e1.first_name='Hermann';

-- 13.	Show all names of all employees having same salary as ‘David’
SELECT e.first_name, e.last_name, e.salary
FROM employees e
INNER JOIN employees e1 ON (e1.salary=e.salary)
WHERE e1.first_name='Nancy';

-- 14.	Delete data of all employees working in ‘ST_MAN’ department.
SELECT e.employee_id, e.job_id
FROM employees e
INNER JOIN employees e1 ON (e.employee_id=e1.employee_id)
WHERE e1.JOB_ID='ST_MAN';

-- 15.	Delete all employees whose salary is less than 5000 and working in ‘Sales’ department.
SELECT e.employee_id, e.first_name, e.salary, e.job_id
FROM employees e
INNER JOIN employees e1 ON (e.employee_id=e1.employee_id)
WHERE e1.salary<50000 AND e1.job_id='FI_ACCOUNT';

-- 16.	Increase salary of all employees working in ‘Mumbai’ city by 20%
SELECT e.employee_id, e.first_name, l.city
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
WHERE city='Seattle';

-- Change ‘Ramesh’s department to ‘IT’

-- 18.	Increase salary of all employees who are working under manager ‘Ramesh’
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
INNER JOIN employees e1 ON (e.manager_id=e1.employee_id)
WHERE e1.first_name='Nancy';

-- 19.Show names of all cities where any of the employee working in that city is having salary > 500000
SELECT e.employee_id, e.first_name, l.city, e.salary
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
WHERE e.salary>130000;

-- 20.	Show names of all cities where less than 10 employees are working.
SELECT city, count(e.employee_id)
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id)
GROUP BY city
HAVING count(e.employee_id)>10;