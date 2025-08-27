-- ddl statement with constrainits
-- constraints
-- rules apply to table -- accurate -- invalid restrict

-- not null constraint

use regex;
drop table test1;
create table test1(id int, salary int not null);
insert into test1 values(10,900);
insert into test1 values(11,null);
insert into test1 values(null,1881);
select * from test1;

----- default 
drop table test2;
create table test2(id int default 0, salary int not null);
insert into test2 values(10,900);
insert into test2(salary) values(1881);
select * from test2;

----
drop table test3;
create table test3(id int, salary int default 100 unique);
insert into test3 values(10,900);
insert into test3 values(11,900); -- error here
insert into test3(id) values(1999991);
insert into test3(id) values(20012);
select * from test3;


-----
drop table test4;
create table test4(id int primary key, salary int);
insert into test4 values(10,900);
insert into test4 values(10,90012); -- error here
insert into test4 values(null); -- error
select * from test4;


-----
drop table studentinfo;


-- ------------
drop table course1;
create table courses1( course_id int primary key, cname varchar(20));
insert into courses1 values(10, 'DSA'), (11, 'python');
select * from courses1;

-- creating foreing key here
create table studentinfo(sid int primary key, sname varchar(20),
	courseid int,
    foreign key (courseid) references courses1(course_id) );
    
insert into studentinfo values(1, 'tushar',10);
insert into studentinfo values(2, 'aman',11);
insert into studentinfo values(3, 'ama12n',13);

select * from studentinfo;

