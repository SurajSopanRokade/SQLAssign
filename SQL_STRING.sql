/*1. Write a query to get the job_id and related employee's id.
Partial output of the query :
job_id Employees ID
AC_ACCOUNT206
AC_MGR 205
AD_ASST 200
AD_PRES 100
AD_VP 101 ,102
FI_ACCOUNT 110 ,113 ,111 ,109 ,112
*/
SELECT job_id , GROUP_CONCAT(employee_id,' ')
FROM employees
GROUP BY job_id;

/*2. Write a query to update the portion of the phone_number in the employees 
table, within the phone number the substring '124' will be replaced by '999'.
Sample table: employees
*/
UPDATE employees 
SET phone_number = REPLACE(phone_number, '124', '999') 
WHERE phone_number LIKE '%124%';

/*3. Write a query to get the details of the employees where the length of the first 
name greater than or equal to 8.
Sample table: employees
*/
SELECT *
FROM employees
WHERE first_name LIKE('________%');

SELECT *
FROM employees
WHERE LENGTH(first_name)>=8;

/*4. Write a query to display leading zeros before maximum and minimum salary.
Sample table: jobs
*/
SELECT job_id,  LPAD( max_salary, 7, '0') ' Max Salary',
LPAD( min_salary, 7, '0') ' Min Salary' 
FROM jobs;

/*5. Write a query to append '@example.com' to email field.
Sample table: employees
Sample Output :
*/
SELECT * FROM employees;
SELECT CONCAT(EMAIL,'','@gmail.com')
FROM employees;

/*6. Write a query to get the employee id, first name and hire month.
Sample table: employees
*/
SELECT employee_id, first_name, SUBSTRING(hire_date, 6,2) AS HIRE_MONTH
FROM employees;

/*7. Write a query to get the employee id, email id (discard the last three 
characters).
Sample table: employees
*/
SELECT * FROM employees;
SELECT employee_id, REVERSE(SUBSTRING(REVERSE(email), 4)) AS email_id 
from employees;

/*8. Write a query to find all employees where first names are in upper case.
Sample table: employees
*/
SELECT * FROM employees 
WHERE first_name = BINARY UPPER(first_name);

/*9. Write a query to extract the last 4 character of phone numbers.
Sample table: employees
*/
SELECT * FROM employees;
SELECT employee_id, SUBSTR(phone_number,-4) AS phone_number
from employees;

/*10. Write a query to get the last word of the street address.
Sample table: locations
*/
SELECT * FROM locations;
SELECT location_id ,SUBSTRING_INDEX(street_address,' ', -1) AS street_address
FROM locations;

/*11. Write a query to get the locations that have minimum street length.
*/
SELECT * FROM LOCATIONS; 
SELECT MIN(LENGTH(street_address)) FROM locations;
SELECT * 
FROM locations
WHERE LENGTH(street_address) IN (SELECT MIN(LENGTH(street_address)) FROM locations);

/*12. Write a query to display the first word from those job titles which contains 
more than one words.
Sample table: jobs
*/
SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1)
FROM jobs;

/*13. Write a query to display the length of first name for employees where last 
name contain character 'c' after 2nd position.
Sample table: employees
*/
SELECT first_name, last_name
FROM employees
WHERE INSTR(last_name, 'c')>2;

/*14. Write a query that displays the first name and the length of the first name for 
all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column 
an appropriate label. Sort the results by the employees' first names.
Sample table: employees
*/

