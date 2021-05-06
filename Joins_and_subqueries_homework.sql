--1.List all customers who live in Texas (use JOINs)
SELECT customer.first_name, customer.last_name, address.district, address,city_id
FROM customer
JOIN address
ON address.address_id =  customer.address_id
WHERE address.district = 'Texas';
--Answer- Jennifer Davis, Kim Cruz, Richard Mccray, Bryan Hardison, and Ian Still

--2. Get all payments above $6.99 with the Customer’s full name
SELECT customer.first_name, customer.last_name, payment.amount, payment.payment_date
FROM payment
JOIN customer
ON customer.customer_id = payment.customer_id
WHERE payment.amount > '6.99';
--Run above to see Answer

--3. Show all customer names who have made payments over $175 (use subqueries)
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN(
	SELECT payment.customer_id
	FROM payment
	GROUP BY payment.customer_id
	HAVING SUM (payment.amount) > '175'
);
--Answer: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collaxo and Karl Seal

--4. List all customers that live in Nepal (use the city table)
--Napal is country_id number 66
SELECT customer.first_name, customer.last_name, address.address_id 
FROM customer
JOIN address
ON address.address_id = customer.address_id
WHERE address.city_id IN (
	SELECT city.city_id
	FROM city
	WHERE city.country_id = '66'
);
--Answer, looks like there's only one customer who lives in Napal and his name is Kevin Schuler

--5. Which staff member had the most transactions?
SELECT staff.staff_id, staff.first_name, staff.last_name
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(*) DESC;
--Answer: Jon Stephens


--6. What film had the most actors in it?
SELECT film.film_id, film.title, COUNT(*)
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY COUNT(*) DESC;
--Answer- Lambs Cincinatti

--7. Which actor has been in the least movies?
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(*)
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY COUNT(*);
--Answer: Emily Dee has been in 14 movies, the least of any actor.

--8. How many districts have more than 5 customers in it?
SELECT address.district, COUNT(*)
FROM address
JOIN customer
ON customer.address_id = address.address_id
GROUP BY address.district 
ORDER BY COUNT(*) DESC;
--Answer- 9 districts have more than 5 customers
