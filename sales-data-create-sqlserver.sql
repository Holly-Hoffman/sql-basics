USE MASTER;
GO

DROP DATABASE IF EXISTS SALESDB;
GO


CREATE DATABASE SALESDB;
GO

USE SALESDB;
GO

CREATE TABLE Sales_Denormalized (
	Id int PRIMARY KEY IDENTITY(1,1),
	SalesPersonId int NOT NULL,
	SalesPersonFirstName varchar(25) NOT NULL,
	SalesPersonLastName varchar(25) NOT NULL,
	Region varchar(20) NOT NULL,
	SalesDate date NOT NULL,
	SalesAmount decimal(10,2),
	Customer varchar(50)
);