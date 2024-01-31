CREATE DATABASE MOVIES;
USE MOVIES;
CREATE TABLE theatre(
theatre_id INT PRIMARY KEY,
theatre_name VARCHAR(30) NOT NULL,
address VARCHAR(100) NOT NULL,
rating FLOAT 
);

INSERT INTO theatre
(theatre_id, theatre_name, address, rating)
VALUES
(1,"The Starlit Stage","181 Swami Vivekanand Road, Momin Nagar, Jogeshwari West, Mumbai 400102, Maharashtra.",7.8),
(2,"The Majestic Marquee","College Road, Guru Teg Bahadur Colony, Malerkotla, Malerkotla 148023, Punjab.",8.3),
(3,"The Dramatic Den","State Highway 72, Barhalganj, Basgaon 273402, Uttar Pradesh.",9.4),
(4,"The Grand Gala","Maha Road, Maha Chouk, Gaon Bhag, Sangli 416416, Maharashtra",8.7),
(5,"Radiant Curtain Call","Mahatma Gandhi Road, Near Maharaja Tukoji Rao Holker Cloth Market, Rajwada, Indore 452008, Madhya Pradesh.",9.5);

CREATE TABLE movie(
movie_id INT PRIMARY KEY,
movie_name VARCHAR(20) NOT NULL,
director VARCHAR(10) NOT NULL,
producer VARCHAR(20) NOT NULL
);

INSERT INTO movie
(movie_id, movie_name, director, producer)
VALUES
(1,"The Shawshank Redemption", "Frank Darabont", "Niki Marvin"),
(2,"The Godfather", "Francis Ford Coppola", "kirtiraj"),
(3,"Pulp Fiction", "Quentin Tarantino", "Lawrence Bender"),
(4,"Inception", " Christopher Nolan", "Emma Thomas"),
(5,"Uri", "Aditya Dhar", "Ronnie Screwvala");

CREATE TABLE customer(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(10) NOT NULL,
address VARCHAR(100) NOT NULL,
birth_date VARCHAR(10) NOT NULL,
creditcardno BIGINT UNIQUE
);
INSERT INTO customer (cust_id, cust_name, address, birth_date, creditcardno)
VALUES
(1, 'John Doe', '123 Main St, Cityville', '2023-05-15', 1234567890123456),
(2, 'Yogesh', '456 Oak St, Townsville', '2023-08-22', 9876543210987654),
(3, 'Bob Johnson', '789 Pine St, Villageton', '2023-02-15', 5555111122223333),
(4, 'Alice Williams', '321 Birch St, Burgville', '2023-11-30', 4444666677778888),
(5, 'pallavi', '567 Cedar St, Hamletville', '2023-07-18', 1111222233334444);


CREATE TABLE bookings(
bookingid INT PRIMARY KEY,
booking_date VARCHAR(30),
cust_id INT,
movie_id INT,
theatre_id INT,
no_of_tickets_booked INT,
CONSTRAINT fkcust_id FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
CONSTRAINT fkmovie_id FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
CONSTRAINT fktheatre_id FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id)
);

INSERT INTO bookings (bookingid, booking_date, cust_id, movie_id, theatre_id, no_of_tickets_booked)
VALUES
(1, '2023-01-10', 1, 1, 1, 20),
(2, '2023-02-15', 3, 1, 3, 40),
(3, '2023-03-20', 2, 2, 2, 30),
(4, '2023-04-25', 4, 4, 4, 10),
(5, '2023-05-30', 5, 5, 5, 50);

CREATE TABLE Screeninginfo(
movie_id INT,
theatre_id INT,
ticket_price INT, 
CONSTRAINT fkmoviee_id FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
CONSTRAINT fktheatree_id FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id)
);

INSERT INTO Screeninginfo (movie_id, theatre_id, ticket_price)
VALUES
(1, 1, 500),
(2, 2, 500),
(5, 3, 500),
(5, 5, 500),
(2, 5, 500);



