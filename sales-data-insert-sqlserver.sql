USE SALESDB;
GO

--SET IDENTITY_INSERT dbo.Sales_Denormalized OFF;
--GO

-- Insert the data into sales_denormalized
INSERT INTO dbo.Sales_Denormalized (SalesPersonId, SalesPersonFirstName, SalesPersonLastName, Region, SalesDate, SalesAmount, Customer)
VALUES
(4, 'Bob', 'Johnson', 'West', '2023-10-23', 1866, 'Beta Inc'),
(5, 'Eve', 'Davis', 'North', '2024-08-15', 3382, 'Acme Corp'),
(3, 'Alice', 'Brown', 'East', '2024-01-10', 4581, 'Omega Enterprises'),
(5, 'Eve', 'Davis', 'North', '2023-11-26', 2091, 'Delta Co'),
(2, 'Jane', 'Smith', 'South', '2024-01-21', 1246, 'Sigma Solutions'),
(3, 'Alice', 'Brown', 'East', '2024-04-16', 2899, 'Gamma LLC'),
(2, 'Jane', 'Smith', 'South', '2023-12-19', 1825, 'Acme Corp'),
(4, 'Bob', 'Johnson', 'West', '2023-09-10', 3005, 'Epsilon Ltd'),
(1, 'John', 'Doe', 'North', '2023-11-03', 1882, 'Zeta Partners'),
(5, 'Eve', 'Davis', 'North', '2024-07-05', 1444, 'Beta Inc'),
(3, 'Alice', 'Brown', 'East', '2023-12-12', 1323, 'Omega Enterprises'),
(1, 'John', 'Doe', 'North', '2024-02-18', 4870, 'Gamma LLC'),
(1, 'John', 'Doe', 'North', '2023-11-27', 1162, 'Delta Co'),
(4, 'Bob', 'Johnson', 'West', '2024-04-05', 3081, 'Acme Corp'),
(5, 'Eve', 'Davis', 'North', '2024-03-18', 2654, 'Sigma Solutions'),
(2, 'Jane', 'Smith', 'South', '2024-08-05', 3569, 'Epsilon Ltd'),
(3, 'Alice', 'Brown', 'East', '2024-06-26', 2124, 'Omega Enterprises'),
(4, 'Bob', 'Johnson', 'West', '2023-11-07', 1802, 'Beta Inc'),
(1, 'John', 'Doe', 'North', '2024-05-02', 3897, 'Zeta Partners'),
(2, 'Jane', 'Smith', 'South', '2024-02-25', 2336, 'Acme Corp');

GO
