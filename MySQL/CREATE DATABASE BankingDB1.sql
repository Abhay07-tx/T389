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

-- customers
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate)
VALUES
(1, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876500001', '2025-01-05'),
(2, 'Priya', 'Joshi', 'priya.joshi@gmail.com', '9876500002', '2025-01-10'),
(3, 'Amit', 'Jain', 'amit.jain@gmail.com', '9876500003', '2025-01-15'),
(4, 'Neha', 'Patel', 'neha.patel@gmail.com', '9876500004', '2025-01-20'),
(5, 'Riya', 'Kapoor', 'riya.kapoor@gmail.com', '9876500005', '2025-02-01'),
(6, 'Vikas', 'Jadhav', 'vikas.jadhav@gmail.com', '9876500006', '2025-02-05'),
(7, 'Sneha', 'Kulkarni', 'sneha.kulkarni@gmail.com', '9876500007', '2025-02-10'),
(8, 'Ajay', 'Mehta', 'ajay.mehta@gmail.com', '9876500008', '2025-02-15'),
(9, 'Pooja', 'Joglekar', 'pooja.joglekar@gmail.com', '9876500009', '2025-02-20'),
(10, 'Karan', 'Desai', 'karan.desai@gmail.com', '9876500010', '2025-03-01'),
(11, 'Nikhil', 'Verma', 'nikhil.verma@gmail.com', '9876500011', '2025-03-05'),
(12, 'Anjali', 'Shah', 'anjali.shah@gmail.com', '9876500012', '2025-03-10'),
(13, 'Rohit', 'Patil', 'rohit.patil@gmail.com', '9876500013', '2025-03-15'),
(14, 'Meena', 'Iyer', 'meena.iyer@gmail.com', '9876500014', '2025-03-20'),
(15, 'Sagar', 'Mishra', 'sagar.mishra@gmail.com', '9876500015', '2025-04-01'),
(16, 'Kavita', 'Rao', 'kavita.rao@gmail.com', '9876500016', '2025-04-05'),
(17, 'Arjun', 'Nair', 'arjun.nair@gmail.com', '9876500017', '2025-04-10'),
(18, 'Swati', 'Gupta', 'swati.gupta@gmail.com', '9876500018', '2025-04-15'),
(19, 'Manish', 'Singh', 'manish.singh@gmail.com', '9876500019', '2025-04-20'),
(20, 'Divya', 'Malhotra', 'divya.malhotra@gmail.com', '9876500020', '2025-04-25');

select * from customers;

-- accounts

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(101, 1, 'Savings', 25000.00),
(102, 2, 'Checking', 4500.00),
(103, 3, 'Savings', 75000.00),
(104, 4, 'Checking', 3200.00),
(105, 5, 'Savings', 12000.00),
(106, 6, 'Checking', 8500.00),
(107, 7, 'Savings', 45000.00),
(108, 8, 'Checking', 2200.00),
(109, 9, 'Savings', 95000.00),
(110, 10, 'Checking', 5600.00),
(111, 11, 'Savings', 18000.00),
(112, 12, 'Checking', 6800.00),
(113, 13, 'Savings', 55000.00),
(114, 14, 'Checking', 4100.00),
(115, 15, 'Savings', 32000.00),
(116, 16, 'Checking', 7900.00),
(117, 17, 'Savings', 62000.00),
(118, 18, 'Checking', 3500.00),
(119, 19, 'Savings', 88000.00),
(120, 20, 'Checking', 9100.00);

select * from accounts;

-- transactions
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(1, 101, '2025-05-01', 5000.00, 'Deposit'),
(2, 102, '2025-05-02', 1500.00, 'Withdrawal'),
(3, 103, '2025-05-03', 10000.00, 'Deposit'),
(4, 104, '2025-05-04', 800.00, 'Withdrawal'),
(5, 105, '2025-05-05', 2500.00, 'Deposit'),
(6, 106, '2025-05-06', 1200.00, 'Withdrawal'),
(7, 107, '2025-05-07', 7500.00, 'Deposit'),
(8, 108, '2025-05-08', 600.00, 'Withdrawal'),
(9, 109, '2025-05-09', 15000.00, 'Deposit'),
(10, 110, '2025-05-10', 2000.00, 'Withdrawal'),
(11, 111, '2025-05-11', 4000.00, 'Deposit'),
(12, 112, '2025-05-12', 1800.00, 'Withdrawal'),
(13, 113, '2025-05-13', 9000.00, 'Deposit'),
(14, 114, '2025-05-14', 700.00, 'Withdrawal'),
(15, 115, '2025-05-15', 3500.00, 'Deposit'),
(16, 116, '2025-05-16', 2500.00, 'Withdrawal'),
(17, 117, '2025-05-17', 12000.00, 'Deposit'),
(18, 118, '2025-05-18', 1000.00, 'Withdrawal'),
(19, 119, '2025-05-19', 18000.00, 'Deposit'),
(20, 120, '2025-05-20', 3000.00, 'Withdrawal');


select * from transactions;

-- branches
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Central', 'Mumbai Central, Mumbai', '02240000001'),
(2, 'Thane West', 'Thane West, Thane', '02240000002'),
(3, 'Vashi', 'Vashi, Navi Mumbai', '02240000003'),
(4, 'Andheri', 'Andheri East, Mumbai', '02240000004'),
(5, 'Bandra', 'Bandra West, Mumbai', '02240000005'),
(6, 'Borivali', 'Borivali West, Mumbai', '02240000006'),
(7, 'Dadar', 'Dadar West, Mumbai', '02240000007'),
(8, 'Ghatkopar', 'Ghatkopar East, Mumbai', '02240000008'),
(9, 'Powai', 'Powai, Mumbai', '02240000009'),
(10, 'Mulund', 'Mulund West, Mumbai', '02240000010'),
(11, 'Nashik Road', 'Nashik Road, Nashik', '02530000011'),
(12, 'Pune Central', 'Shivaji Nagar, Pune', '02040000012'),
(13, 'Nagpur Central', 'Sitabuldi, Nagpur', '07120000013'),
(14, 'Aurangabad', 'CIDCO, Aurangabad', '02400000014'),
(15, 'Kolhapur', 'Rajarampuri, Kolhapur', '02310000015'),
(16, 'Solapur', 'Railway Lines, Solapur', '02170000016'),
(17, 'Navi Mumbai', 'CBD Belapur, Navi Mumbai', '02240000017'),
(18, 'Kalyan', 'Kalyan West, Thane', '02510000018'),
(19, 'Panvel', 'Old Panvel, Navi Mumbai', '02240000019'),
(20, 'Mira Road', 'Mira Road, Thane', '02240000020');


select * from branches;


-- accountbranches
INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
VALUES
(101, 1, '2025-01-05'),
(102, 2, '2025-01-10'),
(103, 3, '2025-01-15'),
(104, 4, '2025-01-20'),
(105, 5, '2025-02-01'),
(106, 6, '2025-02-05'),
(107, 7, '2025-02-10'),
(108, 8, '2025-02-15'),
(109, 9, '2025-02-20'),
(110, 10, '2025-03-01'),
(111, 11, '2025-03-05'),
(112, 12, '2025-03-10'),
(113, 13, '2025-03-15'),
(114, 14, '2025-03-20'),
(115, 15, '2025-04-01'),
(116, 16, '2025-04-05'),
(117, 17, '2025-04-10'),
(118, 18, '2025-04-15'),
(119, 19, '2025-04-20'),
(120, 20, '2025-04-25');


select * from accountbranches;

-- loans
INSERT INTO Loans
(LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(1, 1, 250000.00, 8.50, '2025-01-10', '2030-01-10'),
(2, 2, 150000.00, 9.00, '2025-02-10', '2030-02-10'),
(3, 3, 500000.00, 7.50, '2025-03-10', '2035-03-10'),
(4, 4, 100000.00, 10.50, '2025-04-10', '2029-04-10'),
(5, 5, 300000.00, 8.00, '2025-05-10', '2032-05-10'),
(6, 6, 175000.00, 9.50, '2025-06-10', '2030-06-10'),
(7, 7, 450000.00, 7.75, '2025-07-10', '2035-07-10'),
(8, 8, 125000.00, 10.00, '2025-08-10', '2030-08-10'),
(9, 9, 600000.00, 7.25, '2025-09-10', '2036-09-10'),
(10, 10, 200000.00, 8.75, '2025-10-10', '2031-10-10'),
(11, 11, 350000.00, 8.25, '2025-11-10', '2033-11-10'),
(12, 12, 90000.00, 11.00, '2025-12-10', '2029-12-10'),
(13, 13, 400000.00, 7.90, '2026-01-10', '2034-01-10'),
(14, 14, 225000.00, 9.25, '2026-02-10', '2032-02-10'),
(15, 15, 550000.00, 7.40, '2026-03-10', '2036-03-10'),
(16, 16, 130000.00, 10.25, '2026-04-10', '2031-04-10'),
(17, 17, 275000.00, 8.60, '2026-05-10', '2032-05-10'),
(18, 18, 180000.00, 9.10, '2026-06-10', '2031-06-10'),
(19, 19, 700000.00, 6.90, '2026-07-10', '2037-07-10'),
(20, 20, 160000.00, 9.75, '2026-08-10', '2031-08-10');


select * from loans;

-- Select the banking database to perform operations
-- ऑपरेशन्स करने के लिए बैंकिंग डेटाबेस को सेलेक्ट करें
USE BankingDB1;

-- Fetch all details of the customer whose ID is exactly 5
-- उस कस्टमर की पूरी जानकारी निकालें जिसकी ID ठीक 5 है
SELECT * FROM Customers WHERE CustomerID = 5;

-- Find all accounts with a balance strictly less than 5000
-- उन सभी खातों को खोजें जिनका बैलेंस 5000 से कम है
SELECT * FROM Accounts WHERE Balance < 5000; 

-- Find all accounts where the type is anything other than 'Savings'
-- उन सभी खातों को खोजें जिनका टाइप 'Savings' को छोड़कर कुछ भी और हो
SELECT * FROM Accounts WHERE AccountType <> 'Savings';

-- Retrieve only specific columns (first name, last name, phone) from the customers table
-- कस्टमर्स टेबल से केवल खास कॉलम (first name, last name, phone) ही निकालें
SELECT FirstName, LastName, Phone FROM Customers;

-- Find savings accounts where BOTH conditions match: balance > 20000 AND account type is Savings
-- उन सेविंग्स खातों को खोजें जहाँ दोनों शर्तें पूरी हों: बैलेंस 20000 से ज़्यादा हो और अकाउंट टाइप Savings हो
SELECT * FROM Accounts WHERE Balance > 20000 AND AccountType = 'Savings';

-- Find accounts where EITHER condition matches: balance > 20000 OR account type is Savings
-- उन खातों को खोजें जहाँ कोई भी एक शर्त पूरी हो: बैलेंस 20000 से ज़्यादा हो या अकाउंट टाइप Savings हो
SELECT * FROM Accounts WHERE Balance > 20000 OR AccountType = 'Savings';

-- Find accounts that do NOT belong to the Savings category
-- उन खातों को खोजें जो Savings केटेगरी में नहीं आते हैं
SELECT * FROM Accounts WHERE NOT AccountType = 'Savings';

-- Find accounts with a balance anywhere within the inclusive range of 1200 to 25000
-- उन खातों को खोजें जिनका बैलेंस 1200 से 25000 की रेंज के बीच में हो
SELECT * FROM Accounts WHERE Balance BETWEEN 1200 AND 25000;

-- Fetch details of customers whose IDs match any value inside the specified list (1, 5, 10, 15, 21)
-- उन कस्टमर्स की डिटेल्स निकालें जिनकी ID दी गई लिस्ट (1, 5, 10, 15, 21) में से किसी से भी मैच करती हो
SELECT * FROM Customers WHERE CustomerID IN (1, 5, 10, 15, 21);

-- Find accounts whose account type does not match 'Savings'
-- उन खातों को खोजें जिनका अकाउंट टाइप 'Savings' नहीं है
SELECT * FROM Accounts WHERE AccountType NOT IN ('Savings');

-- Find customers who do not have an email address stored (missing/blank field)
-- उन कस्टमर्स को खोजें जिनका ईमेल एड्रेस स्टोर नहीं है (खाली/ब्लैंक फील्ड)
SELECT * FROM Customers WHERE Email IS NULL;

-- Find customers who have a valid email address recorded (not blank)
-- उन कस्टमर्स को खोजें जिनका वैध (valid) ईमेल एड्रेस रिकॉर्ड में मौजूद है (खाली नहीं है)
SELECT * FROM Customers WHERE Email IS NOT NULL;

-- Find customers whose first name starts with the letter 'A' or 'a'
-- उन कस्टमर्स को खोजें जिनका पहला नाम 'A' या 'a' अक्षर से शुरू होता है
SELECT * FROM Customers WHERE FirstName LIKE 'a%';

-- Find customers whose last name ends with the letter 'A' or 'a'
-- उन कस्टमर्स को खोजें जिनका आखिरी नाम (surname) 'A' या 'a' अक्षर पर खत्म होता है
SELECT * FROM Customers WHERE LastName LIKE '%a';

-- Find customers whose last name contains the letter 'A' or 'a' anywhere inside it
-- उन कस्टमर्स को खोजें जिनके आखिरी नाम में कहीं पर भी 'A' या 'a' अक्षर आता हो
SELECT * FROM Customers WHERE LastName LIKE '%a%';

-- Find customers whose first name is exactly 2 characters long
-- उन कस्टमर्स को खोजें जिनका पहला नाम सटीक 2 अक्षरों का है
SELECT * FROM Customers WHERE FirstName LIKE '__';

-- Find customers whose first name starts with 'A' and is exactly 5 characters long
-- उन कस्टमर्स को खोजें जिनका पहला नाम 'A' से शुरू होता है और कुल लंबाई सटीक 5 अक्षरों की है
SELECT * FROM Customers WHERE FirstName LIKE 'a____';

-- Sort all accounts by balance in ascending order (lowest to highest by default)
-- सभी खातों को उनके बैलेंस के हिसाब से बढ़ते क्रम में सेट करें (छोटे से बड़ा)
SELECT * FROM Accounts ORDER BY Balance ASC;

-- Sort all accounts by balance in descending order (highest to lowest)
-- सभी खातों को उनके बैलेंस के हिसाब से घटते क्रम में सेट करें (बड़े से छोटा)
SELECT * FROM Accounts ORDER BY Balance DESC;

-- Filter for Savings accounts and sort them from lowest balance to highest balance
-- केवल Savings खातों को फ़िल्टर करें और उन्हें सबसे कम बैलेंस से सबसे ज़्यादा बैलेंस के क्रम में लगाएं
SELECT * FROM Accounts WHERE AccountType = 'Savings' ORDER BY Balance ASC;

-- Filter for Savings accounts and sort them from highest balance to lowest balance
-- केवल Savings खातों को फ़िल्टर करें और उन्हें सबसे ज़्यादा बैलेंस से सबसे कम बैलेंस के क्रम में लगाएं
SELECT * FROM Accounts WHERE AccountType = 'Savings' ORDER BY Balance DESC;

-- Restrict the output window to show only the first 5 records from the accounts table
-- आउटपुट को सीमित करें ताकि अकाउंट्स टेबल के केवल पहले 5 रिकॉर्ड ही दिखाई दें
SELECT * FROM Accounts LIMIT 5;

-- Find the top 3 Savings accounts that hold the highest balances
-- सबसे ज़्यादा बैलेंस वाले टॉप 3 Savings अकाउंट्स को खोजें
SELECT * FROM Accounts WHERE AccountType = 'Savings' ORDER BY Balance DESC LIMIT 3;

-- Find the top 3 Savings accounts that hold the lowest balances
-- सबसे कम बैलेंस वाले टॉप 3 Savings अकाउंट्स को खोजें
SELECT * FROM Accounts WHERE AccountType = 'Savings' ORDER BY Balance ASC LIMIT 3;

-- Skip the first 5 records in the table and display the next 5 records (pagination)
-- टेबल के शुरुआती 5 रिकॉर्ड्स को छोड़ दें और उसके बाद के अगले 5 रिकॉर्ड्स दिखाएं
SELECT * FROM Accounts LIMIT 5, 5;

-- Retrieve the single absolute highest balance account from the database
-- डेटाबेस से सबसे अधिक (Highest) बैलेंस वाला केवल 1 खाता निकालें
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 1;

-- Retrieve the second highest balance account from the database (skip 1, take 1)
-- डेटाबेस से दूसरा सबसे अधिक (2nd Highest) बैलेंस वाला खाता निकालें (1 छोड़ें, 1 लें)
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 1, 1;

-- Retrieve the single absolute lowest balance account from the database
-- डेटाबेस से सबसे कम (Lowest) बैलेंस वाला केवल 1 खाता निकालें
SELECT * FROM Accounts ORDER BY Balance ASC LIMIT 1;

-- Retrieve the second lowest balance account from the database (skip 1, take 1)
-- डेटाबेस से दूसरा सबसे कम (2nd Lowest) बैलेंस वाला खाता निकालें (1 छोड़ें, 1 लें)
SELECT * FROM Accounts ORDER BY Balance ASC LIMIT 1, 1;

USE BankingDB1;

show tables;

-- Agrgregate function
-- sum,min,max,count,average
-- group by 

SELECT * FROM Accounts;

-- accounttypewise total balance
SELECT accounttype,sum(balance) as "total balance"
from accounts
group by accounttype;

-- accounttypewise total count balance
SELECT accounttype,count(balance) as "total count balance"
from accounts
group by accounttype;

-- distinct (unique)
SELECT Accounttype FROM accounts;

SELECT distinct accounttype FROM accounts;

-- how many account type you have
SELECT count(distinct accountid) 
from accounts
group by accounttype;

-- count total  accounts in account table
SELECT count(accountid)
from accounts
group by accounttype;

-- count total accounts for each account_type	
SELECT accounttype, count(balance) as total_no_of_accounts
from accounts
group by accounttype;

-- average balance in each accounttype
SELECT accounttype, avg(balance) as avg_of_balance
from accounts
group by accounttype;

-- highest balance in each accounttype
SELECT accounttype, max(balance) as max_of_balance
from accounts
group by accounttype;

-- lowest balance in each accounttype
SELECT accounttype, min(balance) 
from accounts
group by accounttype;

-- min balance 
SELECT  min(balance) as min_bal,
max(balance) as max_bal,
sum(balance) as sum_bal,
avg(balance) as avg_bal,
count(accountid) as total_account
from accounts;

-- find avarage bal of saving accounts by customer
SELECT accounttype ,avg(balance)
from accounts
where accounttype="savings"
group by customerid;


SELECT accounttype ,sum(balance)
from accounts
group by accounttype;

-- group by with having clause
-- find account type whose total balance
-- is greater than 100000
SELECT accounttype ,sum(balance) as total_bal
from accounts
group by accounttype
having sum(balance)>100000;



