-- Query to get access to (Actor): First/Last Names, actor_id
-- (Film): film_id, title, description, length, rating

SELECT actor.actor_id, actor.first_name, actor.last_name, film.film_id, film.title, film.description, film.length, film.rating
FROM actor
FULL JOIN film_actor
ON actor.actor_id = film_actor.actor_id
FULL JOIN film
ON film.film_id = film_actor.film_id;

-- Query to get access to info about a customer
-- Who comes from the country of Angola
SELECT country_id, country
FROM country
WHERE country = 'Angola';

SELECT city, city_id, country_id
FROM city
WHERE country_id = 4;

SELECT first_name, last_name, email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

-- SubQuery Examples

-- Split up the two queries (which will become a subquery later)

-- Query #1: Find a customer_id that has an amount greater than
-- 175 in total payments
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- Query #2: Find ALL customer data
SELECT *
FROM customer;

-- Query for the Subquery: To Find the 6 customers that have 
-- A total amount of payments greater than 175
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);