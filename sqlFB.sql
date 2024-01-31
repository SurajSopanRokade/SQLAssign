CREATE DATABASE FB;
USE FB;
CREATE TABLE FBUsers(
user_id INT PRIMARY KEY,
user_name VARCHAR(30) NOT NULL,
email VARCHAR(20) UNIQUE,
phone_no BIGINT UNIQUE,
total_posts INT 
);

CREATE TABLE post(
post_id INT PRIMARY KEY,
user_id INT,
postcontent VARCHAR(30) NOT NULL,
postimage VARCHAR(20) NOT NULL,
postvideo VARCHAR(20) NOT NULL,
CONSTRAINT fkuser_id FOREIGN KEY (user_id) REFERENCES FBUsers (user_id)
);

CREATE TABLE friendship(
friendship_id INT PRIMARY KEY,
user_id INT,
friend_id INT NOT NULL,
friendship_status_code INT,
CONSTRAINT fkuserr_id FOREIGN KEY (user_id) REFERENCES FBUsers(user_id),
CONSTRAINT fkstatus_code FOREIGN KEY (friendship_status_code) REFERENCES friendship_status (status_code)
);

CREATE TABLE friendship_status(
status_code INT PRIMARY KEY,
status VARCHAR(30) NOT NULL 
);