-- INDEX AND STORED PROCEDURES
CREATE DATABASE prime;
USE prime;

CREATE TABLE accounts (
	account_id INT PRIMARY KEY,
    name VARCHAR (50),
    balance DECIMAL (10,2),
	branch VARCHAR (50)
);

INSERT INTO accounts
VALUES
(1, "ADAM", 500.00, "MUMBAI"),
(2, "BOB", 300.00, "DELHI"),
(3, "CHARLIE", 700.00, "BANGLORE"),
(4, "DAVID", 1000.00, "NOIDA");

SELECT * FROM accounts;

CREATE INDEX idx_branch ON accounts(branch);
SHOW INDEX FROM accounts;

SELECT * FROM accounts WHERE branch = "MUMBAI"; -- GETS FASTER

CREATE INDEX idx2 ON accounts (branch, balance);
SHOW INDEX FROM accounts;

DELIMITER $$
CREATE PROCEDURE check_balance (IN acc_id INT, OUT bal DECIMAL (10,2))
BEGIN
	SELECT balance INTO bal
    FROM accounts
    WHERE account_id = acc_id;
END $$
DELIMITER ;

CALL check_balance(1, @balance);
SELECT @balance;

DROP PROCEDURE IF EXISTS check_balance;

DROP INDEX idx2 ON accounts;
DROP INDEX idx_branch ON accounts;
DROP TABLE accounts;
DROP DATABASE prime;