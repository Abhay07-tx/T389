CREATE DATABASE BankingDB1;

USE BankingDB1;

-- Customers
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
	AccountCreationDate DATE DEFAULT (CURRENT_DATE)
);

desc customers;


-- 1. Add DOB column to Customers
ALTER TABLE Customers
ADD DOB DATE;

-- modify data type of phone to bigint
ALTER TABLE Customers
MODIFY Phone BIGINT;

-- Accounts Table 
CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

-- 3. Add PRIMARY KEY on AccountID
ALTER TABLE Accounts
ADD CONSTRAINT pk_accounts
PRIMARY KEY (AccountID);

-- 4. Add CHECK constraint on Balance
ALTER TABLE Accounts
ADD CONSTRAINT chk_balance
CHECK (Balance >= 0);


-- add customer_id as foreign key

-- 5. Add CustomerID column

-- Accounts table currently doesn't have CustomerID, 
-- so first add it:

ALTER TABLE Accounts
ADD CustomerID INT;

-- 6. Add CustomerID as Foreign Key
ALTER TABLE Accounts
ADD CONSTRAINT fk_accounts_customer
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


-- Transaction Table
CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);


-- 7. Add PRIMARY KEY on TransactionID
ALTER TABLE Transactions
ADD CONSTRAINT pk_transactions
PRIMARY KEY (TransactionID);

-- 8. Add CHECK constraint on Amount
ALTER TABLE Transactions
ADD CONSTRAINT chk_transaction_amount
CHECK (Amount > 0);

-- 9. Add AccountID column
ALTER TABLE Transactions
ADD AccountID INT;

-- 10. Add AccountID as Foreign Key
ALTER TABLE Transactions
ADD CONSTRAINT fk_transactions_account
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

-- Table Branches

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

-- 12. Add AccountID and BranchID columns
CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE
);

-- 13. Add Composite Primary Key
ALTER TABLE AccountBranches
ADD CONSTRAINT pk_accountbranches
PRIMARY KEY (AccountID, BranchID);

-- 14. Add AccountID Foreign Key
ALTER TABLE AccountBranches
ADD CONSTRAINT fk_ab_account
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);



-- Add 15. Add BranchID Foreign Key

ALTER TABLE Branches
ADD CONSTRAINT pk_branches
PRIMARY KEY (BranchID); 

ALTER TABLE AccountBranches
ADD CONSTRAINT fk_ab_branch
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

-- 

-- Table Loans
CREATE TABLE Loans(
    LoanID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    LoanAmount DECIMAL(12,2) CHECK(LoanAmount > 0),
    InterestRate DECIMAL(4,2),
    StartDate DATE,
    EndDate DATE,

    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);

