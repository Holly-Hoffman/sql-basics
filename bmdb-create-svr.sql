USE MASTER;
GO

DROP DATABASE IF EXISTS BMDB;
GO

CREATE DATABASE BMDB;
GO

USE BMDB;
GO

CREATE TABLE Movie ( 
	Id			int				PRIMARY KEY IDENTITY(1,1),
	Title		varchar(255)	NOT NULL,
	Year		smallint		NOT NULL,
	Rating		varchar(5),
	Director	varchar(255)	NOT NULL,
	CONSTRAINT UQ_Movie_Title_Year UNIQUE (Title, Year)
	);

CREATE TABLE Actor (
	Id			int				PRIMARY KEY IDENTITY(1,1),
	FirstName	varchar(255)	NOT NULL,
	LastName	varchar(255)	NOT NULL,
	Gender		varchar(3)		NOT NULL,
	Birthdate	date			NOT NULL,
	CONSTRAINT UQ_Actor_Name_bd UNIQUE (FirstName, LastName, Birthdate)
	);

CREATE Table Credit (
	Id			int				PRIMARY KEY IDENTITY(1,1),
	MovieId		int				NOT NULL,
	ActorID		int				NOT NULL,
	Role		varchar(255),
	FOREIGN KEY (MovieId) REFERENCES Movie(Id),
	FOREIGN KEY (ActorId) REFERENCES Actor(Id),
	CONSTRAINT UQ_Credit_Actor_Movie UNIQUE (ActorId, MovieId)
);

