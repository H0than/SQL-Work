-- Q1 : Which columns do I have in all tables?
SELECT table_name, column_name FROM information_schema.columns WHERE table_schema = DATABASE();

-- Q2. Can I see the content in the columns title and genre from general_info?
SELECT title, genre FROM general_info;

-- Q3. How many rows do I have in general_info? 
SELECT COUNT(*) FROM general_info;

-- Q4.  How many unique genres do  we have in the general_info table? 
SELECT COUNT(DISTINCT(genre)) FROM general_info;

-- Q5. Do we have missing information in the genres?  
SELECT COUNT(genre) FROM general_info;
-- OR
SELECT COUNT(genre) FROM general_info WHERE genre IS NULL; 

-- Q6. How many unique years do  we have in the db? 
SELECT COUNT(DISTINCT(year)) FROM financial_data;

-- Q7. Is there any movie whose title is Split?
SELECT title FROM general_info WHERE title = 'Stardust'; 

-- Q8. ..let’s try it with stardust? Which is its genre?
SELECT genre FROM general_info WHERE title = "Split";

-- Q9. How many comedy movies do we have? 10
SELECT COUNT(*) FROM general_info WHERE genre = 'comedy';

-- Q10. Let’s select the movies that were released after 2002
SELECT * FROM financial_data WHERE year >= 2002;

-- Q11.Which are the  movies released between 2002 and 2009?
SELECT * FROM financial_data WHERE year > 2002 AND year < 2009;

-- Q12. Get the information from the movies released after 2002 that have a rating score higher than 8
SELECT * FROM ratings WHERE year >=  2002 AND rating >8;

-- Q13. Let’s select the comedies  or dramatic movies
SELECT * FROM general_info WHERE (genre = 'comedy' OR genre='drama')

-- Q14.We are interested in getting the comedies or dramatic movies, excluding titanic and big fish
SELECT * FROM general_info WHERE (genre = 'comedy' OR genre='drama') AND (title <> 'titanic' AND title <> 'big fish');

-- Q15. Let’s subset the information from The dark knight, making sure that its genre is not comedy
SELECT * FROM general_info WHERE genre <> 'comedy' AND title = 'the dark knight' 

-- Q16. Which are the movies that were released between 2012-2014 and have a high rating (higher than 8.9)? 
SELECT * FROM ratings WHERE year BETWEEN 2012 AND 2014 AND rating > 8.9; 

-- Q17.And if we extend the range between 2000 and 2021?
SELECT * FROM ratings WHERE year BETWEEN 2000 AND 2021 AND rating > 8.9; 

-- Q18. Can you count the movies that were released between 2000-2021 and have a rating >6? 
SELECT COUNT(*) FROM ratings WHERE year BETWEEN 2000 AND 2021 AND rating > 6; 

-- Q19. Is there any movie that starts with star wars?
SELECT * FROM general_info WHERE title LIKE 'star wars%'

-- Q20.And what about the ones that start with america?
SELECT * FROM general_info WHERE title LIKE 'america%'

-- Q21. Can you count them?
SELECT COUNT(*) FROM general_info WHERE title LIKE 'america%'

-- Q22. How many minutes lasts the longest movie?
SELECT MAX(runtime) FROM financial_data;

-- Q21. and what about the shortest? 0
SELECT MIN(runtime) FROM financial_data;

-- Q22. Is there just one movie that lasts 0 minutes? Yes!
SELECT * from financial_data WHERE runtime = 0;

-- Let’s repeat the procedure but subsetting just the movies released on 2012
-- Q23. How many minutes lasts the longest movie?
SELECT MAX(runtime) FROM financial_data WHERE year=2012;
SELECT title, runtime FROM financial_data WHERE year = 2012 ORDER BY runtime DESC LIMIT 1;

-- Q24. and what about the shortest?
SELECT MIN(runtime) FROM financial_data WHERE year=2012;
SELECT title, runtime FROM financial_data WHERE year = 2012 ORDER BY runtime ASC LIMIT 1;

-- Q25. Which is the average time for the movies released that year?
SELECT AVG(runtime) from financial_data WHERE year= 2012;

-- Q26.  Which are the highest and lowest rating values?
SELECT MAX(rating), MIN(rating)from ratings;

-- Q27. And if we round them?
SELECT ROUND(MAX(rating)), ROUND(MIN(rating))from ratings;

-- Q28. Which is year of the movie that has the max number of votes?
SELECT * FROM ratings WHERE votes = (SELECT MAX(votes) FROM ratings);

-- Q29. Which is the total number of votes that we have?
SELECT SUM(votes)from ratings;

-- Q30. Calculate the frequency table for the year variable in ratings table
SELECT year,COUNT(*) AS Frequency from ratings GROUP BY year;

-- Q31. Order the table in descending order 
SELECT year,COUNT(*) from ratings GROUP BY year desc;

-- Q32.  Get the total number of votes per year
SELECT year,SUM(votes) from ratings GROUP BY year;

-- Q33. Which is the director with more movies? 
SELECT director,COUNT(*) AS Movies from casting GROUP BY director ORDER by COUNT(*) DESC

-- Q34. Get the title of the movies directed by this director
SELECT title FROM casting WHERE director = 'christopher nolan'

-- Q35.From these movies, which is the one that lasts long? And the shortest?
SELECT MAX(runtime), MIN(runtime)FROM financial_data WHERE director = 'christopher nolan'

-- Q36. Find the titles and ratings of movies released in 2010 along with their genres
SELECT ratings.title, ratings.rating, ratings.year, general_info.genre FROM ratings 
INNER JOIN general_info ON ratings.id = general_info.id WHERE ratings.year = 2010;

-- Q37. Retrieve a list of actors for each movie along with their ratings. Include only movies with ratings greater than 8.
SELECT ratings.title, casting.actors, ratings.rating FROM ratings 
JOIN casting ON ratings.id = casting.id WHERE ratings.rating > 8;

-- Q38. Find the total revenue for movies directed by 'Christopher Nolan'.
SELECT c.director, SUM(f.revenue) AS Total_Revenue FROM casting c JOIN financial_data f ON c.title = f.title
WHERE c.director = 'Christopher Nolan' GROUP BY c.director; 

-- Q39. Display the titles, genres, and directors for movies released in 2015. Include movies that do not have ratings.
SELECT g.title, g.genre, c.director FROM general_info g
LEFT JOIN casting c ON g.title = c.title 
LEFT JOIN ratings r ON g.id = r.id
AND r.year = 2015; 










