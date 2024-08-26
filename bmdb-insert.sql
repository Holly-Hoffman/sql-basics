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

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Gil', 'Bellows', 'M', '1967-06-28'),
	('Mark', 'Rolston', 'M', '1956-12-07'),
	('Larry', 'Brandenburg', 'M', '1955-07-10'),
	('James', 'Whitmore', 'M', '1921-10-01'),
	('Jeff', 'DeMunn', 'M', '1947-04-25'),
	('Neil', 'Giuntoli', 'M', '1959-12-20'),
	('Brian', 'Libby', 'M', '1949-04-20');

--inserting more into the credits (TSR)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(1, 2, 'Ellis Boyd Redding aka Red'),
	(1, 3, 'Warden Norton'),
	(1, 4, 'Heywood'),
	(1, 5, 'Captain Hadley');

INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(1, 37, 'Tommy'),
	(1, 38, 'Bogs Diamond'),
	(1, 39, 'Skeet'),
	(1, 40, 'Brooks Hatlen'),
	(1, 41, '1949 DA'),
	(1, 42, 'Jigger'),
	(1, 43, 'Floyd');

--inserting more into the actors (CA)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Tom', 'Hanks', 'M', '1956-07-09'),
	('Halle', 'Berry', 'F', '1966-08-14'),
	('Jim', 'Broadbent', 'M', '1949-05-24'),
	('Hugo', 'Weaving', 'M', '1960-04-04'),
	('Jim', 'Sturgess', 'M', '1978-05-16');

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Susan', 'Sarandon', 'F', '1946-10-04'),
	('Ben', 'Whishaw', 'M', '1980-10-14'),
	('Doona', 'Bae', 'F', '1979-10-11'),
	('James', 'D’Arcy', 'M', '1975-08-27'),
	('Keith', 'David', 'M', '1956-06-04'),
	('Zhao', 'Wei', 'F', '1976-03-12'),
	('Ben', 'Wishaw', 'M', '1980-10-14'),
	('Hugh', 'Grant', 'M', '1960-09-09'),
	('David', 'Gyasi', 'M', '1975-01-03'),
	('Laura', 'Murray', 'F', '1979-04-23'),
	('Robert', 'Forster', 'M', '1941-07-13'),
	('Nina', 'Sewell', 'F', '1984-08-17'),
	('Martin', 'Woolf', 'M', '1981-05-25'),
	('Cesar', 'Gonzalez', 'M', '1984-10-22'),
	('Van', 'Tuyen', 'F', '1980-03-30'),
	('Isabella', 'Corbellini', 'F', '1978-12-12');

UPDATE Actor
SET FirstName = 'Xun',
LastName = 'Zhou'
WHERE Id = 26;

UPDATE Actor
SET FirstName = 'Wen',
LastName = 'Jiang'
WHERE Id = 15;

DELETE FROM Actor
WHERE Id > 29;

--Inserting more into the credits (CA)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(2, 6, 'Dr. Henry Goose / Hotel Manager / Isaac Sachs / Dermot Hoggins / Cavendish Look-a-Like Actor / Zachry'),
	(2, 7, 'Native Woman / Jocasta Ayrs / Luisa Rey / Indian Party Guest / Ovid / Meronym'),
	(2, 8, 'Captain Molyneux / Vyvyan Arys / Timothy Cavendish / Korean Musician / Prescient 2'),
	(2, 9, 'Haskell Moore / Tadeusz Kesselring / Bill Smoke / Nurse Noakes / Boardman Mephi / Old Georgie'),
	(2, 10, 'Adam Ewing / Poor Hotel Guest / Megans Dad / Highlander / Hae-Joo Chang / Adam');

INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(2, 21, 'Madame Horrox / Older Ursula / Yusouf Suleiman / Abbess'),
	(2, 22, 'Cabin Boy / Robert Frobisher / Store Clerk / Georgette / Tribesman'),
	(2, 23, 'Tilda / Megans Mom / Mexican Woman / Sonmi-451 / Sonmi-351 / Sonmi Prostitute'),
	(2, 24, 'Young Rufus Sixsmith / Old Rufus Sixsmith / Nurse James / Archivist'),
	(2, 25, 'Kupaka / Joe Napier / An-kor Apis / Prescient'),
	(2, 26, 'Talbot (Hotel Manager) / Yoona-939 / Rose'),
	(2, 27, 'Cabin Boy / Robert Frobisher / Store Clerk / Georgette / Tribesman'),
	(2, 28, 'Rev. Giles Horrox / Hotel Heavy / Lloyd Hooks / Denholme Cavendish / Seer Rhee / Kona Chief'),
	(2, 29, 'Autua / Lester Rey / Duophysite');

--Inserting more into the actors (RO)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Felicity', 'Jones', 'F', '1983-10-17'),
	('Diego', 'Luna', 'M', '1979-12-29'),
	('Alan', 'Tudyk', 'M', '1971-03-16'),
	('Donnie', 'Yen', 'M', '1963-07-27'),
	('Wen', 'Jiang', 'M', '1963-01-05');

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Ben', 'Mendelsohn', 'M', '1969-04-03'),
	('Forest', 'Whitaker', 'M', '1961-07-15'),
	('Mads', 'Mikkelsen', 'M', '1965-11-22'),
	('Jiang', 'Wen', 'F', '1965-01-26'),
	('Riz', 'Ahmed', 'M', '1982-12-01'),
	('Guy', 'Henry', 'M', '1960-10-17'),
	('Genevieve', 'O’Reilly', 'F', '1974-01-06'),
	('Jimmy', 'Smits', 'M', '1955-07-09'),
	('Alistair', 'Petrie', 'M', '1970-09-30');

--Inserting more into the credits (RO)
INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(4, 11, 'Jyn Erso'),
	(4, 12, 'Cassian Andor'),
	(4, 13, 'K-2SO'),
	(4, 14, 'Chirrut Imwe'),
	(4, 15, 'Blaze Malbus');

INSERT INTO Credit (MovieId, ActorID, Role)
VALUES
	(4, 44, 'Orson Krennic'),
	(4, 45, 'Saw Gerrera'),
	(4, 46, 'Galen Erso'),
	(4, 48, 'Bodhi Rook'),
	(4, 49, 'Governor Tarkin'),
	(4, 50, 'Mon Mothma'),
	(4, 51, 'Bail Organa'),
	(4, 52, 'General Draven');

DELETE FROM Actor
WHERE Id = 47;


--Inserting more into the actors (LotR)
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Sean', 'Astin', 'M', '1971-02-25'),
	('Sean', 'Bean', 'M', '1959-04-17'),
	('Billy', 'Boyd', 'M', '1968-08-28'),
	('Viggo', 'Mortensen', 'M', '1958-10-20'),
	('Orlando', 'Bloom', 'M', '1977-01-13');

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	('Elijah', 'Wood', 'M', '1981-01-28'),
	('Ian', 'McKellen', 'M', '1939-05-25'),
	('Cate', 'Blanchett', 'F', '1969-05-14'),
	('Liv', 'Tyler', 'F', '1977-07-01'),
	('John', 'Rhys-Davies', 'M', '1944-05-05'),
	('Christopher', 'Lee', 'M', '1922-05-27'),
	('Hugo', 'Weaving', 'M', '1960-04-04'),
	('Andy', 'Serkis', 'M', '1964-04-20'),
	('Dominic', 'Monaghan', 'M', '1976-12-08'),


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