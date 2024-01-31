SELECT * FROM collegestudent.student;
-- 1.	Select all students and their majors.
SELECT student_id, major
FROM student;

-- 2.	List the names of courses with more than 3 credit hours.
SELECT course_name
FROM courses
WHERE credit_hours>3;

-- 3.	Find the students born after 2000.
SELECT *
FROM student s
WHERE year(birth_date)>2000;

-- 4.	Count the number of courses in each major.
SELECT COUNT(course_id) AS numberOfcourse , (SELECT major FROM student s WHERE e.student_id=s.student_id) AS majorName
FROM enrollments e 
GROUP BY student_id;

-- 5.	Show the name and birth date of the oldest student.
SELECT student_name, birth_date AS OLDESTSTD
FROM student
ORDER BY birth_date ASC LIMIT 1;

-- 6.	Update the major of a specific student.
UPDATE student
SET major = 'computer science'
WHERE student_id = 1;

-- 7.	List all students who have not enrolled in any courses.
SELECT DISTINCT student_id
FROM enrollments;

SELECT student_name
FROM student
WHERE student_id NOT IN(SELECT DISTINCT student_id
FROM enrollments);

-- 8.	Find the course with the highest number of credit hours.
SELECT MAX(credit_hours)
FROM courses;

SELECT course_id, course_name
FROM courses
WHERE credit_hours IN (SELECT MAX(credit_hours)
FROM courses);

-- 9.	Calculate the average birth year of all students.
SELECT AVG( year(birth_date)) AS avgbirthyear
FROM student;

-- 10.	Delete all students majoring in 'History'.
DELETE 
FROM student
WHERE major='History';

-- 11.	Show the names and birth dates of students majoring in 'Computer Science'.
SELECT student_name, birth_date
FROM student
WHERE major='Computer Science';

-- 12.	Find the student with the highest number of credit hours enrolled
SELECT student_id, SUM(credit_hours) AS MAX
FROM enrollments e, courses c
WHERE e.course_id=c.course_id
GROUP BY student_id
ORDER BY MAX DESC LIMIT 1;

-- 13.	List the majors and the number of students in each major.
SELECT major , COUNT(student_id)
FROM student
GROUP BY major;

-- 14.	Find students with similar birth years (having at least one year in common).
SELECT student_id, student_name
FROM student A
WHERE year(A.birth_date) IN (SELECT year(s.birth_date) FROM student s WHERE s.student_id!=A.student_id);

-- 15.	Show the majors with students born before 1995.
SELECT student_id 
FROM student
WHERE year(birth_date)<'1995';

SELECT major
FROM student
WHERE student_id IN (SELECT student_id 
FROM student
WHERE year(birth_date)<'1995');

-- 16.	Count the total number of credit hours for each major.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT SUM(credit_hours), major 
FROM courses c,student s, enrollments e
WHERE e.student_id = s.student_id AND c.course_id= e.course_id
GROUP BY s.major;


-- 17.	Update the birth date of all students majoring in 'Biology'.
UPDATE student
SET birth_date='2001-4-10'
WHERE major='biology';

-- 18.	Find the courses with no enrolled students.
SELECT student_id
FROM student
WHERE student_id IN (SELECT DISTINCT student_id FROM enrollments);

SELECT course_id
FROM enrollments
WHERE student_id NOT IN (SELECT student_id
FROM student
WHERE student_id IN (SELECT DISTINCT student_id FROM enrollments));

-- 19.	List the students and their majors, ordered by birth date (ascending order).
SELECT student_id, major, birth_date
FROM student
ORDER BY date(birth_date);

-- 20.	Show the students born in the last ten years
SELECT *
FROM student
ORDER BY year(birth_date) DESC LIMIT 10;

-- 21.	Find the courses with names containing the word 'Math'.
SELECT *
FROM courses
WHERE INSTR(course_name, 'Math');

-- 22.	Calculate the total number of credit hours for all courses.
SELECT e.course_id, SUM(credit_hours)
FROM enrollments e, courses c
WHERE e.course_id=c.course_id
GROUP BY e.course_id;

SELECT SUM(credit_hours)
FROM courses;

-- 23.	Show the students with the highest and lowest credit hours enrolled.
SELECT student_id, SUM(credit_hours) AS MAX
FROM enrollments e, courses c
WHERE e.course_id=c.course_id
GROUP BY student_id
ORDER BY MAX DESC LIMIT 1;

SELECT student_id, SUM(credit_hours) AS MIN
FROM enrollments e, courses c
WHERE e.course_id=c.course_id
GROUP BY student_id
ORDER BY MIN ASC LIMIT 1;

-- 24.	Find students who have enrolled in consecutive years.
SELECT DISTINCT s.student_id
FROM enrollments s
WHERE (year(s.enrollment_date)-1) IN (SELECT year(enrollment_date) FROM enrollments e WHERE s.student_id!=e.student_id);

SELECT *
FROM student
WHERE student_id IN(SELECT DISTINCT s.student_id
FROM enrollments s
WHERE (year(s.enrollment_date)-1) IN (SELECT year(enrollment_date) FROM enrollments e WHERE s.student_id!=e.student_id));

-- 25.	Delete all courses with less than 2 credit hours.
DELETE FROM courses
WHERE credit_hours<2;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));



