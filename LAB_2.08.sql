# Lab | SQL Queries 8

USE SAKILA;

# INSTRUCTIONS

#	1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.

SELECT title, length, RANK() OVER (ORDER BY length DESC) AS "rank"
FROM sakila.film;

#	2. Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the 
#		columns title, length, rating and rank.

SELECT rating, title, length , RANK() OVER (PARTITION BY rating ORDER BY length DESC) 
FROM film
WHERE length IS NOT NULL or '0';

#	3.How many films are there for each of the categories in the category table?
#		 HINT: Use appropriate join between the tables "category" and "film_category".

select * from film_category;

SELECT category_id, count(*) FROM film
JOIN film_category
ON film.film_id = film_category.film_id
GROUP BY category_id;

#	4. Which actor has appeared in the most films? 
#		HINT: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

SELECT actor.actor_id, actor.first_name, actor.last_name,
       COUNT(actor_id) AS film_count
FROM actor 
JOIN film_actor USING (actor_id)
GROUP BY actor_id
ORDER BY film_count DESC
limit 1;

#	5. Which is the most active customer (the customer that has rented the most number of films)? 
#		HINT: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

SELECT customer.first_name, customer.last_name, count(customer_id) AS film_count2 FROM customer
INNER JOIN rental USING (customer_id)
GROUP BY customer_id
ORDER BY film_count2 DESC
LIMIT 1;

#	Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).

#	This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.

#	HINT: You can use join between three tables - "Film", "Inventory", and "Rental" and count the rental ids for each film.