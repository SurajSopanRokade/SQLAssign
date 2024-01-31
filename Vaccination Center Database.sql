CREATE DATABASE vaccination;
USE VACCINATION;
CREATE TABLE city(
city_id INT PRIMARY KEY,
city_name VARCHAR(30) NOT NULL,
state VARCHAR(30) NOT NULL,
CONSTRAINT UNIQUE (city_name, state)
);

CREATE TABLE vaccination_center(
center_id INT PRIMARY KEY,
center_name VARCHAR (300) NOT NULL,
location VARCHAR (200) NOT NULL,
city_id INT, 
CONSTRAINT fkcity_id FOREIGN KEY (city_id) REFERENCES city (city_id) 
);

CREATE TABLE user(
Aadhar BIGINT PRIMARY KEY,
full_name VARCHAR(300),
dob DATE NOT NULL,
mobile BIGINT NOT NULL,
email VARCHAR(300) NOT NULL
);

CREATE TABLE slot_master(
slot_id INT PRIMARY KEY,
time TIME
);

CREATE TABLE bookings(
booking_id  INT PRIMARY KEY AUTO_INCREMENT,
Aadhar BIGINT,
date DATE NOT NULL,
center_id INT NOT NULL,
slot_id INT NOT NULL,
vaccination_type INT NOT NULL DEFAULT 1,
CONSTRAINT fkAadhar FOREIGN KEY (Aadhar) REFERENCES user(Aadhar),
CONSTRAINT fkslot_id FOREIGN KEY (slot_id) REFERENCES slot_master(slot_id),
CONSTRAINT fk_center_id FOREIGN KEY (center_id) REFERENCES vaccination_center(center_id),
CONSTRAINT UNIQUE(date, Aadhar)
);
 
CREATE TABLE holiday(
hdate DATE PRIMARY KEY
);

INSERT INTO city (city_id, city_name, state) VALUES
(1, 'Mumbai', 'Maharashtra'),
(2, 'Delhi', 'Delhi'),
(3, 'Bangalore', 'Karnataka'),
(4, 'Chennai', 'Tamil Nadu'),
(5, 'Hyderabad', 'Telangana'),
(6, 'Kolkata', 'West Bengal'),
(7, 'Pune', 'Maharashtra'),
(8, 'Ahmedabad', 'Gujarat'),
(9, 'Jaipur', 'Rajasthan'),
(10, 'Lucknow', 'Uttar Pradesh'),
(11, 'Kanpur', 'Uttar Pradesh'),
(12, 'Nagpur', 'Maharashtra'),
(13, 'Indore', 'Madhya Pradesh'),
(14, 'Thiruvananthapuram', 'Kerala'),
(15, 'Coimbatore', 'Tamil Nadu'),
(16, 'Vadodara', 'Gujarat'),
(17, 'Bhopal', 'Madhya Pradesh'),
(18, 'Visakhapatnam', 'Andhra Pradesh'),
(19, 'Surat', 'Gujarat'),
(20, 'Patna', 'Bihar'),
(21, 'Ludhiana', 'Punjab'),
(22, 'Agra', 'Uttar Pradesh'),
(23, 'Varanasi', 'Uttar Pradesh'),
(24, 'Ranchi', 'Jharkhand'),
(25, 'Amritsar', 'Punjab');
		
