--Updating the Region Table
INSERT INTO Region (Region)
VALUES
	('North'),
	('South'),
	('East'),
	('West');
	GO

--Updating the SalesPerson Table
INSERT INTO SalesPerson (FirstName, LastName, RegionId)
VALUES
	('John', 'Doe', 1),
	('Jane', 'Smith', 2),
	('Alice', 'Brown', 3),
	('Bob', 'Johnson', 4),
	('Eve', 'Davis', 1);
	GO

--Updating the Customer Table
INSERT INTO Customer (CustomerName)
VALUES
	('Acme Corp'), 
	('Beta Inc'), 
	('Delta Co'), 
	('Epsilon Ltd'), 
	('Gamma LLC'), 
	('Omega Enterprises'), 
	('Sigma Solutions'), 
	('Zeta Partners');
	GO

--Updating the Sales Table
INSERT INTO Sales (SalesPersonId, SalesDate, SalesAmount, CustomerId)
VALUES
	(2, '2024-02-29', 1438, 1),
	(5, '2024-02-04', 1601, 1),
	(5, '2024-08-15', 3382, 1),
	(1, '2023-12-08', 3090, 2),
	(3, '2024-04-09', 1692, 2),
	(3, '2024-05-12', 4040, 2),
	(3, '2023-10-04', 4341, 2),
	(4, '2023-10-23', 1866, 2),
	(5, '2023-11-26', 2091, 3),
	(2, '2023-12-25', 4833, 4),
	(1, '2024-05-27', 1336, 5),
	(5, '2023-09-23', 1546, 5),
	(1, '2024-07-10', 4263, 6),
	(2, '2024-04-06', 3722, 6),
	(2, '2024-07-01', 4930, 6),
	(3, '2024-04-28', 2757, 6),
	(3, '2024-01-10', 4581, 6),
	(2, '2024-01-21', 1246, 7),
	(3, '2024-01-08', 3738, 7),
	(3, '2024-04-22', 4809, 8),
	(2, '2024-08-21', 9600, 8),
	(3, '2024-08-20', 2300, 4),
	(4, '2024-08-21', 5600, 5);
GO