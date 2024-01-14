    
SELECT name 
FROM (SELECT M.name, count(1) as no_of_doctors 
	  FROM lab1_imdb.roles R
	  INNER JOIN lab1_imdb.movies M ON R.movie_id = M.id
		WHERE R.role LIKE '%doctor%'
		GROUP BY M.name
	  ORDER BY no_of_doctors DESC LIMIT 1) AS movie_doctor;
