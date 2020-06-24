SELECT title, release_date FROM movies WHERE DATE(release_date) BETWEEN '1983-01-01' AND '1993-12-31' ORDER BY DATE(release_date) DESC;
--------------------
CREATE VIEW avg_ratings AS SELECT movie_id, AVG(rating) AS avg_rating FROM ratings GROUP BY movie_id ORDER BY AVG(rating);
SELECT m.title, r.avg_rating FROM movies m JOIN avg_ratings r ON m.id = r.movie_id WHERE r.avg_rating = (SELECT avg_rating FROM avg_ratings LIMIT 1);
--------------------
SELECT DISTINCT(m.title) FROM movies m JOIN ratings r ON m.id = r.movie_id JOIN users u ON r.user_id = u.id JOIN occupations o ON u.occupation_id = o.id JOIN genres_movies gm ON gm.movie_id = m.id JOIN genres g ON g.id = gm.genre_id WHERE g.name = "Sci-Fi" AND r.rating =5 AND u.age = 24 AND u.gender = "m" AND o.name = "Student";
--------------------
SELECT title FROM movies WHERE release_date = (SELECT release_date FROM movies GROUP BY release_date ORDER BY COUNT(title) DESC LIMIT 1);