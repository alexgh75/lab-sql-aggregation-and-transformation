
USE sakila;
#Determine the shortest and longest movie durations and name the values as max_duration and min_duration
SELECT MIN(length) AS min_duration
FROM film;

SELECT MAX(length) AS max_duration
FROM film;

#Express the average movie duration in hours and minutes. Don't use decimals 
SELECT
FLOOR(AVG(length) / 60) AS avg_hours,
ROUND (AVG(length) % 60) AS avg_minutes
FROM film;

#Calculate the number of days that the company has been operating

SELECT 
DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating
FROM rental;

#Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.

SELECT
rental_id,
rental_date,
date_format(rental_date, '%m') AS month,
date_format(rental_date, '%W') AS weekday
FROM rental
LIMIT 20;
 
 # Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
 
 SELECT
 rental_id,
 rental_date,
 date_format(rental_date, '%m') AS month,
date_format(rental_date, '%W') AS weekday
 CASE
WHEN date_format(rental_date, "%W") IN 'Monda', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday' THEN 'workday'
ELSE 'weekend'
END AS DAY_TYPE
 
 
 #You need to ensure that customers can easily access information about the movie collection

SELECT
    title,
    IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;


#Challenge 2

#The total number of films that have been released

SELECT COUNT(*) 
FROM film;

#The number of films for each rating

SELECT COUNT(*) AS number, rating 
FROM film 
GROUP BY rating;

# The number of films for each rating, sorting the results in descending 
# order of the number of films. This will help you to better understand the
# popularity of different film ratings and adjust purchasing decisions accordingly.

SELECT COUNT(*) AS number, rating 
FROM film 
GROUP BY rating
ORDER BY number desc;

# The mean film duration for each rating, and sort the results in descending order of the mean duration.
# Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.

SELECT AVG(length) AS Mean_lenght, rating
FROM film
GROUP BY rating;

# Identify which ratings have a mean duration of over two hours
# in order to help select films for customers who prefer longer movies.

SELECT rating, AVG(length) AS mean
FROM film
WHERE mean>120
GROUP BY rating;


