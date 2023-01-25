# Lab | SQL Queries - Lesson 2.5

# INSTRUCTIONS: 

SHOW DATABASES;
USE sakila;
SHOW TABLES;

#	1. Select all the actors with the first name ‘Scarlett’.

SELECT *
FROM actor
WHERE first_name='SCARLETT';

#	2. How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(film_id) FROM inventory; # Available for rent

SELECT COUNT(rental_id) FROM payment; # Films that have been rented

#	3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT max(length) AS max_duration, 
min(length) AS min_duration
 FROM film;

#	4. What's the average movie duration expressed in format (hours, minutes)?

SELECT 
floor(AVG(length)/60 ) AS hours,
floor(AVG(length)%60) AS minutes
FROM film;

#	5. How many distinct (different) actors' last names are there?

SELECT count(DISTINCT last_name)
From actor;

#	6. Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(CURDATE(), rental_date) AS days_open
FROM rental;

#	7. Show rental info with additional columns month and weekday. Get 20 results.

select *,
date_format(convert(rental_date,datetime) , "%M") as month,
date_format(convert(rental_date,datetime) , "%W") as day
from rental
limit 20;

#	8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, 
case 
  when date_format(convert(rental_date,datetime) , "%W")='Sunday' OR 'Saturday' then 'weekend'  
  else 'workday'  
end as day_type
from rental;

#	9. How many rentals were in the last month of activity?

SELECT
COUNT(RENTAL_ID)
FROM rental
WHERE MONTH(rental_date)= 5; # Month five (may) in dicember there were 0 rentals
