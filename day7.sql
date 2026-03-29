CREATE DATABASE BankingDB;
USE BankingDB;

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    State VARCHAR(50),
    CustomerStatus VARCHAR(10) CHECK (CustomerStatus IN ('Active', 'Inactive'))
);

CREATE TABLE Branches (
    BranchId INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    BranchCode VARCHAR(20) UNIQUE,
    City VARCHAR(50),
    State VARCHAR(50),
    IFSCCode VARCHAR(20) UNIQUE
);

CREATE TABLE Accounts (
    AccountId INT PRIMARY KEY,
    CustomerId INT,
    BranchId INT,
    AccountNumber VARCHAR(30) UNIQUE,
    AccountType VARCHAR(20) CHECK (AccountType IN ('Savings', 'Current', 'Fixed Deposit')),
    OpenDate DATE,
    Balance DECIMAL(10,2),
    AccountStatus VARCHAR(20) CHECK (AccountStatus IN ('Active', 'Closed', 'Frozen')),
    
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (BranchId) REFERENCES Branches(BranchId)
);

CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY,
    AccountId INT,
    TransactionDate DATE,
    TransactionType VARCHAR(20) CHECK (TransactionType IN ('Deposit', 'Withdrawal', 'Transfer')),
    Amount DECIMAL(10,2),
    Description VARCHAR(255),

    FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId)
);

CREATE TABLE Loans (
    LoanId INT PRIMARY KEY,
    CustomerId INT,
    BranchId INT,
    LoanType VARCHAR(30),
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    LoanStartDate DATE,
    LoanStatus VARCHAR(20) CHECK (LoanStatus IN ('Approved', 'Pending', 'Closed')),

    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (BranchId) REFERENCES Branches(BranchId)
);

CREATE TABLE AccountAudit (
    AuditId INT PRIMARY KEY AUTO_INCREMENT,
    AccountId INT,
    ActionType VARCHAR(50),
    OldBalance DECIMAL(10,2),
    NewBalance DECIMAL(10,2),
    ActionDate DATETIME,
    Remarks VARCHAR(255)
);
INSERT INTO Customers VALUES
(1,'Ananya','F','2002-01-01','9999999999','a@gmail.com','Vijayawada','AP','Active'),
(2,'Tayi','M','2001-05-10','8888888888','t@gmail.com','Chennai','TN','Active');

INSERT INTO Branches VALUES
(1,'Main Branch','BR001','Chennai','TN','IFSC001'),
(2,'City Branch','BR002','Vijayawada','AP','IFSC002');
INSERT INTO Accounts VALUES
(1,1,1,'ACC001','Savings','2023-01-01',50000,'Active'),
(2,2,2,'ACC002','Current','2023-02-01',80000,'Active');
INSERT INTO Transactions VALUES
(1,1,'2024-01-01','Deposit',5000,'Salary'),
(2,2,'2024-01-02','Withdrawal',2000,'ATM');
INSERT INTO Loans VALUES
(1,1,1,'Home Loan',200000,7.5,'2023-01-01','Approved'),
(2,2,2,'Personal Loan',50000,9.0,'2023-03-01','Pending');

SELECT * FROM Customers
WHERE CustomerId IN (
    SELECT CustomerId FROM Accounts
    WHERE Balance > (SELECT AVG(Balance) FROM Accounts)
);

SELECT * FROM Customers
WHERE CustomerId NOT IN (
    SELECT CustomerId FROM Loans
);
SELECT * FROM Accounts
WHERE Balance = (
    SELECT MAX(Balance)
    FROM Accounts
    WHERE Balance < (SELECT MAX(Balance) FROM Accounts)
);
CREATE VIEW vw_CustomerAccountDetails AS
SELECT c.CustomerId, c.CustomerName, a.AccountNumber, a.AccountType, a.Balance, a.AccountStatus
FROM Customers c
JOIN Accounts a ON c.CustomerId = a.CustomerId;

CREATE VIEW vw_HighValueAccounts AS
SELECT * FROM Accounts
WHERE Balance > 100000;

DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM Customers;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_balance
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.Balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Balance cannot be negative';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_transaction_deposit
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.TransactionType = 'Deposit' THEN
        UPDATE Accounts
        SET Balance = Balance + NEW.Amount
        WHERE AccountId = NEW.AccountId;
    END IF;
END //
DELIMITER ;