CREATE DATABASE IF NOT EXISTS College;
USE College;

CREATE TABLE student
(
	roll_no INT,
    name VARCHAR (30),
    age INT 
);
INSERT INTO student
VALUES 
(101,"adam",12),
(102,"bob",14); 

SELECT * FROM student;
USE College;
SHOW TABLES;

DROP DATABASE IF EXISTS College;
SHOW DATABASES;

