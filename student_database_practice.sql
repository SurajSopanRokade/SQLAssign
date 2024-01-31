CREATE DATABASE collegeSTUDENT;
USE collegeSTUDENT;
CREATE TABLE student(
student_id INT PRIMARY KEY,
student_name VARCHAR(30),
birth_date DATE,
major VARCHAR(300)
);
INSERT INTO student (student_id, student_name, birth_date, major)
VALUES
  (1, 'Suraj', '1995-05-15', 'Computer Science'),
  (2, 'Abhishek', '1998-08-22', 'Mathematics'),
  (3, 'yogesh', '1997-04-10', 'Biology'),
  (4, 'sudarshan', '1996-11-28', 'Chemistry'),
  (5, 'sunish', '1999-02-05', 'Physics');

CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(30),
credit_hours INT
);
INSERT INTO courses (course_id, course_name, credit_hours)
VALUES
  (1, 'Introduction to Programming', 3),
  (2, 'Data Structures and Algorithms', 4),
  (3, 'Database Management Systems', 3),
  (4, 'Artificial Intelligence', 4),
  (5, 'Software Engineering', 3);

CREATE TABLE enrollments(
entrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
CONSTRAINT fkstudent_id FOREIGN KEY (student_id) REFERENCES student(student_id),
CONSTRAINT fkcourse_id FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (entrollment_id, student_id, course_id, enrollment_date)
VALUES
  (1, 1, 1, '2023-01-15'),
  (2, 2, 2, '2023-02-01'),
  (3, 3, 3, '2023-02-10'),
  (4, 4, 4, '2023-03-05'),
  (5, 5, 5, '2023-03-15'),
  (6, 1, 1, '2023-01-16'),
  (7, 2, 2, '2023-02-02'),
  (8, 3, 3, '2023-02-11'),
  (9, 4, 4, '2023-03-06'),
  (10, 5, 5, '2023-03-16');
  

