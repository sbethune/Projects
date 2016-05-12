/* Screen Sample Data Load Script */

--1 Actors
INSERT INTO ACTOR (Id, Fname, Lname,Gender) VALUES
(1,'Brad','Pitt','M'),
(2,'Susan','Sarandon','F'),
(3,'Geena','Davis','F'),
(4,'Harvey','Kietel','M'),
(5,'John','Travolta','M'),
(6,'Samuel','Jackson','M'),
(7,'Uma','Thurman','F'),
(8,'Bruce','Willis','M'),
(9,'Christopher','Walken','M'),
(10,'Tim','Roth','M'),
(11,'Meg','Ryan','F'),
(12,'Eva','Mendes','F'),
(13,'Annette','Bening','F'),
(14,'Jada','Smith','F'),
(15,'Carrie','Fisher','F')
GO

--2 Movies
INSERT INTO MOVIE (Id, Name, [Year]) VALUES
(1,'Thelma and Loise',1991),
(2,'Pulp Fiction',1994),
(3,'The Women',2008)
GO

--3 Directors
INSERT INTO DIRECTOR (Id, FName, LName) VALUES
(1,'Quentin','Tarantino'),
(2,'Ridley','Scott'),
(3,'Diane','English')
GO

--4 Cast mapping table
INSERT INTO [CAST] (Actor_Id, Movie_Id, [Role]) VALUES
(1,1,'J.D.'),
(2,1,'Louise'),
(3,1,'Thelma'),
(4,1,'Hal'),
(5,2,'Vincent Vega'),
(6,2,'Jules Winfield'),
(7,2,'Mia Wallace'),
(8,2,'Buth Coolidge'),
(9,2,'Captain Koons'),
(10,2,'Pumpkin'),
(11,3,'Mary Haines'),
(12,3,'Crystal Allen'),
(13,3,'Sylvia Fowler'),
(14,3,'Alex Fisher'),
(15,3,'Bailey Smith')
GO

--5 Movie_Director mapping table
INSERT INTO [MOVIE_DIRECTOR] (Director_Id, Movie_Id) VALUES
(1,2),
(2,1),
(3,3)
GO


