-- 1.GIVE NAME OF MOVIES WHICH SHOWS ARE BOOKED IN LOWEST THEATRE RATING

SELECT MIN(rating)
FROM theatre;


SELECT theatre_id
FROM theatre 
WHERE rating = (SELECT MIN(rating)
FROM theatre);

SELECT DISTINCT movie_id
FROM bookings
WHERE theatre_id=(SELECT theatre_id
FROM theatre 
WHERE rating IN (SELECT MIN(rating)
FROM theatre));

SELECT movie_name
FROM movie
WHERE movie_id IN (SELECT DISTINCT movie_id
FROM bookings
WHERE theatre_id=(SELECT theatre_id
FROM theatre 
WHERE rating IN (SELECT MIN(rating)
FROM theatre)));

-- 2.GIVE THE NAME OF CUSTOMERS WHOSE ADDRESS SAME AS THEATRE ADDRESS
SELECT DISTINCT cust_name
FROM customer c
WHERE c.address IN (SELECT address FROM theatre);

-- 3.GIVE ME THE CUSTOMER NAME WHO PAYES HIGHEST ON MOVIE
SELECT b.cust_id,MAX(no_of_tickets_booked*ticket_price)
FROM screeninginfo s, bookings b
WHERE s.movie_id=b.movie_id AND s.theatre_id=b.theatre_id
GROUP BY b.cust_id
ORDER BY b.cust_id DESC LIMIT 1;

SELECT cust_name
FROM customer
WHERE cust_id = (SELECT b.cust_id
FROM screeninginfo s, bookings b
WHERE s.movie_id=b.movie_id AND s.theatre_id=b.theatre_id
GROUP BY b.cust_id
ORDER BY b.cust_id DESC LIMIT 1);

-- 4.GIVE ME CUSTOMER NAME WHO LIKES PRODUCER AMIR KHAN MOVIES
SELECT movie_id
FROM movie
WHERE producer='amir khan';

SELECT cust_id,MAX(no_of_tickets_booked)
FROM bookings
WHERE movie_id IN (SELECT movie_id
FROM movie
WHERE producer='amir khan')
GROUP BY cust_id;

SELECT cust_name
FROM customer
WHERE cust_id =(SELECT cust_id
FROM bookings
WHERE movie_id IN (SELECT movie_id
FROM movie
WHERE producer='amir khan')
GROUP BY cust_id);

-- 5.FIND OUT THEATRE NAME THEATRE RATING WHERE DDLJ MOVIE SCREENED
SELECT movie_id
FROM movie
WHERE movie_name='ddlj';

SELECT theatre_id
FROM bookings
WHERE movie_id IN (SELECT movie_id
FROM movie
WHERE movie_name='ddlj');

SELECT theatre_name, rating
FROM theatre
WHERE theatre_id IN(SELECT theatre_id
FROM bookings
WHERE movie_id IN (SELECT movie_id
FROM movie
WHERE movie_name='ddlj'));

-- 
