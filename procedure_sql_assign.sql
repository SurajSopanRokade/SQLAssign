SET GLOBAL log_bin_trust_function_creators = 1;
SET @OFFICE = get_num(1002);
SELECT @OFFICE;

-- ASSIGNMENT_ON_PROCEDURE AND FUNCTIONS
/*1 > Create a procedure that takes employee details (name, salary, department ID) as parameters and 
adds a new employee to the "employees" table.
*/
INSERT INTO employees
(first_name, last_name, salary, department_id)
VALUES
("Suraj", "Rokade", 45000, 20);

CALL insert_new_record("Suraj", "Rokade", 45000, 20);

CALL insert_new_record(401,"Sudershan", "narhe", 200000, 20);

/*2> Create a procedure that takes an employee ID and a new salary as parameters and 
updates the salary of the specified employee based on some criteria.
*/
UPDATE employees
SET salary=psalary
WHERE employee_id=pemployee_id;

CALL update_salary(0, 56000);

/*3> Create a function that takes a department ID as a parameter and returns 
the average salary of employees in that department.
*/
SELECT AVG(salary)
FROM employees
WHERE department_id=pdepartment_id;

CALL return_avg_salary(60);

/*4> Create a function that takes a department ID as a parameter and returns the count of employees
 in that department.
*/
SELECT COUNT(employee_id)
FROM employees
WHERE department_id=pdepartment_id
GROUP BY department_id;

CALL count_emp_by_dep_id(60);

/*5> Create a procedure that takes employee ID and new department ID as parameters and 
transfers the employee to the specified department.
*/

CALL transfer_emp_to_new_dep(0, 30);

/*6> Create a procedure that takes a percentage increase as a parameter and increases the 
salaries of all employees by that percentage
*/
UPDATE employees
SET salary = salary(1+perc/100);

CALL count_emp_by_dep_id();