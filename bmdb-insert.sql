--bmdb crud stuff
--inserting a movie

INSERT INTO Movie (Title, Year, Rating, Director)
VALUES
	('The Shawshank Redemption', 1994, 'R', 'Frank Darabont'),
	('Dummy Movie', 2024, 'R', 'Test Director');

--Updating a movie
UPDATE Movie
	SET Title = 'Cloud Atlas',
	Year = 2012,
	Director = 'Tom Tykwer, Lana Wachowski, Lilly Wachowski'
WHERE Id = 2;

Select *
FROM Movie;

--Add an actor for a movie
--Tim Robbins - Andy Dufresne

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Tim', 'Robbins', 'M', '1958-10-16');

SELECT *
FROM Actor;

--Add a credit
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(1, 1, 'Andy Dufresne');

--Join 3 tables to show movie, actor, and role info
SELECT Title, Year, FirstName, LastName, Role
FROM Credit c
	JOIN Movie m on c.MovieId = m.Id
	JOIN Actor a on c.ActorID = a.Id;

--Inserting more into the movies table
INSERT INTO Movie (Title, Year, Rating, Director)
VALUES
	('Rogue One: A Star Wars Story', 2016, 'PG-13', 'Gareth Edwards'),
	('The Lord of the Rings: The Fellowship of the Ring', 2001, 'PG-13', 'Peter Jackson'),
	('Hot Fuzz', 2007, 'R', 'Edgar Wright');

--inserting more into the actors (TSR)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Morgan', 'Freeman', 'M', '1937-06-01'),
	('Bob', 'Gunton', 'M', '1945-11-15'),
	('William', 'Sadler', 'M', '1950-04-13'),
	('Clancy', 'Brown', 'M', '1959-01-05');

--inserting more into the credits (TSR)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(1, 2, 'Ellis Boyd Redding aka Red'),
	(1, 3, 'Warden Norton'),
	(1, 4, 'Heywood'),
	(1, 5, 'Captain Hadley');

--inserting more into the actors (CA)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Tom', 'Hanks', 'M', '1956-07-09'),
	('Halle', 'Berry', 'F', '1966-08-14'),
	('Jim', 'Broadbent', 'M', '1949-05-24'),
	('Hugo', 'Weaving', 'M', '1960-04-04'),
	('Jim', 'Sturgess', 'M', '1978-05-16');

--Inserting more into the credits (CA)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(2, 6, 'Dr. Henry Goose / Hotel Manager / Isaac Sachs / Dermot Hoggins / Cavendish Look-a-Like Actor / Zachry'),
	(2, 7, 'Native Woman / Jocasta Ayrs / Luisa Rey / Indian Party Guest / Ovid / Meronym'),
	(2, 8, 'Captain Molyneux / Vyvyan Arys / Timothy Cavendish / Korean Musician / Prescient 2'),
	(2, 9, 'Haskell Moore / Tadeusz Kesselring / Bill Smoke / Nurse Noakes / Boardman Mephi / Old Georgie'),
	(2, 10, 'Adam Ewing / Poor Hotel Guest / Megans Dad / Highlander / Hae-Joo Chang / Adam');

--Inserting more into the actors (RO)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Felicity', 'Jones', 'F', '1983-10-17'),
	('Diego', 'Luna', 'M', '1979-12-29'),
	('Alan', 'Tudyk', 'M', '1971-03-16'),
	('Donnie', 'Yen', 'M', '1963-07-27'),
	('Wen', 'Jiang', 'M', '1963-01-05');

--Inserting more into the credits (RO)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(4, 11, 'Jyn Erso'),
	(4, 12, 'Cassian Andor'),
	(4, 13, 'K-2SO'),
	(4, 14, 'Chirrut Imwe'),
	(4, 15, 'Blaze Malbus');

--Inserting more into the actors (LotR)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Sean', 'Astin', 'M', '1971-02-25'),
	('Sean', 'Bean', 'M', '1959-04-17'),
	('Billy', 'Boyd', 'M', '1968-08-28'),
	('Viggo', 'Mortensen', 'M', '1958-10-20'),
	('Orlando', 'Bloom', 'M', '1977-01-13');

--Inserting more into the credits (LotR)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(5, 16, 'Sam'),
	(5, 17, 'Boromir'),
	(5, 18, 'Pippin'),
	(5, 19, 'Aragorn'),
	(5, 20, 'Legolas');

SELECT *
FROM Credit;