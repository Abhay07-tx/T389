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