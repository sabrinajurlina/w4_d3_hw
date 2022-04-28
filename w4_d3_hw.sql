-- -- QUESTION 1:
-- --List all customers who live in Texas
-- ----------------------------------------------------------
-- SELECT CONCAT(first_name, ' ', last_name) as customer_name, customer.address_id
-- FROM customer
-- JOIN address
-- ON address.address_id = customer.address_id
-- WHERE district = 'Texas';


-- QUESTION 2:
-- Get all payments above $6.99 with the customer's full NAME
-- ----------------------------------------------------------
-- SELECT CONCAT(first_name, ' ', last_name) as customer_name, payment_id, amount
-- FROM customer
-- JOIN payment
-- ON payment.customer_id = customer.customer_id
-- WHERE amount > 6.99;


--QUESTION 3:
-- Show all customers names who have made payments over $175 (use subqueries)
-- ----------------------------------------------------------
-- SELECT CONCAT(first_name, ' ', last_name) as customer_name, customer_id
-- FROM customer
-- WHERE customer_id IN (
--     SELECT customer_id
--     FROM payment
--     GROUP BY customer_id
--     HAVING SUM(amount) > 175
--     ORDER BY SUM(amount)
--     );


-- QUESTION 4:
-- List all customers that live in Nepal (use the city table)
-- ----------------------------------------------------------
-- SELECT CONCAT(first_name, ' ', last_name) as customer_name, country
-- FROM customer
-- JOIN address
-- ON address.address_id = customer.address_id
-- JOIN city
-- ON city.city_id = address.city_id
-- JOIN country
-- ON city.country_id = country.country_id
-- WHERE country = 'Nepal';


-- QUESTION 5:
-- Which staff member had the most transactions?
-- ----------------------------------------------------------
-- SELECT CONCAT(first_name, ' ', last_name) as staff_name, COUNT(rental_id), staff.staff_id
-- FROM staff
-- JOIN rental
-- ON rental.staff_id = staff.staff_id
-- GROUP BY staff.staff_id
-- ORDER BY COUNT(rental_id) DESC;



-- QUESTION 6:
-- How many movies of each rating are there?
-- ----------------------------------------------------------
-- SELECT COUNT(rating) as rating_count, rating
-- FROM film
-- GROUP BY rating
-- ORDER BY rating_count DESC;



-- QUESTION 7:
-- Show all customers who have made a single payment above $6.99 (subqueries)
-- ----------------------------------------------------------
-- SELECT customer_name
-- FROM (
--     SELECT CONCAT(first_name, ' ', last_name) AS customer_name, amount, customer.customer_id
--     FROM customer
--     JOIN rental
--     ON rental.customer_id = customer.customer_id
--     JOIN payment
--     ON payment.customer_id = rental.customer_id
--     WHERE amount > 6.99
--     ORDER BY customer_name) AS rentals_over_699
-- GROUP BY customer_name
-- HAVING COUNT(customer_id) = 1;
--Wasn't sure if you wanted to return customers who
--had made JUST a single payment, or AT LEAST a single payment?
--the below test accounts for both conditions.
--HAVING COUNT(customer_id) >= 1;


-- QUESTION 8:
-- How many free rentals did our stores give away?
-- ----------------------------------------------------------
SELECT COUNT(rental_id)
FROM(
    SELECT rental.rental_id, amount
    FROM rental
    JOIN payment
    ON payment.rental_id = rental.rental_id
    WHERE amount = 0) as count_zero;