INSERT INTO vaccination_center (center_id, center_name, location, city_id) VALUES
(1, 'City Health Clinic', '123 MG Road', 1),
(2, 'Capital Medical Center', '456 Rajpath', 2),
(3, 'Garden Health Hub', '789 Brigade Rd', 3),
(4, 'Beachside Hospital', '101 Marina Beach Rd', 4),
(5, 'Tech Park Vaccination Point', '202 Electronics City', 5),
(6, 'Skyline Wellness Center', '303 Sky Tower St', 1),
(7, 'Unity Health Campus', '567 Unity Avenue', 2),
(8, 'Green Park Vaccination Hub', '890 Green Park Lane', 3),
(9, 'Seaside Health Center', '202 Coastal Rd', 4),
(10, 'Innovative Health Spot', '303 Innovation Blvd', 5),
(11, 'Central Medicare Point', '404 Central Plaza', 6),
(12, 'Golden City Health Hub', '505 Golden Ave', 7),
(13, 'Eternal Bliss Wellness', '606 Serene St', 8),
(14, 'Royal Medical Center', '707 Royal Tower', 9),
(15, 'Silicon Valley Health Spot', '808 Tech Park Rd', 10),
(16, 'Heritage Wellness Center', '909 Heritage Lane', 11),
(17, 'Riverfront Health Hub', '101 Riverfront Rd', 12),
(18, 'City of Lakes Medical Center', '202 Lakeview Plaza', 13),
(19, 'Diamond City Health Point', '303 Diamond Tower', 14),
(20, 'Garden City Medical Hub', '404 Garden Blvd', 15),
(21, 'Pink City Health Center', '505 Pink Plaza', 16),
(22, 'Sacred Ganges Wellness', '606 Ganges Ave', 17),
(23, 'City of Nawabs Health Spot', '707 Nawab Lane', 18),
(24, 'Jharkhand Wellness Center', '808 Jharkhand Rd', 19),
(25, 'Golden Temple Health Hub', '909 Temple Plaza', 20);

INSERT INTO slot_master (slot_id, time) VALUES
(1, '09:00:00'),
(2, '09:15:00'),
(3, '09:30:00'),
(4, '09:45:00'),
(5, '10:00:00'),
(6, '10:15:00'),
(7, '10:30:00'),
(8, '10:45:00'),
(9, '11:00:00'),
(10, '11:15:00'),
(11, '11:30:00'),
(12, '11:45:00'),
(13, '12:00:00'),
(14, '12:15:00'),
(15, '12:30:00'),
(16, '12:45:00'),
(17, '13:00:00'),
(18, '13:15:00'),
(19, '13:30:00'),
(20, '13:45:00'),
(21, '14:00:00'),
(22, '14:15:00'),
(23, '14:30:00'),
(24, '14:45:00'),
(25, '15:00:00'),
(26, '15:15:00'),
(27, '15:30:00'),
(28, '15:45:00'),
(29, '16:00:00'),
(30, '16:15:00'),
(31, '16:30:00'),
(32, '16:45:00');

insert into holiday values 
('2024-01-26'),
('2024-03-08'),
('2024-03-25'),
('2024-03-29'),
('2024-04-11'),
('2024-08-15'),
('2024-10-02'),
('2024-10-29'),
('2024-10-31'),
('2024-11-01'),
('2024-12-25');

INSERT INTO user (Aadhar, full_name, dob, mobile, email)
VALUES
(123456789012, 'Amit Kumar', '2024-05-24', 9876543210, 'amit@example.com'),
(234567890123, 'Priya Sharma', '2024-08-23', 8765432109, 'priya@example.com'),
(345678901234, 'Rahul Verma', '2024-02-23', 7654321098, 'rahul@example.com');


SELECT hdate, COUNT(*) 
FROM holiday
WHERE hdate = '2024-12-24';

ALTER TABLE bookings
DROP COLUMN vaccination_type;
INSERT INTO bookings (booking_id, Aadhar, date, center_id, slot_id)
VALUES (1,null,'2024-12-25',2, 4);

-- CREATE DEFINER=`root`@`localhost` TRIGGER `bookings_BEFORE_INSERT` BEFORE INSERT ON `bookings` FOR EACH ROW BEGIN
-- declare count int; -- for holiday
-- declare last_vaccine_date date; -- for 2months gap

-- -- logic for holidays
-- select count(*) into count from holiday
--  where hdate = new.date;

-- if count>=1 then
-- signal sqlstate '45000'
-- set message_text = 'Vaccination Center is closed On Holidays.';
-- end if;

-- -- logic for 2 months gap 
-- select date into last_vaccine_date  
-- from bookings
-- where Aadhar = new.Aadhar;
-- if last_vaccine_date is not null 
-- and new.date < date_add(last_vaccine_date, INTERVAL 2 MONTH) THEN
--  SIGNAL SQLSTATE '45000'
--     SET MESSAGE_TEXT = 'Cannot insert. User can only take one vaccine with a gap of 2 months.';
--   END IF;
-- END