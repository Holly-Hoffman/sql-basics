USE MASTER;
GO

DROP DATABASE IF EXISTS PRSDB;
GO


CREATE DATABASE PRSDB;
GO

USE PRSDB;
GO

CREATE TABLE Users (
	Id				int				PRIMARY KEY IDENTITY(1,1),
	Username		varchar(20)		NOT NULL,
	Password		varchar(10)		NOT NULL,
	FirstName		varchar(20)		NOT NULL,
	LastName		varchar(20)		NOT NULL,
	PhoneNumber		varchar(12)		NOT NULL,
	Email			varchar(75)		NOT NULL,
	Reviewer		bit				default 0 NOT NULL,
	Admin			bit				default 0 NOT NULL,
	CONSTRAINT UQ_User_UserName		UNIQUE (Username),
	CONSTRAINT UQ_Person			UNIQUE (Firstname, LastName, PhoneNumber),
	CONSTRAINT UQ_User_Email		UNIQUE (Email)
);

CREATE TABLE Request (
	Id					int				PRIMARY KEY IDENTITY(1,1),
	UserId				int				NOT NULL,
	Description			varchar(100)	NOT NULL,
	Justification		varchar(255)	NOT NULL,
	DateNeeded			date			NULL,
	DeliveryMode		varchar(25)		NOT NULL,
	Status				varchar(20)		default 'New' NOT NULL,
	Total				decimal(10,2)	NOT NULL,
	SubmittedDate		datetime		default current_timestamp NOT NULL,
	ReasonForRejection	varchar(100)	NULL,
	FOREIGN KEY (UserId)				REFERENCES Users(Id)
);

CREATE TABLE Vendor (
	Id				int				PRIMARY KEY IDENTITY(1,1),
	Code			varchar(10)		NOT NULL,
	Name			varchar(255)	NOT NULL,
	Address			varchar(255)	NOT NULL,
	City			varchar(255)	NOT NULL,
	State			char(2)			NOT NULL,
	Zip				char(5)			NOT NULL,
	PhoneNumber		varchar(12)		NOT NULL,
	Email			varchar(100)	NOT NULL,
	CONSTRAINT UQ_Vendor_Business	UNIQUE (Name, Address, City, State),
	CONSTRAINT UQ_Vendor_Code		UNIQUE (Code)
);

CREATE TABLE Products (
	Id				int				PRIMARY KEY IDENTITY(1,1),
	VendorId		int				NOT NULL,
	PartNumber		varchar(50)		NOT NULL,
	Name			varchar(150)	NOT NULL,
	Price			decimal(10,2)	NOT NULL,
	Unit			varchar(255)	NULL,
	PhotoPath		varchar(255)	NULL,
	CONSTRAINT UQ_Vendor_Part		UNIQUE (VendorId, PartNumber),
	FOREIGN KEY (VendorId)			REFERENCES Vendor(Id)
);

CREATE TABLE LineItem (
	Id				int				PRIMARY KEY IDENTITY(1,1),
	RequestId		int				NOT NULL,
	ProductID		int				NOT NULL,
	Quantity		int				NOT NULL,
	FOREIGN KEY (RequestId)			REFERENCES Request(Id),
	FOREIGN KEY (ProductId)			REFERENCES Products(Id),
	CONSTRAINT UQ_Product_Request	UNIQUE (RequestId, ProductId)
);

--Inserting some users
INSERT INTO Users (Username, Password, FirstName, LastName, PhoneNumber, Email, Reviewer, Admin)
VALUES
	('Boomerang Guy', 'p0nytail!', 'Sokka', 'Water Tribe', '555-5555', 'WangFire@watertribe.net', 1, 1),
	('Sifu Katara', 'DeadM0m', 'Katara', 'Water Tribe', '555-5555', 'SaphhireFire@watertribe.net', 1, 0),
	('The Avatar', 'Gyatso', 'Aang', 'the Avatar', '867-5309', 'Kuzon@airnomads.com', 0, 1),
	('TheBestBender', 'metal4lyfe', 'Toph', 'Beifong', '123-4567', 'BlindBandit@earth.kingdom.com', 0, 0),
	('FireLord', 'scarface', 'Fire Lord', 'Zuko', '320-4352', 'mommasboy@firenation.net', 1, 1);

