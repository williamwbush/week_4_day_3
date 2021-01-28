-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';
-- 5 customers

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;
-- 1406 payments

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);
-- 6 customers

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Kevin Schuler


-- 5. Which staff member had the most
-- transactions?
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;

SELECT first_name, last_name
FROM staff
WHERE staff_id = 2;
--Jon Stephens

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;
-- G 178, PG 194, PG-13 223, R 195, NC-17 210

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT customer_id
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
)
ORDER BY customer_id ASC;
-- 539 customers

-- 8. How many free rentals did our stores give away?
SELECT COUNT(payment_id)
FROM payment
WHERE amount = 0;
-- 24
