show databases;  -- will show all database in mysql

use sakila;  -- use sakila as a database

-- show table to see all tables
show tables;

-- select statement (DQL)
select * from actor;   -- * access all column 

describe actor; -- will give table info (column, datatype, relationship and more )

select actor_id, first_name from actor;  -- select statement table it can be in any case format 

select actor_id, first_name,
actor_id, last_name
from actor;


select actor_id, first_name, actor_id*5 from actor; -- don't create new column in original data

select * from actor where actor_id=5;

select * from actor where first_name='NICK';  -- DATA SHOULD BE CASE SENSETIVE

select actor_id, last_name, first_name from actor where last_name='DAVIS';

-- not equl to
select * from actor where actor_id!=5;
select * from actor where actor_id<>5;

-- and dono condition shi honi chaiye
select * from actor where first_name='NICK' and actor_id=44;

-- or 
select * from actor where first_name='NICK' or actor_id=46;

select * from actor where first_name='NICK' or actor_id!=46;

select * from actor where actor_id>=2 and actor_id<=6;

select * from actor where actor_id<2 and actor_id<6;

select * from actor where actor_id not between 2 and 6;   -- lower to higher

select * from actor where actor_id in (2,8,19);

select * from actor where first_name in ('NICK', 'ED', 'DAVIS');

-- FROM THEW ACTOR TABLE THAT THE FIRST NAME AT ACTOR ID GUINESS LAST NAME

-- GET THE ACTOR ID AN THE FIRST NAME WHERE THE ACTOR ID IS FROM VALUE 3 TO 18 OR THE NAME SHOULD NOT BE ED 

-- GET THE LAST NAME ACTOR ID AND FIRST NAME WHERE THE FIRST NAME IS EITHER NICK OR GRACE


