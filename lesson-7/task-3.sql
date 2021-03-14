DROP DATABASE IF EXISTS airport;
CREATE DATABASE airport;

USE airport;

CREATE TABLE flights ( 
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `from` VARCHAR(255) NOT NULL,
    `to` VARCHAR(255) NOT NULL
);

INSERT INTO
    flights(`from`, `to`)
VALUES
    ('moscow', 'omsk'),
    ('novgorod', 'kazan'),
    ('irkutsk', 'moscow'),
    ('omsk', 'irkutsk'),
    ('moscow', 'kazan');

CREATE TABLE cities ( 
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `label` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

INSERT INTO
    cities(`label`, `name`)
VALUES
    ('moscow', 'Москва'),
    ('irkutsk', 'Иркутск'),
    ('novgorod', 'Новгород'),
    ('kazan', 'Казань'),
    ('omsk', 'Омск');



SELECT
    (SELECT `name` FROM cities WHERE cities.label = flights.`from`) AS `from`,
    (SELECT `name` FROM cities WHERE cities.label = flights.`to`) AS `to`
FROM 
    flights;
