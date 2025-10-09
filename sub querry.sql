-- a Subquery  also known as an inner query or nested query
-- subquery is execute first
-- It help you to manipulate data on dynamic conditions.

use sakila;

select * from actor;

select first_name from actor where actor_id = 3;

select * from actor where first_name='ED';

select * from actor where first_name=(select first_name from actor where actor_id = 8);
select amount from payment where payment_id = 3;
select * from payment where amount = (select amount from payment where payment_id = 9);

-- get the payment id amount and payment date were rental_id = 1476
select amount from payment where rental_id= 1476;
select payment_id, amount from payment where amount = (select amount from payment where rental_id= 1476);
select payment_id, amount, payment_date from payment where rental_id = 1476;


-- get the pay_id amount and paydate where the month of the table = the month of payment id 4

select month(payment_date) from payment where payment_id = 4;
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    MONTH(payment_date) = (SELECT 
            MONTH(payment_date)
        FROM
            payment
        WHERE
            payment_id = 4);
            
            
-- > ,>= , < , <= , !=
-- scaler subquery [when a subquery return only 1 row]

-- get the pay_id and amount from the table where the amount = the max amount from the table

select max(amount) from payment;
select payment_id , amount from payment  where amount= 11.99;

