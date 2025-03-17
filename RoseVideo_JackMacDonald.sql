-- We're currently planning a Valentine's Day Rental-And-Chill promotion for the upcoming year, 
-- how many films have a title that contains the word "Love"?

SELECT title 
FROM film
WHERE title LIKE '%love%'

-- The duration of a film is an important factor to consider when evaluating our current inventory. 
-- Create a column to display "Short" for films under 60 minutes, 
--"Medium" for films between 60 and 120 minutes, and 
--"Long" for films over 120 minutes. How many films are classified as "Medium" length duration?

SELECT title, length,
	CASE
		WHEN length < 60 THEN 'Short'
		WHEN length BETWEEN 60 AND 120 THEN 'Medium'
		ELSE 'Long'
	END AS Duration
FROM film
ORDER BY Duration


-- The iconic actress Vivien Basinger is currently trending on social media and we want to capitalize on her current popularity. 
-- How many films in our inventory does Vivien star in?

SELECT f.title, a.first_name, a.last_name 
FROM film as f 
INNER JOIN film_actor as fa ON f.film_id = fa.film_id
INNER JOIN actor as a ON fa.actor_id = a.actor_id
WHERE a.first_name LIKE 'Vivien' AND a.last_name LIKE 'Basinger'


-- Which of the following actors or actresses appeared in films with the word "Shawshank" in the title? (select all that apply)

SELECT a.first_name, a.last_name 
FROM film as f 
INNER JOIN film_actor as fa ON f.film_id = fa.film_id
INNER JOIN actor as a ON fa.actor_id = a.actor_id
WHERE f.title LIKE '%Shawshank%'


-- Historically, we've found that movies ranging from 90 to 120 minutes are the most popular with our customers. 
-- What is the average length of films in our database?

SELECT AVG(length)
FROM film

-- With students on holiday and family's spending time together, 
-- July has historically been a popular month in the video rental business. 
-- How many rental transactions did we record in the month of July 2005?
-- 10176-3466

SELECT rental_id,rental_date 
FROM rental
WHERE STRFTIME('%Y', rental_date)= '2005'

-- Rental duration is an important attribute to analyze when considering customer demand.
--  How many films in our database have a rental duration of more than 5 days?

SELECT title, rental_duration
FROM film 
WHERE rental_duration > 5

-- We're currently evaluating our rental pricing structure. 
-- How many films are listed with a rental rate of 0.99 and 2.99 respectively?

SELECT title, rental_rate
FROM film 
WHERE rental_rate = 0.99

SELECT title, rental_rate
FROM film 
WHERE rental_rate = 2.99

-- Each year we loose several movies from our inventory due to customer loss or theft. 
-- What are the top three films in our library with the highest replacement cost?

SELECT title, replacement_cost
FROM film 
ORDER BY replacement_cost desc
LIMIT 3

-- One of our employees noted that a friendly customer by the name of Victoria Gibson frequently comes into our 
-- stores, browses our selection of videos, and typically leaves without renting a movie. Curious about consumer 
-- behavior and how we might adjust our inventory, we want to know how many movies Victoria has 
-- rented from our stores and what is the date of her most recent rental transaction? 


SELECT COUNT(r.rental_id), MAX(r.rental_date)
FROM rental as r
INNER JOIN customer as c on r.customer_id = c.customer_id
WHERE c.first_name LIKE "Victoria" AND c.last_name LIKE "Gibson"
-- Management would like a report of our customers and the total number of rentals they have made. 
-- How many rentals have Jessie Banks, Ralph Madrigal and Bernice Willis made respectively? 26-34-33

SELECT COUNT(r.rental_id), c.first_name, c.last_name 
FROM customer as c
INNER JOIN rental as r on c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name

-- What is the average rental rate for all films in our database?

SELECT AVG(rental_rate)
FROM film

-- Our Marketing department wants to develop a promotional campaign based around a single actor or actress featured in our films. 
-- Who is the actor or actress with the most films in our library? 

SELECT a.first_name, a.last_name,COUNT(fa.film_id)
FROM actor as a
INNER JOIN film_actor as fa ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name 
ORDER BY COUNT(fa.film_id) desc



SELECT DISTINCT a.first_name, a.last_name, COUNT(i.film_id)
FROM actor as a
INNER JOIN film_actor as fa ON a.actor_id = fa.actor_id
INNER JOIN film as f ON fa.film_id = f.film_id 
INNER JOIN inventory as i ON f.film_id = i.film_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(i.film_id) DESC

