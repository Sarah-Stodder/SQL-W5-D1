--1. How many actors are there with the last name ‘Wahlberg’? 
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

--Answer: 2
--2. How many payments were made between $3.99 and $5.99? 
SELECT COUNT(amount)
FROM payment
WHERE 3.99 < amount and amount < 5.99;

--Answer 3427
--3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

SELECT title, film_id
FROM film
WHERE film_id = 69;
--Answer: there were a lot of films that had the same invetory amount
--CONT. SO I chose an id at random and got its title "Beverly Outlaw"
-- CONT. Its id had appeared 8 times in inventory
--4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
--Anser: 0 but if you wanted all last names that had william in it then do this:
SELECT COUNT(last_name)
FROM customer
WHERE last_name like '%William%';
--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id)
FROM film
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC;


--Answer: Mike(staff_id 1) had rented out 36 more movies then Jon(staff_id 2) did. 
--6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

SELECT film_id, title
FROM film
WHERE film_id = 508;
--Answer: Lambs Cincinatti with a total of 15 diffrent actors
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, COUNT(last_name)
FROM customer
WHERE last_name like '_%es' and store_id = 1
GROUP BY store_id;

--Answer: 13 customers have last names ending with "es"
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT DISTINCT amount, COUNT(customer_id)
FROM payment
WHERE customer_id BETWEEN 380  AND 430
GROUP BY amount
HAVING COUNT(customer_id) > 250;




--Answer: there are 3 amounts that are above 250 for customers in the specified range
--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY rating;

--Answer: Out of 5 total categories, the most popular film rating is: PG-13 with 223 films

