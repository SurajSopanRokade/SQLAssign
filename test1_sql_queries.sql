-- 1.show names of theatre where maroti has booked tickets
SELECT cust_id
FROM customer 
WHERE cust_name='maroti';

SELECT DISTINCT theatre_id
FROM bookings
WHERE cust_id IN (SELECT cust_id
FROM customer 
WHERE cust_name='maroti');

SELECT theatre_name
FROM theatre
WHERE theatre_id IN (SELECT DISTINCT theatre_id
FROM bookings
WHERE cust_id IN (SELECT cust_id
FROM customer 
WHERE cust_name='maroti'));

-- 2.show names of theatre where movie uri is screening
SELECT movie_id
FROM movie
WHERE movie_name ='uri';

SELECT DISTINCT theatre_id 
FROM screeninginfo
WHERE movie_id =(SELECT movie_id
FROM movie
WHERE movie_name ='uri');

SELECT theatre_name
FROM theatre
WHERE theatre_id IN (SELECT DISTINCT theatre_id 
FROM screeninginfo
WHERE movie_id =(SELECT movie_id
FROM movie
WHERE movie_name ='uri'));

-- 3.show names of theatre which has done max business
SELECT SUM(no_of_tickets_booked), theatre_id
FROM bookings
GROUP BY theatre_id
ORDER BY SUM(no_of_tickets_booked) DESC LIMIT 1;


SELECT theatre_name FROM theatre
WHERE theatre_id = (SELECT  theatre_id
FROM bookings
GROUP BY theatre_id
ORDER BY SUM(no_of_tickets_booked) DESC LIMIT 1);

-- 4.show names of movie and business done by that movie
SELECT SUM(no_of_tickets_booked*ticket_price), m.movie_name
FROM bookings b, screeninginfo s, movie m
WHERE b.movie_id=s.movie_id AND b.theatre_id=s.theatre_id AND m.movie_id=b.movie_id
GROUP BY s.movie_id;
 
-- 5.write a query to add city field in theatre table between address and rating
ALTER TABLE theatre
ADD
city VARCHAR(20)
AFTER address;

-- 6.write a query to add field totalcharges in bookings table
ALTER TABLE bookings
ADD
totalcharges INT;

-- 7 update field total charges. total charges are no of tickets booked multiplied by ticket price for that movie and theatre.
UPDATE bookings b
SET totalcharges = b.no_of_tickets_booked *(SELECT ticket_price FROM screeninginfo s WHERE b.movie_id=s.movie_id AND b.theatre_id=s.theatre_id); 

-- 8 give 20% discount on total charge whose birthday same booking date
SELECT b.cust_id 
FROM customer c, bookings b
WHERE day(c.birth_date)=day(b.booking_date) AND month(c.birth_date)=month(b.booking_date) AND c.cust_id=b.cust_id;

UPDATE bookings b
SET totalcharges = totalcharges - (totalcharges*0.20)
WHERE b.cust_id IN (SELECT b.cust_id 
FROM customer c
WHERE day(c.birth_date)=day(b.booking_date) AND month(c.birth_date)=month(b.booking_date) AND c.cust_id=b.cust_id);

-- 9 delete all bookings done by yogesh
SELECT cust_id
FROM customer
WHERE cust_name='prashant';

DELETE FROM bookings
WHERE cust_id = (SELECT cust_id
FROM customer
WHERE cust_name='prashant');

-- 10 Show names of movie name, total business done by it of movies directed by kirtiraj
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT SUM(no_of_tickets_booked*ticket_price), s.movie_id, m.movie_name
FROM screeninginfo s, bookings b, movie m
WHERE s.movie_id=b.movie_id AND s.theatre_id=b.theatre_id AND b.movie_id IN (SELECT movie_id FROM movie WHERE director ='prakash raj')
GROUP BY s.movie_id;

SELECT SUM(no_of_tickets_booked*ticket_price), m.movie_name
FROM bookings b, screeninginfo s, movie m
WHERE b.movie_id=s.movie_id AND b.theatre_id=s.theatre_id AND m.movie_id=b.movie_id AND m.director='prakash raj'
GROUP BY s.movie_id;