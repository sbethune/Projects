CREATE TABLE [dbo].[MOVIE_DIRECTOR]
(
	[Director_Id] INT NOT NULL, 
    [Movie_Id] INT NOT NULL, 
    CONSTRAINT [PK_MOVIE_DIRECTOR] PRIMARY KEY ([Director_Id], [Movie_Id])
)

GO

