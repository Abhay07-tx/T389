CREATE TABLE information(Cust_ID int Not Null,
Name varchar (20) Not Null,
Country varchar (20) Not Null,
City varchar (20));

desc information;

Create TABLE cust_info(
cust_id int primary key,
cust_mame varchar (20) not null,
mobile_no bigint unique);

desc cust_info;

-- Drop database

-- Drop table

show tables;

drop table information;

desc information;

-- drop database
drop database cust_info;

show databases;