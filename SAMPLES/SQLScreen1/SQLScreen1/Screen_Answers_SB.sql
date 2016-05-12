
/* 
SQL Screening Questions: Rooster Park Consulting
Candidate: Sean Bethune (seanbethune@comcast.net)
Date: 4/8/2016
*/

/*
Question 1: 

a. Which of the tables does not have a primary key?

Answer 1: The CAST table does not contain a primary key. Since an actor may play multiple roles
		  in a movie, there may be multiple records with the same actor_id and movie_id. A
		  non-clustered unique index on all the columns (actor_id, movie_id, role) should be
		  added to the table to ensure relational integrity for duplicate records.

Answer 2: The MOVIE_DIRECTOR table can have a composite primary key ('Director_id','Movie_id') with
		  the assumption that there is a one-to-one (1:1) relationship between a Director and a Movie.
*/

/* Question 2:  */

--2.a: List all of the movies that came out in 2001.
	SELECT Id
		 , Name
		 , [Year]
	 FROM MOVIE
	WHERE [Year] = 2001;
	GO

-- 2.b: Find all actors in movies that came out in 1975, and sort them alphabetically by last name.
	SELECT a.id, a.Fname, a.Lname
	FROM ACTOR a
	  INNER JOIN [CAST] c ON a.Id = c.Actor_id
	  INNER JOIN MOVIE m ON c.Movie_id = m.Id
	WHERE m.[YEAR] = 1975
	ORDER BY a.Lname;
	GO

-- 2.c: List all directors in descending order of the number of films they directed. 
	SELECT d.Id, d.FName, d.LName, COUNT(md.Movie_Id) AS [MOVIE_COUNT]
	FROM DIRECTOR d
	  INNER JOIN MOVIE_DIRECTOR md ON d.Id = md.Director_id
	GROUP BY d.Id, d.FName, d.LName
	ORDER BY [MOVIE_COUNT] DESC;
	GO

-- 2.d: Find all actors who only acted in movies before 1975
	SELECT a.Id, a.Fname, a.Lname
	  FROM ACTOR a
	  WHERE a.Id NOT IN
	  -- Find all actors where the movie year >= 1975
	   ( SELECT a2.Id
		   FROM ACTOR a2
			 INNER JOIN [CAST] c ON a2.Id = c.Actor_Id
			 INNER JOIN [MOVIE] m ON c.Movie_id = m.Id
		 WHERE m.[YEAR] >= 1975
	   );
	   GO

-- 2.e: Find the movies with more women actors than men

	WITH MovieCountActorCTE AS
	(
		SELECT m.Id
			 , m.Name
			 , m.[Year]
			 , SUM(CASE WHEN a.GENDER = 'M' THEN 1 ELSE 0 END) AS MALE_COUNT
			 , SUM(CASE WHEN a.GENDER = 'F' THEN 1 ELSE 0 END) AS FEMALE_COUNT
		 FROM MOVIE m
		   INNER JOIN [CAST] c ON m.Id = c.Movie_id
		   INNER JOIN [ACTOR] a ON c.Actor_id = a.Id AND a.GENDER IS NOT NULL
		GROUP BY m.Id, m.Name, m.[Year]
	)

	SELECT Id, Name, [Year]
	 FROM MovieCountActorCTE
	WHERE [FEMALE_COUNT] > [MALE_COUNT];
	GO




