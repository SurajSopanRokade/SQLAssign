SELECT * FROM hospital.doctor;
CREATE TABLE doctor2(
doc_id INT PRIMARY KEY,
doc_name VARCHAR(25),
speciality VARCHAR(20)
);
INSERT INTO doctor2 (doc_id, doc_name, speciality) VALUES
(1, 'Dr. Smith', 'Cardiology'),
(2, 'Dr. Johnson', 'Pediatrics'),
(3, 'Dr. Davis', 'Orthopedics'),
(4, 'Dr. Williams', 'Dermatology'),
(5, 'Dr. Anderson', 'Neurology'),
(6, 'Dr. Martinez', 'Ophthalmology');