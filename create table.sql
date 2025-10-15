-- subquery
-- constraints

-- not null 

create database regexdb;

use regexdb;

create table test (id int);

insert into test values(10),(11),(10),(null);
select count(*), count(id) from test;

create table test2 (id int not null);
insert into test2 values(10),(11),(10);
insert into test2 values(null),(12); -- this will give erroe

create table test3 (id int unique);
insert into test3 values(10),(11),(10); -- duplicate values

create table test4 (id int, gender varchar(20));
insert into test4(id) values (10);
select * from test4;

create table test5 (id int, gender varchar(20) default 'male'); -- default
insert into test5(id) values (10);
select * from test5; 

create table test6 (id int check (id>5) , gender varchar(20) ); -- check
insert into test6(id) values (10);
select * from test6; 

create table test6 (id int check (id>5) , gender varchar(20) ); -- check => operator use
insert into test6(id) values (10);
insert into test6(id) values(3); -- this will give error
select * from test6; 

create table test7 (id int check (id>5) , gender varchar(20) check (gender in ('male' , 'female')) ); -- check 
insert into test7(id,gender) values (10,'male');
select * from test7; 

create table test7 (id int check (id>5) , gender varchar(20) check (gender in ('male' , 'female')) ); -- check 
insert into test7(id,gender) values (10,'male');
insert into test7(id,gender) values (11,'transgender'); -- this give will error 
select * from test7; 

create table test8 (id int check (id>5) , gender varchar(20) , -- check 
constraint db_test8_gender_chk check(gender in ('male', 'female')));
insert into test8(id,gender) values (10,'male');
insert into test8(id,gender) values (11,'transgender'); 
select * from test8;

create table test9 (id int primary key check (id>5) , gender varchar(20) , -- check 
constraint db_test9_gender_chk check(gender in ('male', 'female'))); -- constraint name 

insert into test9(id,gender) values (10,'male');
insert into test9(id,gender) values (11,'transgender'); 
select * from test9;

create table product(pid int primary key, pname varchar(20)); -- foreign key
insert into product values(101,'iphone');
insert into product values(102,'ipad');
select * from product;

-- with foreign key 
create table order2(order_id int,price int, pid int foreign key pid references (product(pid));
insert into orders2 values(1981,200,101), (1982, 250, 102) , (1983,275,101) , (1984, 500, 108);
select * from orders2;

create table orders(order_id int primary key,price int, pid int); -- foreign key
insert into orders values(1981,200,101), (1982, 250, 102) , (1983,275,101) , (1984, 500, 108);
select * from orders;

--  we have create 2 table employee were epid is primery key , name, email that unique name it constraint
-- department dpid as unique, and department name with check it should be biology or physics
-- in the department try to insert null value column

CREATE TABLE employee (epid INT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(100) UNIQUE);

CREATE TABLE department (dpid INT UNIQUE,department_name VARCHAR(50) CHECK (department_name IN ('biology', 'physics')));

INSERT INTO department (dpid, department_name) VALUES (1, NULL);
select * from employee;
