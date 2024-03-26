-- Introduction 
-- In this section, I've provided an introduction to SQL, the standard language for managing relational databases. 

-- Creating databases: 

CREATE DATABASE hodan;
USE hodan;

-- Creating, altering and inserting into tables: 

USE movies;
CREATE TABLE movies(
	title VARCHAR(50),
    genre VARCHAR(50)
    );
DESCRIBE movies;
INSERT INTO movies VALUES(
	"3 Idiots", "Drama",
    "Eternal Sunshine of the Spotless Mind", "Drama",
    "Good Will Hunting", "Drama",
    "Skyfall", "Action",
    "Gladiator", "Action",
    "Black", "Drama",
    "Titanic", "Romance",
    "The Shawshank Redemption", "Drama",
    "Udaan", "Drama",
    "Home Alone", "Comedy",
    "Casablanca", "Romance",
    "Avengers: Endgame", "Action");
INSERT INTO movies VALUES("Forrest Gump","Drama");
SELECT * FROM movies;

-- Filtering:

SELECT title FROM ratings WHERE year > 2002;
SELECT title FROM ratings WHERE year > 2002 AND year < 2009;
SELECT * FROM ratings WHERE year > 2002 AND rating > 4.5;
SELECT title FROM movies WHERE (genre = 'drama' OR 'comedy') AND (title <> 'titanic' OR title <> 'big');

-- Grouping in SQL:

SELECT genre, count(*) FROM general_info GROUP BY genre;
SELECT 
    year, COUNT(*)
FROM
    ratings
WHERE
    votes > 1500
GROUP BY year;

-- Combining Data With JOINs and UNIONs:

SELECT c.actors, c.director, g.title, g.genre FROM casting c INNER JOIN general_info g ON c.id =g.id
SELECT c.actors, c.director,g.title, g.genre FROM casting c  INNER JOIN general_info g ON c.id = g.id WHERE g.genre = 'comedy'
SELECT title FROM general_info UNION SELECT director FROM financial_data;
SELECT genre FROM general_info UNION SELECT year FROM financial_data;

-- Subqueries in SQL:

SELECT revenue FROM financial_data WHERE id IN (SELECT id FROM general_info WHERE title = 'rogue one');
SELECT title FROM general_info WHERE id IN ( SELECT id FROM casting WHERE director = 'quentin tarantino');

-- Functions in SQL:

SELECT COUNT(DISTINCT(genre)) FROM general_info;
SELECT DISTINCT genre FROM general_info;
SELECT MAX(runtime) AS longest_duration FROM financial_data;
SELECT title, AVG(runtime) FROM financial_data WHERE year = 2012 GROUP BY title;
SELECT ROUND(MAX(rating)) AS Maximum_rating, ROUND(MIN(rating)) AS Minimum_rating
FROM ratings;
SELECT ROUND(MAX(rating)),ROUND(MIN(rating)) FROM ratings;
SELECT SUM(votes) FROM ratings;

