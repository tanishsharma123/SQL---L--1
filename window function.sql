use tushar;
-- windows function
-- row number
select *, row_number() over() from employeesales;

select *, row_number() over(partition by department) from employeesales;

-- rank 

select *, rank() over(order by saleamount) from employeesales;

select *, rank() over(partition by department order by saleamount desc) from employeesales;

-- dense rank 
select *, rank() over(partition by department order by saleamount desc),
dense_rank() over(partition by department order by saleamount desc) from employeesales;

with datarank as 
(select *,
dense_rank() over(order by saleamount desc) as `ranks` from employeesales)
select * from datarank where ranks=2;

with datarank as 
(select *,
dense_rank() over(partition by department order by saleamount desc) as `ranks` from employeesales)
select * from datarank where ranks=2;

-- lag and lead
select *, lead(saleamount,2) over() from employeesales;

select *, lag(saleamount,1) over() from employeesales;

-- 
insert into employeesales values(1, 'Alice', 'Sales', '2025-06-2', 600.00);
select*, lag(saleamount) over(partition by department, employeename),
saleamount-lag(saleamount) over(partition by department, employeename) from employeesales;


select*,
lead(saleamount) over(partition by department, employeename order by saledate)
 from employeesales where  employeename ='Alice' and department = 'sales';
 
 
select*,
lead(saledate) over(partition by department, employeename order by saledate) as nextdate,
datediff(lead(saledate) over(partition by department, employeename order by saledate),saledate)
 from employeesales where  employeename ='Alice' and department = 'sales';







