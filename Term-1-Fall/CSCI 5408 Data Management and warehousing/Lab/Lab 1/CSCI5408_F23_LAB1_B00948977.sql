SELECT count(id) AS no_of_unique_actors
FROM lab1_imdb.actors;








SELECT count(id) AS no_of_movies_between_1990s_2000
FROM lab1_imdb.movies
	WHERE year BETWEEN 1990 AND 2000;







SELECT genre
FROM lab1_imdb.directors_genres DG
INNER JOIN lab1_imdb.directors D ON DG.director_id = D.id
	WHERE D.first_name = "Christopher" AND D.last_name = "Nolan";






SELECT DISTINCT genre
FROM lab1_imdb.directors_genres
	WHERE director_id = (SELECT id 
						FROM lab1_imdb.directors 
							WHERE first_name = "christopher" AND last_name = "nolan");



SELECT CONCAT(d.first_name, ' ', D.last_name) AS director_name, M.name AS movie_name
FROM lab1_imdb.movies M
INNER JOIN lab1_imdb.movies_directors MD on M.id = MD.movie_id
INNER JOIN lab1_imdb.directors D ON D.id = MD.director_id
INNER JOIN lab1_imdb.movies_genres MG on M.id = MG.movie_id
	WHERE M.rank BETWEEN 8 AND 9 
		AND genre IN ('Sci-Fi','Action')
    GROUP BY director_name, movie_name
    HAVING count(MG.genre) = 2;
    
    
    
    
    
SELECT name 
FROM (SELECT M.name, count(1) as no_of_doctors 
	  FROM lab1_imdb.roles R
	  INNER JOIN lab1_imdb.movies M ON R.movie_id = M.id
		WHERE R.role LIKE '%doctor%'
		GROUP BY M.name
	  ORDER BY no_of_doctors DESC LIMIT 1) AS movie_doctor;









SELECT name 
FROM lab1_imdb.movies
	WHERE name LIKE 'F%'








    
    
    
    
    
    
    
    
























