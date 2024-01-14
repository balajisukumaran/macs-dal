
SELECT CONCAT(d.first_name, ' ', D.last_name) AS director_name, M.name AS movie_name
FROM lab1_imdb.movies M
INNER JOIN lab1_imdb.movies_directors MD on M.id = MD.movie_id
INNER JOIN lab1_imdb.directors D ON D.id = MD.director_id
INNER JOIN lab1_imdb.movies_genres MG on M.id = MG.movie_id
	WHERE M.rank BETWEEN 8 AND 9 
		AND genre IN ('Sci-Fi','Action')
    GROUP BY director_name, movie_name
    HAVING count(MG.genre) = 2;
    