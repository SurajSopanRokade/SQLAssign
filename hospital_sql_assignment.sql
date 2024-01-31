create database hospital;
use hospital;

create table Patient(
pid int primary key,
pname varchar(25),
age int,
weight float,
email varchar(25),
admissiondate date);

insert into Patient values
(1, 'Ishawar', 26, 68.5, 'ishwar@gmail.com', '2023-05-28'),
(2, 'Rushikesh', 28, 72.3, 'rushikesh@example.com', '2023-06-10'),
(3, 'AdarshN', 24, 65.8, 'adarshN@example.com', '2023-07-15'),
(4, 'Maroti', 35, 78.1, 'maroti@example.com', '2023-08-20'),
(5, 'Bhakti', 22, 60.7, 'bhakti@example.com', '2023-09-05'),
(6, 'Abhishek', 30, 75.4, 'abhishek@example.com', '2023-10-12'),
(7, 'Pritam', 32, 70.0, 'pritam@example.com', '2023-11-18'),
(8, 'AdarshJ', 27, 68.9, 'adarshJ@example.com', '2023-12-03'),
(9, 'Utkarsha', 29, 62.5, 'utkarsha@example.com', '2024-01-08'),
(10, 'Sudarshan', 31, 82.2, 'sudarshan@example.com', '2024-02-14'),
(11, 'Yogesh', 25, 69.8, 'yogesh@example.com', '2024-03-20'),
(12, 'Suraj', 28, 74.6, 'suraj@example.com', '2024-04-25'),
(13, 'Prashant', 33, 76.3, 'prashant@example.com', '2024-05-30'),
(14, 'Prabhakar', 36, 85.0, 'prabhakar@example.com', '2024-06-05'),
(15, 'Neha', 23, 63.2, 'neha@example.com', '2024-07-10');