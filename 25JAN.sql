
USE sakila;

# How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT fc.category_id, c.name , COUNT(fc.film_id) AS film_count
FROM film_category fc
JOIN category c ON fc.category_id=c.category_id
GROUP BY category_id;



# Display the total amount rung up by each staff member in August of 2005.
SELECT staff.first_name, SUM(payment.amount)
FROM staff 
JOIN payment ON staff.staff_id=payment.staff_id
WHERE payment.payment_date LIKE ("2005-08%")
GROUP BY staff.first_name;




# Which actor has appeared in the most films?

SELECT first_name, last_name, COUNT(film_id) AS most_film
FROM actor a
JOIN film_actor fa
GROUP BY first_name, last_name
ORDER BY most_film DESC
LIMIT 1;

#Most active customer (the customer that has rented the most number of films)

SELECT first_name, last_name, COUNT(rental_id) AS most_rented
FROM customer c
JOIN rental r 
GROUP BY first_name, last_name
ORDER BY most_rented DESC
LIMIT 1;

#Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address_id
FROM sakila.staff;

#List each film and the number of actors who are listed for that film.
SELECT f.title AS title, COUNT(fa.actor_id) AS number_of_actors
FROM sakila.film 
JOIN sakila.film_actor fa USING (film_id)
GROUP BY title;

# Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT concat(c.last_name,' ',c.first_name) AS customer_name, SUM(p.amount) AS total_paid
FROM sakila.customer c
JOIN sakila.payment p USING (customer_id)
GROUP BY c.customer_id 
ORDER BY c.last_name ASC;

# List the titles of films per category.
SELECT f.title AS title , c.name AS category_name
FROM sakila.film_category fc
JOIN sakila.category c USING (category_id)
JOIN sakila.film f USING (film_id)
GROUP BY c.name, f.title;