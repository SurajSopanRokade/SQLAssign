-- UPDATE BEFORE SALARY FROM EMPLOYEES TO PERTICULAR EMP_ID
CREATE TABLE salary_changes(
employee_id INT,
changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
old_salary DECIMAL (8,2),
new_salary DECIMAL (8,2),
PRIMARY KEY (employee_id, changed_at)
);

UPDATE employees
SET
salary = salary*1.05
WHERE 
employee_id = 0;

-- CREATE TRIGGER TO GIVE MESSAGE BEFORE INSERT
INSERT INTO employees
(employee_id, first_name, last_name, salary, department_id)
VALUES
(402, 'Abhishek', 'Rai', 55000, 20);

-- 1.employee having age>18
/*CREATE DEFINER=`root`@`localhost` TRIGGER `test_employee_BEFORE_UPDATE` BEFORE UPDATE ON `test_employee` FOR EACH ROW BEGIN
IF (datediff(current_date , new.birth_date)/365) < 18 THEN
signal sqlstate '15456' SET message_text = 'Invalid age. age less than 18';
END IF;
END
*/
CREATE TABLE Test_employee(
employee_id INT PRIMARY KEY, 
first_name VARCHAR(30), 
birth_date DATE, 
salary INT 
);
ALTER TABLE Test_employee
ADD salary INT;

INSERT INTO Test_employee
(employee_id, first_name, birth_date, salary)
VALUES
(2,'yogesh', '2000-6-3', 3000);

DROP TABLE Test_employee;

-- 2.create a trigger to check if least salary of employees is 5000 if not set it to 5000
/*CREATE DEFINER=`root`@`localhost` TRIGGER `test_employee_BEFORE_INSERT` BEFORE INSERT ON `test_employee` FOR EACH ROW BEGIN
IF NEW.salary<5000 THEN
SET NEW.salary=5000;
END IF;
END
*/
INSERT INTO Test_employee
(employee_id, first_name, birth_date, salary)
VALUES
(3,'Sudarshan','2001-6-3',4500);

-- 3.write a trigger for automatic id generation for employee table
/*CREATE DEFINER=`root`@`localhost` TRIGGER `test_employee_BEFORE_INSERT` BEFORE INSERT ON `test_employee` FOR EACH ROW BEGIN
SET NEW.employee_id=(SELECT MAX(employee_id) FROM test_employee)+1;
END
*/
INSERT INTO Test_employee
(employee_id, first_name, birth_date, salary)
VALUES
('Abhishek','2002-6-3',3600);

INSERT INTO Test_employee
(employee_id,first_name, birth_date, salary)
VALUES
(1,'Snehal','2003-6-3',4600);

-- 4 create a trigger to restrict delete record of employee who is manager of other employee
/*
*/
SELECT DISTINCT e.employee_id
FROM employees e
INNER JOIN employees e1 ON (e.employee_id=e1.manager_id);

DELETE FROM 
employees
WHERE employee_id=0; 

INSERT INTO employees
(employee_id, first_name, last_name, salary)
VALUES
(0, 'Suraj', 'Rokade', 78500);




