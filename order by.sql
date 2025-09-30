use sakila;

select * from payment;
select customer_id, sum(amount) from payment group by customer_id;

select customer_id, amount, count(amount) from payment group by customer_id, amount;

-- how much amount spent each year 

select * from payment; 

select year(payment_date),staff_id, sum(amount) from payment group by year(payment_date), staff_id; 


-- order by (sort) 

select * from payment order by customer_id desc;

select * from payment order by customer_id desc, amount desc;


-- conditional functions

select customer_id, amount,  if(amount>3,  "high", "low") from payment;


select customer_id, amount,  if(amount=2.99,  "high", if(amount=5.99,"avg", "low")) from payment;


select customer_id, amount,
	case
		when amount=2.99 then "high"
		when amount=5.99 then "avg"
		else "low"
    end as col
from payment;    


select customer_id,
	case
		when customer_id>4 then "hello"
		when customer_id>1 then "user"
		else "regex"
    end as col
from payment;    


