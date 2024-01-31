-- sql weekly test 2
-- 1.create employee table
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
name VARCHAR(30),
age INT ,
requestsCompleted INT,
emp_rating float , 
constraint check(emp_rating>1),
constraint check(emp_rating<5)
);

-- 2.create service_request table 
CREATE TABLE service_request(
service_id INT PRIMARY KEY,
cust_id INT,
service_desc VARCHAR(30),
request_open_date DATE,
status_id INT,
emp_id INT,
request_closed_date DATE,
charges DOUBLE,
feedback_rating FLOAT, CONSTRAINT CHECK(feedback_rating>1) , CONSTRAINT CHECK(feedback_rating<5),
CONSTRAINT fkcust_id FOREIGN KEY (cust_id) REFERENCES customer (cust_id),
CONSTRAINT fkstatus_id FOREIGN KEY (status_id) REFERENCES services_status (status_id),
CONSTRAINT fkemp_id FOREIGN KEY (emp_id) REFERENCES employee (emp_id)
);

-- 3. add column in customer emp_id
ALTER TABLE customer
ADD emp_id VARCHAR(30);

-- 4. show cust_name, service_desc, charges of request serverd by employees older than age 30
SELECT c.name, s.service_desc, s.charges
FROM service_request s
INNER JOIN customer c ON (s.cust_id=c.cust_id) 
INNER JOIN service_status s1 ON (s.status_id=s1.status_id AND descr='closed')
INNER JOIN employee e ON (s.emp_id=e.emp_id)
WHERE e.age>30;

-- 5.write a query to select customer names for whome employee Bob Davis has not serverd any request
SELECT c.name
FROM service_request s
INNER JOIN customer c ON (c.cust_id=s.cust_id)
INNER JOIN employee e ON (s.emp_id=e.emp_id)
WHERE e.name!='Bob Davis';

-- 6.Show employee_name, total charges of all the request server by John Smith
SELECT e.name, SUM(s.charges)
FROM service_request s
INNER JOIN customer c ON (c.cust_id=s.cust_id)
INNER JOIN service_status s1 ON (s1.status_id=s.status_id AND descr='CLOSED')
INNER JOIN employee e ON (s.emp_id=e.emp_id)
GROUP BY e.name;

-- 7.service_description, customer_name of request having third highest charges
SELECT s.service_desc, c.name, s.charges
FROM service_request s
INNER JOIN customer c ON (s.cust_id=c.cust_id)
ORDER BY charges DESC LIMIT 3;

-- 8.show name off all employees who having same rating as John Smith
SELECT e.name
FROM employee e
INNER JOIN employee e1 ON (e.emp_id=e1.emp_id)
WHERE e1.emp_rating=(SELECT emp_rating FROM employee WHERE name='John Smith');

-- 9.find total charges earned by each employee sort by maximum charges at top consider closed request only.
SELECT e.name, SUM(charges) AS sumC
FROM service_request s
INNER JOIN employee e ON (s.emp_id=e.emp_id)
WHERE s.status_id=3
GROUP BY e.name 
ORDER BY sumC DESC;

-- 10.delete all records of Emily White as she left company
SELECT emp_id
FROM employee
WHERE name='John Smith';

DELETE FROM service_request
WHERE emp_id=(SELECT emp_id
FROM employee
WHERE name='John Smith') AND status_id=3;

-- 11.delete all cancelled request from request table
SELECT status_id
FROM service_status
WHERE descr='cancelled';

DELETE FROM service_request
WHERE status_id IN (SELECT status_id
FROM service_status
WHERE descr='cancelled');

-- 12.Add 200 to the charges of service_request raised by Alice Brown
UPDATE service_request
SET charges=charges+200
WHERE cust_id = (SELECT cust_id FROM customer WHERE name='Alice Brown');



-- 16 year wise and monthwise addition total charges
CALL YearMonthwise_total_charges();

-- 15.create trigger which is fired when service_request is updated in service_request table trigger should update emp_rating in employee table 
/*CREATE DEFINER=`root`@`localhost` TRIGGER `service_request_AFTER_UPDATE` AFTER UPDATE ON `service_request` FOR EACH ROW BEGIN
DECLARE avg_rating INT ;

IF NEW.status_id=3 THEN 
SELECT AVG(feedback_rating) INTO avg_rating
FROM service_request
WHERE emp_id=NEW.emp_id AND status_id=3;

UPDATE employee
SET emp_rating=avg_rating
WHERE emp_id=NEW.emp_id;
END IF;
END
*/