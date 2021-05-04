
-1.How many actors are there with the last name ‘Wahlberg’?
SELECT *
FROM actor
WHERE last_name LIKE'Wahlberg';
--Answer 2

--2.How many payments were made between $3.99 and $5.99?
SELECT COUNT (*)
FROM payment
WHERE amount > 3.99 AND amount < 5.99;
--Answer 3431

--3.What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(*)
FROM inventory
GROUP BY film_id
ORDER BY count DESC
--Answer- many movies tie for most copies, at  8 copies each
--these include film_id 193, 789, 730, 378 to name a few

--4.How many customers have the last name ‘William’?
SELECT *
FROM customer
WHERE last_name LIKE 'William';
--Answer there are no customers with last name William
--but there is one customer with first name William

--5.What store employee (get the id) sold the most rentals?
SELECT COUNT(staff_id)
FROM rental
GROUP BY staff_id;
--Answer: staff id 1 has the most sales

--6.How many different districtnamesare there?
SELECT COUNT(DISTINCT district)
FROM address;
--Answer 378


--7.What film has the most actors in it?(use film_actor tableand get film_id)
SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;
--Answer: film_id 508

--8.From store_id 1, how many customers have a last name ending with ‘es’?
--(use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 and last_name LIKE '%es';
--Answer: 13

--9.How many payment amounts(4.99, 5.99, etc.) 
--had a number of rentals above 250 for customers with ids between 380 and 430?
--use group by and having > 250
SELECT amount, COUNT(amount) AS count_per_payment_amount
FROM payment
WHERE customer_id >380 AND customer_id <430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
--Answer: There are three payment amounts: 4.99, 2.99 and 0.99


--10.Within the film table, how many rating categories are there? 
--And what rating has the most moviestotal?
SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT DESC;
--Answer: there are 5 raiting categories
--Answer: PG-13 has the most movies

