-- like operator ( pattern ke according data filter)

use sakila;

-- % ( wildcard character) : zero or more character 

select * from actor where first_name like 'N%' ;  -- START N

select * from actor where first_name like '%S' ;  -- ENDING S

select * from actor where first_name like 'S%T' ; -- START S AND FINISH T

select * from actor where first_name like '%S%' ;  -- MIDDLE START savepoint

-- ( _ ) : EXECTLY ONE CHARACTER 

select * from actor where first_name like 'E_'  ;   -- ONLY TWO CHARACTER 

select * from actor where first_name like 'A___%' ; 

select * from actor where first_name like '_A%';  -- FIRST CHARACTER KUCH BHI HO SECOND A START AND LAST 


-- GET THE ACTOR ID AN FIRST NAME WHERE THE LAST WORD SHOULD BE TE execute
select * from actor where first_name like '%TE';

--  GET THE ACTOR ID FIRST NAME WHERE THE NN SOULD BE MIDDLE 
select * from actor where first_name like '%NN%';

-- GET THE FIRST NAME LAST NAME WHERE THE LAST NAME COLUMN THE FIRST WORD B AND THE SECOND LAST WORD R 
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE 'B%_R%';

-- GET ALL THE USER INFORMATION WHERE THE FIRST NAME WILL HAVE FOUR CHARACTER 

select * from actor where first_name like '____%';

-- GET ALL THE COLUMN WHERE THE ACTOR ID IS FROM 2 TO 19 AND THE FIRST NAME S SHOULD BE PRESENT IN THE MIDDLE A SHOULD BE THE LAST SECOND CHARACTER 

select * from actor where ACTOR_ID BETWEEN 2 AND 90 AND   first_name like '_%S%A_';


-- FUNCTION 

-- INBUILT FUNCTIONS
-- SCALER FUNCTION (ROW FUNCTION ) 
-- MULTIPLE ROW FUNCTION

-- APPLY ON EACH ROW AND RETURN THE OUTPUT FOR EACH ROW

-- total character in each first_name
select first_name, char_length(first_name) from actor;

select first_name, char_length(first_name), lower(first_name) from actor;

select first_name, last_name, concat(first_name, ' ' ,last_name) from actor;

select first_name, last_name, concat('MR/MRS', ' ',first_name, ' ' ,last_name) from actor;

select first_name, last_name, concat_ws(' ','MR',' ',first_name, ' ' ,last_name) from actor;



-- substring ( to extract some data )
-- column ,position,  total character
 
select first_name, substr(first_name,3) from actor;

select first_name, substr(first_name,3), substr(first_name,3,2) from actor;

select first_name, substr(first_name,-4,2) from actor;