# Lab | SQL Queries - Lesson 2.6

# INSTRUCTIONS

SHOW DATABASES;
USE sakila;
SHOW TABLES;

#	1. Get release years.

SELECT DISTINCT release_year 
FROM film;

#	2. Get all films with ARMAGEDDON in the title.

SELECT * FROM film
WHERE title LIKE '%ARMAGEDDON%';

#	3. Get all films which title ends with APOLLO.

SELECT * FROM film
WHERE title REGEXP 'APOLLO$';

#	4. Get 10 the longest films.

SELECT * FROM film
ORDER BY length DESC
limit 10;

#	5. How many films include Behind the Scenes content?

SELECT COUNT(special_features) FROM film
WHERE special_features LIKE '%Behind the Scenes%';

#	6. Drop column picture from staff.

 SELECT * FROM staff
 ALTER TABLE staff
 DROP COLUMN picture;
 
#	7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT * FROM customer; 				# checar como esta la tabla de customer

SELECT * FROM customer
WHERE first_name LIKE '%TAMMY%';		# Checar que aparezca Tammy como cliente

INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, last_update)
SELECT first_name, last_name, address_id, email, store_id, active, "Tammy", last_update FROM customer  	# Relacionar la info de Tammy de la tabla de customer a la tabla de staff
WHERE address_id = '79';

SELECT * FROM staff; 					# Confirmas que ya aparezca en staff


#	8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for
#		the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would
#		need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
#		To get that you can use the following query:
#			- select customer_id from sakila.customer
#			- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#			- Use similar method to get inventory_id, film_id, and staff_id.


SELECT customer_id FROM sakila.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

SELECT inventory_id FROM sakila.inventory
WHERE inventory_id = 1;

SELECT film_id FROM sakila.film 
WHERE title = "Academy Dinosaur";

SELECT * FROM film;

INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, staff_id)
VALUE (curdate(), '1', '130', '1'); 

SELECT * FROM rental;

#	9. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users 
#		that would be deleted. Follow these steps:

#			- Check if there are any non-active users

SELECT * FROM customer
WHERE active = 0;
----------------------------------------------------------------------------------------------------------------------
#			- Create a table backup table as suggested
#			- Insert the non active users in the table backup table


CREATE TABLE deleted_users  # crear la tabla
AS SELECT *
FROM customer				# pasar a la tabla "deleted_users" los usuarios que no estan activos (activos=0) de la tabla "customer"
WHERE Active = 0;

SELECT * FROM deleted_users;

----------------------------------------------------------------------------------------------------------------------

#			- Delete the non active users from the table customer


SELECT * FROM customer;

SET FOREIGN_KEY_CHECKS=0; # disable restriction of key delete
#SET FOREIGN_KEY_CHECKS=1;

DELETE FROM customer
WHERE active='0'; 


