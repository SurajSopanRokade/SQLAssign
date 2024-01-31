CREATE DATABASE college_Student;
USE college_Student;
CREATE TABLE student(
sid INT PRIMARY KEY,
sname VARCHAR(30) NOT NULL,
cid INT,
phno INT UNIQUE,
email VARCHAR(30) UNIQUE,
paidfees INT NOT NULL,
CONSTRAINT fkcid FOREIGN KEY (cid) REFERENCES Course (cid)
);

CREATE TABLE Course(
cid INT PRIMARY KEY,
cname VARCHAR(30) UNIQUE,
subject VARCHAR(30) UNIQUE,
fee INT NOT NULL,
duration VARCHAR(10) NOT NULL
);

CREATE TABLE Attendance(
serial_id INT PRIMARY KEY,
cid INT,
sid INT,
CONSTRAINT fkcid FOREIGN KEY (cid) REFERENCES Course(cid),
CONSTRAINT fksid FOREIGN KEY (sid) REFERENCES student(sid)
);