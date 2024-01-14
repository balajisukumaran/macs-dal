SELECT genre
FROM lab1_imdb.directors_genres DG
INNER JOIN lab1_imdb.directors D ON DG.director_id = D.id
	WHERE D.first_name = "Christopher" AND D.last_name = "Nolan";






SELECT DISTINCT genre
FROM lab1_imdb.directors_genres
	WHERE director_id = (SELECT id 
						FROM lab1_imdb.directors 
							WHERE first_name = "christopher" AND last_name = "nolan");
