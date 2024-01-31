CREATE DATABASE TEST2_SQL;
USE TEST2_SQL;

CREATE TABLE customer(
cust_id INT PRIMARY KEY,
name VARCHAR(30),
address_line1 VARCHAR(100),
address_line2 VARCHAR(100),
city VARCHAR (30),
pin_code INT 
);

INSERT INTO customer (cust_id, name, address_line1, address_line2, city, pin_code)
VALUES
(1, 'John Doe', '123 Main Street', 'Apt 4', 'Cityville', 12345),
(2, 'Jane Smith', '456 Oak Avenue', 'Suite 10', 'Townburg', 56789),
(3, 'Bob Johnson', '789 Pine Road', 'Unit 7', 'Villagetown', 10111),
(4, 'Alice Brown', '321 Elm Lane', '', 'Hamletsville', 54321);

CREATE TABLE service_status(
status_id INT PRIMARY KEY,
descr VARCHAR(100)
);
INSERT INTO service_status
(status_id, descr)
VALUES
(1, 'OPEN'),
(2, 'IN PROGRESS'),
(3, 'CLOSED'),
(4, 'CANCELLED');

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
name VARCHAR(30),
age INT ,
requestsCompleted INT,
emp_rating float , 
constraint check(emp_rating>1),
constraint check(emp_rating<5)
);

INSERT INTO employee (emp_id, name, age, requestsCompleted, emp_rating)
VALUES
(1, 'John Smith', 28, 50, 4.2),
(2, 'Alice Johnson', 35, 30, 3.8),
(3, 'Bob Davis', 40, 25, 4.5),
(4, 'Emily White', 32, 40, 3.2);

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
CONSTRAINT fkstatus_id FOREIGN KEY (status_id) REFERENCES service_status (status_id),
CONSTRAINT fkemp_id FOREIGN KEY (emp_id) REFERENCES employee (emp_id)
);

INSERT INTO service_request (service_id, cust_id, service_desc, request_open_date, status_id, emp_id, request_closed_date, charges, feedback_rating)
VALUES
(1, 1, 'Repair', '2023-01-10', 1, 2, '2023-01-15', 150.00, 4.3),
(2, 2, 'Installation', '2023-02-05', 2, 1, '2023-02-10', 200.00, 3.8),
(3, 3, 'Maintenance', '2023-03-15', 1, 3, '2023-03-20', 100.00, 4.5),
(4, 4, 'Consultation', '2023-04-20', 3, 4, '2023-04-25', 50.00, 3.2);
