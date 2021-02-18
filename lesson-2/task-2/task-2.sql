DROP DATABASE IF EXISTS example;
CREATE DATABASE example;

USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'User name'
);

INSERT INTO users VALUES
	(DEFAULT, 'Vasya'),
	(DEFAULT, 'Masha'),
	(DEFAULT, 'Oleg');
	
SELECT * from users;
