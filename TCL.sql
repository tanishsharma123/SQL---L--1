-- tcl (transaction control language)
-- transaction - logical statement
-- control / manage

create database testing12;
use testing12;
create table xyz(id int, name varchar(20));
insert into xyz values(11,'aman'),(12,'user');
select * from xyz;
start transaction;
insert into xyz value(99,'raj');
select * FROM xyz;
commit; -- now it will be parmanently saved

start transaction;
set sql_safe_updates = 0; -- safe mod disable
delete from xyz;
insert into xyz values(10001,'haha');
select * from xyz;
rollback; -- revert the tansaction

start transaction;
insert into xyz values(102,'jja');
select * from xyz;
create table yash123(id int);

start transaction;
update xyz set name="raj";
savepoint raj_savepoint;
insert into xyz values(123,'sdgsd');
rollback to raj_savepoint;
select * from xyz;

-- transaction
/*
transactionn start
ddl, dml
transaction end

1) autocommit => disable / write (start transaction)
2)
3)end (commit; rollback; ddl statement dcl statemnt)
-- commit store data parmanently
 -- rollback discard the changeg 
 */
 
 CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
    (1, 'John Doe', NULL),
    (2, 'Jane Smith', 1),
    (3, 'Peter Jones', 1),
    (4, 'Sarah Davis', 2),
    (5, 'Michael Brown', 2),
    (6, 'Emily White', 3),
    (7, 'David Garcia', 4);
    
WITH RECURSIVE cte AS (
    -- Anchor member: employees who have no manager (top-level managers)
    SELECT 
        emp.employee_id, 
        emp.employee_name, 
        emp.employee_name AS managerchain
    FROM employees AS emp
    WHERE emp.manager_id IS NULL

    UNION ALL

    -- Recursive member: employees who report to someone
    SELECT 
        emp.employee_id, 
        emp.employee_name, 
        CONCAT(mgr.managerchain, ' -> ', emp.employee_name) AS managerchain
    FROM employees AS emp
    INNER JOIN cte AS mgr 
        ON emp.manager_id = mgr.employee_id
)
SELECT *
FROM cte;

-- grand revoke and roll