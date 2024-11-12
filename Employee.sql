drop database Employee;
create database Employee;
use Employee;

create table dept(
dno varchar(20),
dname varchar(20),
dloc varchar(20),
primary key(dno));

create table employee(
empno int,
ename varchar(20),
mgrno int,
hiredate varchar(20),
sal float,
dno varchar(20),
primary key(empno,dno),
foreign key(dno) references dept(dno));

create table incentives(
empno int,
indate varchar(20),
inamount float,
primary key(empno,indate),
foreign key(empno) references employee(empno));

create table project(
pno int,
ploc varchar(20),
pname varchar(20),
primary key(pno));

create table assignedto(
empno int,
pno int,
job_role varchar(20),
primary key(empno,pno),
foreign key(empno) references employee(empno),
foreign key(pno) references project(pno));

insert into dept values(1,'CSE','Bangalore');
insert into dept values(2,'ISE','pg');
insert into dept values(3,'CSDS','pj');
insert into dept values(4,'ECE','Hyderabad');
insert into dept values(5,'AIML','Hyderabad');

insert into employee values(101,'praveen',100,'1999-01-12',100000,1);
insert into employee values(201,'bharath',200,'2020-01-17',50000,2);
insert into employee values(301,'naveen',100,'2004-09-01',30000,3);
insert into employee values(401,'rohan',101,'2000-08-03',10000,4);
insert into employee values(501,'dinesh',101,'2008-02-29',90000,5);

insert into incentives values(101,'2004-03-12',50000);
insert into incentives values(201,'2024-03-12',25000);
insert into incentives values(401,'2019-11-12',5000);

insert into project values(10,'Bangalore','chatbot');
insert into project values(40,'Delhi','ml model');
insert into project values(50,'Bombay','blockchain');
insert into project values(30,'Hyderabad','stocks');
insert into project values(80,'Mysose','android app');

insert into assignedto values(101,10,'devops');
insert into assignedto values(201,40,'sde');
insert into assignedto values(301,50,'manager');
insert into assignedto values(401,30,'jpa');
insert into assignedto values(501,80,'pa');

select *from dept;
select *from employee;
select *from incentives;
select *from project;
select *from assignedto;

show tables;

select a.empno from assignedto a 
where a.pno = any(select pno from 
project where ploc in (
'Bangalore','Hyderabad','Mysose'));

select e.empno from employee e
where e.empno != all(select 
i.empno from incentives i);

select e.empno,e.ename,d.dname,a.job_role,d.dloc,p.ploc 
from employee e,dept d,assignedto a,project p
where e.dno = d.dno and e.empno = a.empno and
a.pno = p.pno and d.dloc = p.ploc;
