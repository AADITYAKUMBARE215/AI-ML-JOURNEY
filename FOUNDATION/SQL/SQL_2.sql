CREATE DATABASE IF NOT EXISTS Instagram;
USE Instagram;
CREATE TABLE user 
(
	id INT,
    age INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT DEFAULT 0,
    following INT,
    CONSTRAINT age_check CHECK (age >=13),
    PRIMARY KEY (id)
);

CREATE TABLE posts
(
	id INT PRIMARY KEY,
    content  VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO user
(id, age, name, email, followers, following)
VALUES
(1,14,"adam","adam@yahoo.in",123,145),
(2,15,"bob","bob123@gmail.com",200,200),
(3,16,"casey","caseyy@gmail.com",300,306),
(4,17,"donald","donald@gmail.com",200,105);

SELECT id, name, email FROM user;

SELECT DISTINCT age FROM user;

SELECT name , followers
FROM user 
WHERE age > 15 AND followers >= 200;

SELECT name , followers
FROM user 
WHERE age > 15 OR followers >= 200;

SELECT name , followers
FROM user 
WHERE age BETWEEN 15 AND 17;

SELECT name, followers, email
FROM user
WHERE email IN ("donald@gmail.com", "caseyy@gmail.com", "abc@gmail.com");

INSERT INTO user
(id, age, name, email, followers, following)
VALUES
(5,14,"eve","eve@yahoo.in",400,145),
(6,16,"farah","farah@gmail.com",10000,1000);

SELECT name, age, email
From user 
WHERE age NOT IN (14,16);

SELECT name, email, age
FROM user 
WHERE age > 14;

SELECT name, email, age
FROM user 
WHERE age > 14
LIMIT 2;

SELECT name, email, age
FROM user
ORDER BY age ASC;

SELECT name, email, age
FROM user
ORDER BY age DESC;

SELECT MAX(followers)
FROM user;

SELECT COUNT(age)
FROM user 
WHERE age = 14;

SELECT MIN(age)
FROM user;

SELECT age, COUNT(id)
FROM user
GROUP BY age;
 
SELECT age, MAX(followers)
FROM user
GROUP BY age;

SELECT age, MAX(followers)
FROM user
GROUP BY age
HAVING MAX(followers) > 200;

/* GENERAL ORDER -> SELECT FROM WHERE GROUP BY HAVING ORDER BY */

SET SQL_SAFE_UPDATES = 0;

UPDATE user
SET followers = 600
WHERE age = 16;

SELECT * FROM user;

DELETE FROM user 
WHERE age = 14;

ALTER TABLE user
ADD COLUMN city VARCHAR(25) DEFAULT "Delhi";

ALTER TABLE user
DROP COLUMN age;

ALTER TABLE user
RENAME TO instaUser;

SELECT * FROM instaUser;

ALTER TABLE instaUser
RENAME TO user;

ALTER TABLE user
CHANGE COLUMN followers subs INT DEFAULT 0;

SELECT * FROM user;

ALTER TABLE user
MODIFY subs INT DEFAULT 5;

TRUNCATE TABLE posts;
DROP TABLE posts;
TRUNCATE TABLE user;
DROP TABLE user;

DROP DATABASE instagram;