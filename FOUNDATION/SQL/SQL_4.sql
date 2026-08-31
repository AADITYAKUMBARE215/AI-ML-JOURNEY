CREATE DATABASE STUDENT_INFO;
USE STUDENT_INFO;

CREATE TABLE info(
	roll_no INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL,
    city VARCHAR(20) DEFAULT "Pune",
    marks INT 
);

INSERT INTO info
(roll_no, name, city, marks)
VALUES
(110, "ADAM", "Delhi", 76),
(108, "BOB", "Mumbai", 65),
(124, "CASEY", "Pune", 94),
(112, "DUKE", "Pune", 80);

SELECT * FROM info;

SELECT * FROM info 
WHERE marks > 75;

SELECT DISTINCT city FROM info;

SELECT city, MAX(marks)
FROM info
GROUP BY city;

SELECT AVG(marks) FROM info;

ALTER TABLE info
ADD COLUMN grade VARCHAR(2);

UPDATE info 
SET grade = "O"
WHERE marks >= 80;

UPDATE info 
SET grade = "A"
WHERE marks >= 70 AND marks < 80;

UPDATE info 
SET grade = "B"
WHERE marks >= 60 AND marks < 70;

TRUNCATE TABLE info;
DROP TABLE info;
DROP DATABASE student_info;