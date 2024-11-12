drop database bank;
create database bank;
use bank;

create table branch(
branch_name varchar(25),
branch_city varchar(15),
assets int,
primary key(branch_name));

create table bank_customer(
customer_name varchar(10),
customer_street varchar(25),
customer_city varchar(15),
primary key(customer_name));

create table bank_account(
accno int,
branch_name varchar(25),
balance int,
primary key(accno),
foreign key(branch_name) references branch(branch_name));

create table loan(
loan_number int,
branch_name varchar(25),
amount int,
primary key(loan_number),
foreign key(branch_name) references branch(branch_name));

create table depositer(
customer_name varchar(25),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references bank_customer(customer_name),
foreign key(accno) references bank_account(accno));

insert into branch values('SBI_Chamrajpet','Bangalore',50000);
insert into branch values('SBI_Residency Road','Bangalore',10000);
insert into branch values('SBI_Shivaji Road','Bombay',20000);
insert into branch values('SBI_Parliment Road','Delhi',10000);
insert into branch values('SBI_Jantarmantar','Delhi',20000);

insert into bank_account values(1,'SBI_Chamrajpet',2000);
insert into bank_account values(2,'SBI_Residency Road',5000);
insert into bank_account values(3,'SBI_Shivaji Road',6000);
insert into bank_account values(4,'SBI_Parliment Road',9000);
insert into bank_account values(5,'SBI_Jantarmantar',8000);
insert into bank_account values(6,'SBI_Parliment Road',4000);
insert into bank_account values(7,'SBI_Residency Road',4000);
insert into bank_account values(8,'SBI_Parliment Road',3000);
insert into bank_account values(9,'SBI_Residency Road',5000);
insert into bank_account values(10,'SBI_Chamrajpet',2000);
insert into bank_account values(11,'SBI_Jantarmantar',1000);

insert into bank_customer values('Avinash','Bull temple Road','Bangalore');
insert into bank_customer values('Dinesh','Bannergatta','Bangalore');
insert into bank_customer values('Mohan','National college Road','Bangalore');
insert into bank_customer values('Nikhil','Akbar Road','Delhi');
insert into bank_customer values('Ravi','Prithviraj Road','Delhi');

insert into loan values(1,'SBI_Chamrajpet',1000);
insert into loan values(2,'SBI_Residency Road',2000);
insert into loan values(3,'Shivaji Road',3000);
insert into loan values(4,'SBI_Parliment Road',4000);
insert into loan values(5,'SBI_Jantarmantar',5000);

insert into depositer values('Avinash',1);
insert into depositer values('Dinesh',2);
insert into depositer values('Nikhil',3);
insert into depositer values('Ravi',4);
insert into depositer values('Avinash',5);
insert into depositer values('Nikhil',6);
insert into depositer values('Dinesh',7);
insert into depositer values('Nikhil',8);

select * from branch;
select * from bank_customer;
select * from bank_account;
select *from loan;
select *from depositer;

alter table branch change assets assets_inlakhs real;

select d.customer_name from depositer d,
bank_account b where b.branch_name = 'SBI_Residency Road' and
d.accno = b.accno group by d.customer_name
having count(d.accno) >= 2;

create view br as select branch_name,
sum(amount) from loan group by branch_name;

select * from br;

show tables;