--Inserting some vendors
INSERT INTO Vendor (Code, Name, Address, City, State, Zip, PhoneNumber, Email)
VALUES
	('0000010101', 'Varrick Global Industries', '171 Harbour Way', 'Republic City', 'EK', '56782', '623-5467', 'VGI@republic.com'),
	('0000020101', 'Future Industries', '170 Sato Street', 'Republic City', 'EK', '56728', '523-5617', 'SatoFutureIndustries@republic.com'),
	('0000010201', 'Cabbage Corp', '120 Leafy Lane', 'Ba Sing Se', 'EK', '23486', '513-5852', 'mycabbages@market.net'),
	('0000010102', 'Fifth Nation', '689 Pirate Bay', 'South Pole', 'WT', '68422', '666-6666', 'curios@mobile.net'),
	('0000010103', 'Fire Nation Circus', '102 Lion Vulture Drive', 'Ember Island', 'FN', '75395', '755-3685', 'ShuExotic@bigtent.com');

--Inserting some products
INSERT INTO Products (VendorId, PartNumber, Name, Price, Unit, PhotoPath)
VALUES
	(1, 'AV1', 'Satomobile Car', 15000.99, NULL, NULL),
	(2, 'AV1', 'Satomobile Car', 18000.99, NULL, NULL),
	(3, 'AV1', 'Satomobile Car', 16999.99, NULL, NULL),
	(4, 'CO1', 'Ruby-Eyed Monkey Statue', 500.00, NULL, NULL),
	(5, 'EA1', 'Platypus Bear', 86.00, 'cub', NULL),
	(4, 'EA1', 'Platypus Bear', 120.00, 'cub', NULL),
	(3, 'FP1', 'Cabbage', 3.00, 'head', NULL),
	(4, 'FP1', 'Cabbage', 2.00, 'head', NULL),
	(5, 'FP1', 'Cabbage', 0.50, 'head', NULL),
	(3, 'FP2', 'Cabbage', 30.00, 'crate', NULL),
	(4, 'FP2', 'Cabbage', 20.00, 'crate', NULL),
	(5, 'FP2', 'Cabbage', 5.00, 'crate', NULL),
	(3, 'AV2', 'Cabbage Compact', 8000.99, NULL, NULL),
	(2, 'AV2', 'Cabbage Compact', 10000.99, NULL, NULL),
	(4, 'CO2', 'Waterbending Scroll', 200.00, NULL, NULL),
	(1, 'CO3', 'Satomobile Air Freshener', 15.00, 'each', NULL),
	(2, 'CO3', 'Satomobile Air Freshener', 13.00, 'each', NULL),
	(3, 'CO3', 'Satomobile Air Freshener', 18.00, 'each', NULL),
	(4, 'CO3', 'Satomobile Air Freshener', 28.00, 'each', NULL),
	(1, 'CO4', 'Satomobile Air Freshener', 40.00, 'three pack', NULL),
	(2, 'CO4', 'Satomobile Air Freshener', 35.00, 'three pack', NULL),
	(3, 'CO4', 'Satomobile Air Freshener', 50.00, 'three pack', NULL),
	(4, 'CO4', 'Satomobile Air Freshener', 80.00, 'three pack', NULL),
	(1, 'AV3', 'Mecha Tank', 299.99, NULL, NULL),
	(2, 'AV3', 'Mecha Tank', 299.99, NULL, NULL),
	(3, 'AV3', 'Mecha Tank', 399.99, NULL, NULL),
	(4, 'EA2', 'Sky Bison', 800.00, 'calf', NULL),
	(5, 'EA2', 'Sky Bison', 820.00, 'calf', NULL),
	(5, 'EA3', 'Sky Bison', 420.00, 'adult', NULL),
	(4, 'EA3', 'Sky Bison', 400.00, 'adult', NULL);

Select *
FROM Vendor;

Select *
FROM Users;

Select *
FROM Products;