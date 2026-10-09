create database emp_info;

use emp_info;

CREATE TABLE employee(id int,
name varchar(20),
mobile_no varchar(20));

desc employee;

-- alter to change colmn_name (change clause)
ALTER TABLE employee
CHANGE name ename varchar(20));

-- alter to change datatype of colmn and change constraints
ALTER TABLE employee modify mobile_no bigint unique;

desc employee;

-- add new column email_id
alter table employee add email_id varchar(30);

-- how to add new colmn in between
alter table employee add lastname varchar(20) after id;

alter table employee add emp_id int first;

alter table employee add primary key(emp_id);

-- alter with drop
alter table employee drop primary key;

desc employee;

-- alter with drop
alter table employee drop id;
