/*1. Write a query to find the names (first_name, last_name) and the salaries of 
the employees who have a higher salary than the employee whose 
last_name='Bull'.
*/
SELECT salary 
FROM employees
WHERE last_name='Bull';
SELECT *
FROM employees
WHERE salary>(SELECT salary
FROM employees
WHERE last_name='Bull');

/*2. Write a query to find the names (first_name, last_name) of all employees 
who works in the IT department.
*/
SELECT department_id 
FROM departments
WHERE DEPARTMENT_NAME='IT';
SELECT first_name, last_name
FROM employees
WHERE department_id=(SELECT department_id 
FROM departments
WHERE DEPARTMENT_NAME='IT');

/*3. Write a query to find the names (first_name, last_name) of the employees who 
have a manager and work for a department based in the United States.
Hint : Write single-row and multiple-row subqueries
*/
SELECT DISTINCT location_id
FROM locations
WHERE country_id='US';

SELECT department_id
FROM departments
WHERE location_id IN (SELECT location_id
FROM locations
WHERE country_id='US');

SELECT employee_id 
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE location_id IN (SELECT location_id
FROM locations
WHERE country_id='US'));

SELECT first_name, last_name
FROM employees
WHERE manager_id IN (SELECT employee_id 
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE location_id IN (SELECT location_id
FROM locations
WHERE country_id='US')));



/*3. Write a query to find the names (first_name, last_name) of the employees 
who are managers.
*/
SELECT DISTINCT manager_id 
FROM departments;

SELECT * 
FROM employees
WHERE employee_id IN (SELECT DISTINCT manager_id 
FROM departments);

/*4. Write a query to find the names (first_name, last_name), the salary of the 
employees whose salary is greater than the average salary.
*/
SELECT AVG(salary) FROM employees;
SELECT first_name, last_name
FROM employees
WHERE salary>(SELECT AVG(salary) FROM employees);

/*5. Write a query to find the names (first_name, last_name), the salary of the 
employees whose salary is equal to the minimum salary for their job 
grade.
*/
SELECT min_salary
FROM jobs;

SELECT first_name, last_name, salary
FROM employees
WHERE salary IN (SELECT min_salary
FROM jobs);

/*6. Write a query to find the names (first_name, last_name), the salary of the 
employees who earn more than the average salary and who works in any 
of the IT departments.
*/
SELECT * FROM testcoursedb.departments;
SELECT department_id 
FROM departments
WHERE DEPARTMENT_NAME='IT';

SELECT AVG(salary)
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE department_id IN (SELECT department_id 
FROM departments
WHERE DEPARTMENT_NAME='IT') AND salary >(SELECT AVG(salary)
FROM employees);

/*7. Write a query to find the names (first_name, last_name), the salary of the 
employees who earn more than Mr. Bell.
*/
SELECT salary
FROM employees
WHERE last_name='Bell';

SELECT first_name, last_name
FROM employees
WHERE salary>(SELECT salary
FROM employees
WHERE last_name='Bell');

/*8. Write a query to find the names (first_name, last_name), the salary of the 
employees who earn the same salary as the minimum salary for all 
departments.
*/
SELECT MIN(salary) FROM employees;

SELECT first_name, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees);

-- OR
SELECT department_id FROM departments;

SELECT department_id ,MIN(salary)
FROM employees
GROUP BY department_id;

SELECT first_name, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary)
FROM employees
GROUP BY department_id);

/*9. Write a query to find the names (first_name, last_name), the salary of the 
employees whose salary greater than the average salary of all 
departments.
*/
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT AVG(salary)
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE salary>(SELECT AVG(salary)
FROM employees);

/*10. Write a query to find the names (first_name, last_name) and salary 
of the employees who earn a salary that is higher than the salary of all the 
Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of 
the lowest to highest.
*/
SELECT max_salary
FROM jobs
WHERE job_id='sh_clerk';

SELECT first_name, last_name, salary
FROM employees
WHERE salary >(SELECT max_salary
FROM jobs
WHERE job_id='sh_clerk')
ORDER BY salary ASC;

/*11. Write a query to find the names (first_name, last_name) of the 
employees who are not supervisors.
*/
SELECT DISTINCT manager_id 
FROM departments;

SELECT * 
FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT manager_id 
FROM departments);

/*12. Write a query to display the employee ID, first name, last names, 
and department names of all employees.
*/
SELECT employee_id, first_name, last_name,(SELECT department_name  FROM departments d WHERE e.department_id=d.department_id)
FROM employees e
ORDER BY department_id;

SELECT employee_id, first_name, last_name, 
(SELECT department_name FROM departments d
 WHERE e.department_id = d.department_id) department 
 FROM employees e ORDER BY department;

/*13. Write a query to display the employee ID, first name, last names, 
salary of all employees whose salary is above average for their 
departments.
*/
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT employee_id, first_name, last_name, salary
FROM employees e
WHERE salary>(SELECT AVG(salary) FROM employees d WHERE e.DEPARTMENT_ID=d.DEPARTMENT_ID);

SELECT first_name, last_name
FROM employees AS A
WHERE salary >(SELECT AVG(salary)
FROM employees
WHERE department_id=A.department_id);


/*14. Write a query to fetch even numbered records from employees 
table.
*/
SELECT *
FROM employees
WHERE employee_id%2=0
ORDER BY employee_id ASC;



/*15. Write a query to find the 5th maximum salary in the employees 
table.
*/
SELECT DISTINCT salary
FROM employees e1
WHERE 5=(SELECT COUNT(DISTINCT salary) FROM employees e2 WHERE e2.salary>=e1.salary);

SELECT salary, employee_id
FROM employees
ORDER BY salary DESC
LIMIT 4,1;

/*16. Write a query to find the 4th minimum salary in the employees table.
*/

SELECT DISTINCT salary
FROM employees e1
WHERE 3=(SELECT COUNT(DISTINCT salary) FROM employees e2 WHERE e2.salary<=e1.salary);

SELECT salary, employee_id
FROM employees
ORDER BY salary ASC 
LIMIT 3,1;

/*17. Write a query to select last 10 records from a table.
*/

SELECT *
FROM employees
ORDER BY employee_id DESC 
LIMIT 10;

/*18. Write a query to list department number, name for all the 
departments in which there are no employees in the department.
*/
SELECT Distinct department_id
FROM employees;

SELECT department_id, department_name
FROM departments
WHERE department_id NOT IN (SELECT DISTINCT department_id
FROM employees);


/*19. Write a query to get 3 maximum salaries.
*/
SELECT salary, employee_id
FROM employees
ORDER BY salary DESC
LIMIT 3;

/*20. Write a query to get 3 minimum salaries.
*/
SELECT salary, employee_id
FROM employees
ORDER BY salary ASC 
LIMIT 3;

/*21. Write a query to get nth max salaries of employees.
*/
SELECT salary, employee_id
FROM employees
ORDER BY salary DESC 
-- LIMIT (n-1), 1;
