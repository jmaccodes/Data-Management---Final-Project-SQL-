-- **Objective: Identify potential films for a Valentine's Day Rental-And-Chill promotion**
SELECT title 
FROM film
WHERE title LIKE '%love%';

-- **Objective: Assess film duration to optimize inventory selection**
SELECT title, length,
    CASE
        WHEN length < 60 THEN 'Short'
        WHEN length BETWEEN 60 AND 120 THEN 'Medium'
        ELSE 'Long'
    END AS Duration
FROM film
ORDER BY Duration;

-- **Objective: Capitalize on the popularity of trending actress Vivien Basinger**
SELECT f.title, a.first_name, a.last_name 
FROM film as f 
INNER JOIN film_actor as fa ON f.film_id = fa.film_id
INNER JOIN actor as a ON fa.actor_id = a.actor_id
WHERE a.first_name LIKE 'Vivien' AND a.last_name LIKE 'Basinger';

-- **Objective: Identify actors featured in films with a cult following**
SELECT a.first_name, a.last_name 
FROM film as f 
INNER JOIN film_actor as fa ON f.film_id = fa.film_id
INNER JOIN actor as a ON fa.actor_id = a.actor_id
WHERE f.title LIKE '%Shawshank%';

-- **Objective: Align film inventory with customer preferences**
SELECT AVG(length)
FROM film;

-- **Objective: Analyze seasonal rental trends to optimize marketing strategy**
SELECT rental_id, rental_date 
FROM rental
WHERE STRFTIME('%Y', rental_date)= '2005';

-- **Objective: Assess customer demand for longer rental durations**
SELECT title, rental_duration
FROM film 
WHERE rental_duration > 5;

-- **Objective: Evaluate rental pricing strategy**
SELECT title, rental_rate
FROM film 
WHERE rental_rate = 0.99;

SELECT title, rental_rate
FROM film 
WHERE rental_rate = 2.99;

-- **Objective: Identify high-value inventory at risk of loss or theft**
SELECT title, replacement_cost
FROM film 
ORDER BY replacement_cost DESC
LIMIT 3;

-- **Objective: Understand customer engagement and behavior**
SELECT COUNT(r.rental_id), MAX(r.rental_date)
FROM rental as r
INNER JOIN customer as c ON r.customer_id = c.customer_id
WHERE c.first_name LIKE "Victoria" AND c.last_name LIKE "Gibson";

-- **Objective: Generate a report of customer rental activity**
SELECT COUNT(r.rental_id), c.first_name, c.last_name 
FROM customer as c
INNER JOIN rental as r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name;

-- **Objective: Assess rental pricing strategy for profitability**
SELECT AVG(rental_rate)
FROM film;

-- **Objective: Identify the most prominent actor or actress in our film library**
SELECT a.first_name, a.last_name, COUNT(fa.film_id)
FROM actor as a
INNER JOIN film_actor as fa ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name 
ORDER BY COUNT(fa.film_id) DESC;

-- **Objective: Identify customer engagement with specific film categories**
SELECT DISTINCT c.first_name, c.last_name
FROM customer as c 
INNER JOIN rental as r ON c.customer_id = r.customer_id
INNER JOIN inventory as i ON r.inventory_id = i.inventory_id 
INNER JOIN film as f ON i.film_id = f.film_id
INNER JOIN film_category as fc ON f.film_id = fc.film_id
INNER JOIN category as ct ON fc.category_id = ct.category_id
WHERE ct.name LIKE "Action"
ORDER BY c.last_name;

-- **Objective: Assess market viability for expansion**
SELECT c.customer_id, ct.city
FROM customer as c
INNER JOIN address as a ON c.address_id = a.address_id
INNER JOIN city as ct ON a.city_id = ct.city_id
WHERE ct.city LIKE ('%Aurora%');

-- **Objective: Evaluate the impact of changing film organization in stores**
SELECT title
FROM film 
WHERE title LIKE ('A%');

-- **Objective: Analyze rental demand by film category**
SELECT c.name, COUNT(r.rental_id)
FROM category as c
INNER JOIN film_category as fc ON c.category_id = fc.category_id
INNER JOIN film as f ON fc.film_id = f.film_id
INNER JOIN inventory as i ON f.film_id = i.film_id
INNER JOIN rental as r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY COUNT(r.rental_id) DESC
LIMIT 3;

-- **Objective: Evaluate category distribution in our inventory**
SELECT c.name, COUNT(fc.film_id)
FROM category as c
INNER JOIN film_category as fc ON c.category_id = fc.category_id
INNER JOIN film as f ON fc.film_id = f.film_id
GROUP BY c.name 
ORDER BY COUNT(fc.film_id) DESC 
LIMIT 5;

-- **Objective: Identify underperforming inventory**
SELECT f.title, r.rental_id 
FROM film as f
INNER JOIN inventory as i ON f.film_id = i.film_id
INNER JOIN rental as r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY r.rental_id ASC;

-- **Objective: Assess rental price categories for inventory classification**
SELECT title
FROM film 
WHERE rental_rate < 2;

SELECT title
FROM film
WHERE rental_rate BETWEEN 2 AND 4;

SELECT title
FROM film
WHERE rental_rate > 4;

-- **Objective: Identify our most rented film title**
SELECT f.title, COUNT(r.rental_id)
FROM film as f
INNER JOIN inventory as i ON f.film_id = i.film_id
INNER JOIN rental as r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY COUNT(r.rental_id) DESC;