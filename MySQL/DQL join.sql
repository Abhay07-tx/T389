use bankingdb;
select c.customerid,
c.firstname,c.lastname,a.accounttype,a.balance from customers c join accounts a on c.customerid=a.customerid;

select c.customerid,
c.firstname,c.lastname,a.accounttype,a.balance from customers c left join accounts a on c.customerid=a.customerid;

select c.customerid,
c.firstname,c.lastname,a.accounttype,a.balance from customers c right join accounts a on c.customerid=a.customerid;


select c.customerid,
c.firstname,c.lastname,a.accounttype,a.balance from customers c cross join accounts a;