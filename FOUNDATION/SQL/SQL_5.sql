-- TRANSACTIONS
SELECT @@autocommit;

SET autocommit = 0;

CREATE DATABASE prime;
USE prime;

CREATE TABLE accounts(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    balance DECIMAL(10,2)
); 

INSERT INTO accounts 
(name, balance)
VALUES
("adam", 500.00),
("bob", 300.00),
("charlie", 1000.00);

SELECT * FROM accounts;

-- TRANSACTIONS 

-- COMMIT
START TRANSACTION;
UPDATE accounts 
SET balance = balance - 50 
WHERE id = 1;
UPDATE accounts 
SET balance = balance + 50
WHERE id = 2;
COMMIT;

SELECT * FROM accounts;

-- ROLLBACK
START TRANSACTION;
UPDATE accounts 
SET balance = balance - 50 
WHERE id = 1;
UPDATE accounts 
SET balance = balance + 50
WHERE id = 2;
ROLLBACK;

SELECT * FROM accounts;

-- SAVEPOINT
START TRANSACTION;
UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_wallet_topup;
UPDATE accounts SET BALANCE = balance + 10 WHERE id = 1;
-- error
ROLLBACK TO after_wallet_topup;
COMMIT;

SELECT * FROM accounts;

TRUNCATE TABLE accounts;
DROP TABLE accounts;
DROP DATABASE prime;
