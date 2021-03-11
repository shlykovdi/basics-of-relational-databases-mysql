DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

USE test;

CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	created_at VARCHAR(256) NOT NULL,
	updated_at VARCHAR(256) NOT NULL
);

INSERT INTO users(created_at, updated_at) VALUES 
(NOW(), NOW()),
(NOW(), NOW()),
(NOW(), NOW()),
(NOW(), NOW()),
(NOW(), NOW());

ALTER TABLE users MODIFY created_at DATETIME NOT NULL;
ALTER TABLE users MODIFY updated_at DATETIME NOT NULL;

UPDATE 
	users 
SET 
	created_at = STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%s'), 
	updated_at = STR_TO_DATE(updated_at, '%Y-%m-%d %H:%i:%s');
