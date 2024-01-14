
SELECT count(id) AS no_of_movies_between_1990s_2000
FROM lab1_imdb.movies
	WHERE year BETWEEN 1990 AND 2000;
