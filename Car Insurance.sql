drop database insurance;
create database insurance;
use insurance;

create table person(
driver_id varchar(20),
name varchar(20),
address varchar(20),
PRIMARY KEY(driver_id)
);

create table car(
reg_num varchar(20),
model varchar(20),
year int,
primary key(reg_num)
);

create table accident(
report_num int ,
accident_date date,
location varchar(20),
primary key(report_num)
);

create table owns(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);

create table participated(
driver_id varchar(20),
reg_num varchar(20),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);

insert into person values('A01','Richard','Srinivas nagar');
insert into person values('A02','Pradeep','Rajaji nagar');
insert into person values('A03','Smith','Ashok nagar');
insert into person values('A04','Venu','N R colony');
insert into person values('A05','John','Hanumanth nagar');

select * from person;

insert into car values('KA052250','Indica','1990');
insert into car values('KA031181','Lancer','1957');
insert into car values('KA095477','Toyota','1998');
insert into car values('KA053408','Honda','2008');
insert into car values('KA041702','Audi','2005');

select * from car;

insert into accident values(11,'2003-01-01','Mysore Road');
insert into accident values(12,'2004-02-02','South End Circle');
insert into accident values(13,'2003-01-21','Bull Temple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2004-03-05','Kanakpur Road');

select * from accident;

insert into owns values('A01','KA052250');
insert into owns values('A02','KA031181');
insert into owns values('A03','KA095477');
insert into owns values('A04','KA053408');
insert into owns values('A05','KA041702');

select * from owns;

insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA031181',12,50000);
insert into participated values('A03','KA095477',13,25000);
insert into participated values('A04','KA053408',14,3000);
insert into participated values('A05','KA041702',15,5000);

select * from participated;

update participated
set damage_amount = 25000
where reg_num = 'KA031181' and report_num = 12;

select count(distinct driver_id) CNT
from participated a, accident b
where a.report_num = b.report_num and b.accident_date like '2008%';

insert into accident values(16,'2008-03-08','Domlur');
select * from accident;

select accident_date,location from accident;

select driver_id from participated
where damage_amount >= 25000;

select * from participated order by damage_amount desc;

select avg(damage_amount) from participated;

delete from participated where damage_amount < (select avg(damage_amount) from participated);

SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID AND
DAMAGE_AMOUNT > (SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);


SELECT MAX(DAMAGE_AMOUNT) FROM PARTICIPATED;





