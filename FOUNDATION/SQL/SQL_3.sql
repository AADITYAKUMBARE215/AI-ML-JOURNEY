CREATE DATABASE college;
USE college;

CREATE TABLE Teacher 
(
	id INT PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    subject VARCHAR (20),
    salary INT DEFAULT 0
);

INSERT INTO Teacher
(id, name, subject, salary)
VALUES
(23, "ajay", "maths", 50000),
(47, "bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(9, "divya", "physics", 75000);

SELECT * FROM Teacher;

SELECT * FROM Teacher 
WHERE salary > 55000;

ALTER TABLE Teacher
CHANGE COLUMN salary ctc INT DEFAULT 0;

UPDATE Teacher
SET ctc = ctc + (0.25) * ctc;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Teacher
ADD COLUMN city VARCHAR(50) DEFAULT "Gurgaon";

ALTER TABLE Teacher
DROP COLUMN ctc;

TRUNCATE TABLE Teacher;
DROP TABLE Teacher;
DROP DATABASE college;