-- The films in our inventory are organized into various categories such as Action, Comedy, Sci-Fi, etc. 
-- How many unique customers have rented films in the "Action" category?

SELECT DISTINCT c.first_name, c.last_name
FROM customer as c 
INNER JOIN rental as r on c.customer_id = r.customer_id
INNER JOIN inventory as i ON r.inventory_id = i.inventory_id 
INNER JOIN film as f ON i.film_id = f.film_id
INNER JOIN film_category as fc on f.film_id = fc.film_id
INNER JOIN category as ct on fc.category_id = ct.category_id
WHERE ct.name LIKE "Action"
ORDER BY c.last_name


-- We're considering opening a new store in the city of Aurora, how many of our customers currently live there?

SELECT c.customer_id, ct.city
FROM customer as c
INNER JOIN address as a ON c.address_id = a.address_id
INNER JOIN city as ct ON a.city_id = ct.city_id
WHERE ct.city LIKE ('%Aurora%')

-- We're currently considering restructuring the layout of our stores, which are currently organized by film category, to a simple alphabetical ordering. 
-- With that in mind, how many film titles start with the letter 'A'?

SELECT title
FROM film 
WHERE title LIKE ('A%')

-- We're currently evaluating the distribution of films across our different film categories and comparing those results against customer demand. 
-- What are the top 3 categories based on which films are being rented by customers?

SELECT c.name, COUNT(r.rental_id)
FROM category as c
INNER JOIN film_category as fc ON c.category_id = fc.category_id
INNER JOIN film as f ON fc.film_id = f.film_id
INNER JOIN inventory as i ON f.film_id = i.film_id
INNER JOIN rental as r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY COUNT(r.rental_id) desc
LIMIT 3

-- We're currently evaluating the distribution of films across our different film categories and comparing those results against customer demand. 
-- What are the top 3 categories based on the number of films in each category?

SELECT c.name, COUNT(fc.film_id)
FROM category as c
INNER JOIN film_category as fc ON c.category_id = fc.category_id
INNER JOIN film as f ON fc.film_id = f.film_id
GROUP BY c.name 
ORDER BY COUNT(fc.film_id) DESC 
LIMIT 5

-- Evaluating our current rental records, how many films have never been rented before?

SELECT f.title, r.rental_id 
FROM film as f
INNER JOIN inventory as i on f.film_id = i.film_id
INNER JOIN rental as r on i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY r.rental_id asc




SELECT *
FROM film



-- What is the most expensive rental rate in our system?

SELECT rental_rate
FROM film
ORDER BY rental_rate desc


-- Management would like to identify our most loyal clients. 
-- How many customers have rented more than 40 films in our company's history?

SELECT c.customer_id, COUNT(r.rental_id)
FROM rental as r
INNER JOIN customer as c ON r.customer_id = c.customer_id 
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) > 40


-- Management would like a report of all customers along with the title and rental date of the most recent 
-- film they rented. Include the customers first name, last name, film title and rental date. 
-- Display your results sorted by the customer's last name. What values match the 120th record in your result set?

SELECT c.first_name , c.last_name, MAX(r.rental_date)
FROM customer as c
INNER JOIN rental as r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name


SELECT c.first_name, c.last_name, f.title, MAX(r.rental_date)
FROM customer as c
INNER JOIN rental as r ON c.customer_id = r.customer_id
INNER JOIN inventory as i ON r.inventory_id = i.inventory_id
INNER JOIN film as f ON i.film_id = f.film_id
GROUP BY c.last_name
ORDER BY c.last_name


-- The cost to rent videos (i.e., rental rate) is an important factor to consider when evaluating our current 
-- inventory and pricing strategy. Create a column to display "Cheap" if the rental rate is less than $2, 
-- "Affordable" if the rate is between $2 and $4 dollars, and "Expensive" if the rate is greater than $4. 
--What is the distribution of our films across the three rental rate categories of Cheap, Affordable and 
--Expensive respectively? 

SELECT title
FROM film 
WHERE rental_rate < 2


SELECT title
FROM film
WHERE rental_rate BETWEEN 2 AND 4


SELECT title
FROM film
WHERE rental_rate > 4


-- Reviewing our inventory, we want to make sure we're stocking films that customers rent frequently. 
-- With that in mind, what is our most popular film title to date?

SELECT f.title, COUNT(r.rental_id)
FROM film as f
INNER JOIN inventory as i on f.film_id = i.film_id
INNER JOIN rental as r on i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY COUNT(r.rental_id) desc
