CREATE DATABASE bankingAprilTest;
-- Create Bank table
CREATE TABLE Bank (
    bankid INT PRIMARY KEY,
    name VARCHAR(255),
    Address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255)
);

-- Create Customer table
CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    bank_id INT,
    FOREIGN KEY (bank_id) REFERENCES Bank(bankid)
);

-- Create Accounts table
CREATE TABLE Accounts (
    Acc_no INT PRIMARY KEY,
    cust_id INT,
    Acctype_id INT,
    Balance DECIMAL(10, 2),
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id),
    FOREIGN KEY (Acctype_id) REFERENCES AccountType(acctype_id)
);

-- Create AccountType table
CREATE TABLE AccountType (
    acctype_id INT PRIMARY KEY,
    acctype VARCHAR(255)
);

-- Create Transaction table
CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    Acc_no INT,
    amount DECIMAL(10, 2),
    transaction_type INT,
    date DATE,
    FOREIGN KEY (Acc_no) REFERENCES Accounts(Acc_no)
);

-- Create Customer_Master table
CREATE TABLE Customer_Master (
    Cust_id INT PRIMARY KEY,
    cname VARCHAR(255),
    contact VARCHAR(15),
    age INT,
    pan_no VARCHAR(20)
);

-- Insert data into Bank table
INSERT INTO Bank (bankid, name, Address, city, state)
VALUES 
    (1, 'ABC Bank', '123 Main Street', 'City1', 'State1'),
    (2, 'XYZ Bank', '456 Oak Street', 'City2', 'State2'),
    (3, 'LMN Bank', '789 Pine Street', 'City3', 'State3'),
    (4, 'PQR Bank', '101 Elm Street', 'City4', 'State4'),
    (5, 'JKL Bank', '202 Cedar Street', 'City5', 'State5');

-- Insert data into Customer table
INSERT INTO Customer (cust_id, bank_id)
VALUES 
    (101, 1),
    (102, 2),
    (103, 3),
    (104, 4),
    (105, 5);

-- Insert data into AccountType table
INSERT INTO AccountType (acctype_id, acctype)
VALUES 
    (1, 'Savings'),
    (2, 'Checking'),
    (3, 'Fixed Deposit'),
    (4, 'Business'),
    (5, 'Loan');

-- Insert data into Accounts table
INSERT INTO Accounts (Acc_no, cust_id, Acctype_id, Balance)
VALUES 
    (1001, 101, 1, 5000.00),
    (1002, 102, 2, 10000.00),
    (1003, 103, 3, 150000.00),
    (1004, 104, 4, 20000.00),
    (1005, 105, 5, -5000.00);

-- Insert data into Transaction table
INSERT INTO Transaction (transaction_id, Acc_no, amount, transaction_type, date)
VALUES 
    (1, 1001, 2000.00, 2, '2024-01-01'),
    (2, 1002, 500.00, 1, '2024-01-02'),
    (3, 1003, 10000.00, 2, '2024-01-03'),
    (4, 1004, 1500.00, 1, '2024-01-04'),
    (5, 1005, 5000.00, 2, '2024-01-05');

-- Insert data into Customer_Master table
INSERT INTO Customer_Master (Cust_id, cname, contact, age, pan_no)
VALUES 
    (101, 'John Doe', '123-456-7890', 30, 'ABCP12345X'),
    (102, 'Jane Smith', '987-654-3210', 25, 'XYZQ56789A'),
    (103, 'Bob Johnson', '111-222-3333', 40, 'LMNP45678B'),
    (104, 'Alice Brown', '555-666-7777', 35, 'PQRS1234C'),
    (105, 'Charlie Davis', '999-888-7777', 28, 'JKLM5678D');