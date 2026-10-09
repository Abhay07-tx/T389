Create database sample;
use sample;

CREATE TABLE Customer (
customer_id INT PRIMARY KEY,
Customer_name VARCHAR(50) not null,
email varchar (100) UNIQUE,
phone VARCHAR (15) UNIQUE,
address VARCHAR (100),
city VARCHAR (50),
Account_Type VARCHAR (20) NOT NULL,
balance DECIMAL(10,2) DEFAULT 0,
Status VARCHAR (20) DEFAULT 'Active'
);

desc customer;

INSERT INTO customer
(customer_id, customer_name, email,
phone, address, city, account_type, balance,status)
value
(101, 'rahul sharma', 'rahul@gmail.com', '9876543210',
'MG road', 'Mumbai', 'saving', 25000.00, 'Active');

select * from customer;

insert into customer values(102,"akash patil","akash@gmail.com","9876542312","karve nagar","thane","saving",20000.00,"Active");

alter table customer
add email varchar(50) after customer_name;

insert into customer values(103,"pooja patil","pooja@gmail.com","9876542110","abc nagar","thane","saving",35000.00,"Active"),
(104,"neha patil","nehaa@gmail.com","9876542211","efd nagar","thane","saving",40000.00,"Active");

insert into customer values(105,"tiger patil","tiger@gmail.com","9876522110","abc nagar","thane","saving",55000.00,"Active"),
(106,"hritik patil","hritik@gmail.com","9876142211","efd nagar","thane","saving",10000.00,"Active");

INSERT INTO customer
(customer_id, customer_name, address, city, account_type, balance,status)
value
(107, 'om sharma',
'MG road', 'Mumbai', 'saving', 25000.00, 'Active');

-- delete cust_id=1
delete from customer where customer_id=107; 

insert into customer values(107,"llll patil","llll@gmail.com","9876542312","karve nagar","mumbai","saving",20000.00,"Active");

-- update
update customer SET city="mumbai",address="karve nagar"
where customer_id="107";

select * from customer;

-- update
update customer SET city="mumbai",address="karve nagar"
where customer_id="107";

-- update
update customer SET city="thane",address="abc nagar"
where customer_id="107";

-- truncate :- delete all recored from table 
truncate table customer;

-- drop :- delete all recored with structure from database
drop table customer;

use sample;

Create Table Employee (
Employee_ID INT, 
Employee_Name VARCHAR (50),
Email VARCHAR (100),
Department VARCHAR(50),
Salery decimal (10,2),
city varchar (50)
);

-- add primary key

ALTER TABLE employee
add constraint empid_pk PRIMARY KEY (employee_id);

desc employee;

-- add unique key
alter table employee
add constraint email_uk UNIQUE (email);

-- add not null
alter table employee 
modify column employee_name varchar(50) not null;

-- add default
alter table employee
alter city set default "mumbai";

-- add check constraint
alter table employee 
add constraint sal_chk check(salery>0);

-- create table department (dept_id(PK),dept_name)
-- child table employee(employee_id(PK),dept_id(FK))

DESC employee;

alter table employee
DROP column department;

alter table employee
add column dept_id INT;

create table department(
dept_id int PRIMARY KEY,
dept_name varchar(20));

-- add foreing key
alter table employee
add constraint deptid_fk
foreign key(dept_id)
references department(dept_id)
ON DELETE cascade
ON update cascade;

desc department;

desc employee;

-- 5 recored in department

insert into department
values(102,"HR"),(103,"mkt"),(104,"sales"),(105,"Finance");

desc department;

insert into employee
values
(1,"akash","akash@gmail.com",50000,"mumbai",101),
(2,"neha","neha@gmail.com","25000","thane",101),
(3,"pratik","pratik@gmail.com","100000","pune",102),
(4,"prachiti","prachiti@gmail.com",56000,"nagpur",104),
(5,"nikhil","nikhil@gmail.com",70000,"pune",105);

select * from employee;