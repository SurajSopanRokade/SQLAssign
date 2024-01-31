CREATE DATABASE Movie;
USE Movie;
CREATE TABLE movies(
movie_id INT PRIMARY KEY,
movie_name VARCHAR(30) NOT NULL,
release_year VARCHAR(30) NOT NULL,
box_office_collection INT NOT NULL
);

CREATE TABLE roles(
roll_id INT PRIMARY KEY,
roll_name VARCHAR(30) NOT NULL
);

CREATE TABLE celebrity(
celebrity_id INT PRIMARY KEY,
celebrity_name VARCHAR(30) NOT NULL,
birthdate VARCHAR(20) NOT NULL,
phNo BIGINT UNIQUE,
email VARCHAR(20) UNIQUE
);

CREATE TABLE bollywoodData(
bollywood_data_id INT PRIMARY KEY,
celebrity_id INT,
movie_id INT,
roll_id INT,
CONSTRAINT fkcele_id FOREIGN KEY (celebrity_id) REFERENCES celebrity(celebrity_id),
CONSTRAINT fkmov_id FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
CONSTRAINT fkroll_id FOREIGN KEY (roll_id) REFERENCES roles(roll_id)
);