SHOW DATABASES;

# 1.Use sakila database.
USE sakila;

# CONFIRMAR QUE SE IMPORTO BIEN LA INFORMACION
SHOW TABLES;
SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM film_text;


# 2.Get all the data from tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

# 3. Get film titles.
SELECT title FROM film;

# 4. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the
#    language per each film, but this is a good time to think about how you might get that information in the future.
SELECT language_id AS language FROM film;

# 5. 
#	5.1 Find out how many stores does the company have?
SELECT 'Number of stores', COUNT(*) FROM sales_by_store;

#	5.2 Find out how many employees staff does the company have?
SELECT 'Number of employees', COUNT(*) FROM staff;

#	5.3 Return a list of employee first names only?
SELECT (first_name) AS FIRST_NAME FROM staff;


