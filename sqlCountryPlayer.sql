CREATE DATABASE Countries;
USE Countries;
CREATE TABLE countries(
country_id INT PRIMARY KEY,
country_name VARCHAR(30) UNIQUE
);

CREATE TABLE Format(
format_id INT PRIMARY KEY,
format_name VARCHAR(30)
);

CREATE TABLE Batsman(
player_id INT PRIMARY KEY,
player_name VARCHAR(15) NOT NULL,
age INT NOT NULL,
country_id INT,
totalruns INT,
total50s INT,
total100s INT,
player_grade VARCHAR(5),
CONSTRAINT fkcountry_id FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE BF_MAPPING(
id INT PRIMARY KEY,
player_id INT,
format_id INT,
CONSTRAINT fkplayer_id FOREIGN KEY (player_id) REFERENCES Batsman (player_id),
CONSTRAINT fkformat_id FOREIGN KEY (format_id) REFERENCES Format (format_id)
);