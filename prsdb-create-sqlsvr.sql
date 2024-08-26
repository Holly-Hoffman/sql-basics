USE MASTER;
GO

DROP DATABASE IF EXISTS PRSDB;
GO


CREATE DATABASE PRSDB;
GO

USE PRSDB;
GO

CREATE TABLE Users (
	Id int PRIMARY KEY IDENTITY(1,1),
	Username varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	PhoneNumber varchar(25) NOT NULL,
	Email varchar(255) NOT NULL,
	Reviewer char(1) NOT NULL,
	Admin char(1) NOT NULL,
	CONSTRAINT UQ_User_Name UNIQUE (Username),
	CONSTRAINT UQ_Person UNIQUE (Firstname, LastName, PhoneNumber),
	CONSTRAINT UQ_Email UNIQUE (Email)
);

CREATE TABLE Request (
	Id int PRIMARY KEY IDENTITY(1,1),
	UserId int NOT NULL,
	Description varchar(255) NOT NULL,
	Justification varchar(255) NOT NULL,
	DateNeeded date,
	DeliveryMode varchar(50) NOT NULL,
	Status varchar(50) NOT NULL,
	Total decimal(20,2) NOT NULL,
	SubmittedDate smalldatetime NOT NULL,
	ReasonForRejection varchar(255),
	FOREIGN KEY (UserId) REFERENCES Users(Id)
);

CREATE TABLE Vendor (
	Id int PRIMARY KEY IDENTITY(1,1),
	Code varchar(255) NOT NULL,
	Name varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	State char(2),
	Zip varchar(10) NOT NULL,
	PhoneNumber varchar(25) NOT NULL,
	Email varchar(255) NOT NULL,
	CONSTRAINT UQ_Vendor UNIQUE (Name, Address, City, State)
);

CREATE TABLE Products (
	Id int PRIMARY KEY IDENTITY(1,1),
	VendorId int NOT NULL,
	PartNumber varchar(255) NOT NULL,
	Name varchar(255) NOT NULL,
	Price decimal(10,2) NOT NULL,
	Unit varchar(255) NOT NULL,
	CONSTRAINT UQ_PartNum UNIQUE (PartNumber),
	FOREIGN KEY (VendorId) REFERENCES Vendor(Id)
);

CREATE TABLE LineItem (
	Id int PRIMARY KEY IDENTITY(1,1),
	RequestId int NOT NULL,
	ProductID int NOT NULL,
	Quantity int NOT NULL,
	FOREIGN KEY (RequestId) REFERENCES Request(Id),
	FOREIGN KEY (ProductId) REFERENCES Products(Id)
);