--Chapter 2 Basic Statements
SELECT*FROM Vendors;

-- Chapter 3 pg 65
SELECT*
	FROM Invoices;
-- same query but only show 3 columns and order by invoice total
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
		ORDER BY InvoiceTotal;

-- two columns and calculated value for specific invoice of ID 17
SELECT InvoiceID, InvoiceTotal, CreditTotal + PaymentTotal AS TotalCredits
FROM Invoices
WHERE InvoiceID = 17;

-- get all invoices between given dates
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceDate BETWEEN '2023-01-01' and '2023-03-31'
ORDER BY InvoiceDate;

-- something that gives empty returns
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 50000;

-- page 69
-- Naming columns in the results set
SELECT InvoiceNumber AS [Invoice Number], InvoiceDate AS Date, InvoiceTotal AS Total
FROM Invoices;

-- doesn't provide name for calculated column
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal
FROM Invoices;

-- pg 71 coding expressions
-- concatenating string data
SELECT VendorCity, VendorState, VendorCity + VendorState
FROM Vendors;

-- making it pretty
SELECT VendorCity, VendorState, VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors;

-- with apostrophes
SELECT VendorName + '''s Address: ', VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors;

-- pg 73
SELECT InvoiceTotal, PaymentTotal, CreditTotal, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices;

SELECT InvoiceID,
	InvoiceID + 7 * 3 AS OrderOfPrecedence,
		(InvoiceID + 7) * 3 AS AddFirst
FROM Invoices
ORDER BY InvoiceID;

SELECT InvoiceID,
	InvoiceID / 10 AS Quotient,
	InvoiceID % 10 AS Remainder
FROM Invoices
ORDER BY InvoiceID;

-- pg 75
SELECT VendorContactFName, VendorContactLName,
	LEFT(VendorContactFName, 1) +
	LEFT(VendorContactLName, 1) AS Initials
FROM Vendors;

SELECT 'Invoice: #' + InvoiceNumber
	+ ', dated ' + CONVERT(char(8), PaymentDate, 1)
	+ ' for $' + CONVERT(varchar(9), PaymentTotal, 1)
FROM Invoices;

SELECT InvoiceDate,
	GETDATE() AS 'Today''s Date',
	DATEDIFF(day, InvoiceDate, GETDATE()) AS Age
FROM Invoices;

-- pg 77

SELECT VendorCity, VendorState
FROM Vendors
ORDER BY VendorCity;

SELECT DISTINCT VendorCity, VendorState
FROM Vendors;

--pg 79

SELECT TOP 5 VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC;

SELECT TOP 5 PERCENT VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC;

SELECT TOP 5 WITH TIES VendorID, InvoiceDate
FROM Invoices
ORDER BY InvoiceTotal ASC;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceDate > '01/01/2023'
	OR InvoiceTotal > 500
	AND InvoiceTotal - PaymentTotal - CreditTotal > 0;

-- Pg 93

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorName;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorName DESC;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorState, VendorCity, VendorName;

--Pg 95

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY Address, VendorName;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorContactLName + VendorContactFName;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY 2, 1;

-- pg 97

SELECT VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC
	OFFSET 0 ROWS
	FETCH FIRST 5 ROWS ONLY;

SELECT VendorName, VendorCity, VendorState, VendorZipCode
FROM Vendors
WHERE VendorState = 'CA'
ORDER BY VendorCity
	OFFSET 10 ROWS
	FETCH NEXT 10 ROWS ONLY;

--HOMEWORK from pg 99

SELECT VendorContactFName, VendorContactLName, VendorName
FROM Vendors
ORDER BY 2, 1;

SELECT InvoiceNumber AS Number, InvoiceTotal AS Total,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - PaymentTotal AS Balance
FROM Invoices;

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName;

SELECT InvoiceTotal, InvoiceTotal % 10 AS [10%], InvoiceTotal + (InvoiceTotal % 10) AS [Plus 10%]
FROM Invoices
WHERE InvoiceTotal > 1000
ORDER BY InvoiceTotal;

SELECT InvoiceNumber AS Number, InvoiceTotal AS Total,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - PaymentTotal AS Balance
FROM Invoices
WHERE InvoiceTotal >= 500 AND InvoiceTotal <= 10000;

--This one sucked a lot.

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName NOT LIKE 'D%' AND VendorContactLName < 'F'
ORDER BY VendorContactLName, VendorContactFName;

SELECT *
FROM Invoices
WHERE InvoiceTotal - PaymentTotal = 0 AND PaymentDate IS NOT NULL
	OR InvoiceTotal - PaymentTotal <> 0 AND PaymentDate IS NULL;

--Second homework from 8/21
--pg 103

SELECT InvoiceNumber, VendorName
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID;

--pg 105

SELECT InvoiceNumber, VendorName, InvoiceDueDate,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Vendors v
	JOIN Invoices i
		ON v.VendorID = i.VendorID
Where InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY InvoiceDueDate;

--pg 107

SELECT VendorName, CustLastName, CustFirstName, VendorState AS State, VendorCity AS City
FROM AP.dbo.Vendors v
	JOIN ProductOrders.dbo.Customers c
		ON v.VendorZipCode = c.CustZip
ORDER BY State, City;

SELECT VendorName, CustLastName, CustFirstName, VendorState AS State, VendorCity AS City
FROM Vendors v
	JOIN ProductOrders..Customers c
		ON v.VendorZipCode = c.CustZip
ORDER BY State, City;

SELECT InvoiceNumber, InvoiceDate,
	InvoiceTotal, InvoiceLineItemAmount
FROM Invoices i
	JOIN InvoiceLineItems li
		ON i.InvoiceID = li.InvoiceID AND
		i.InvoiceTotal > li.InvoiceLineItemAmount
ORDER BY InvoiceNumber;

SELECT InvoiceNumber, InvoiceDate,
	InvoiceTotal, InvoiceLineItemAmount
FROM Invoices i
	JOIN InvoiceLineItems li
		ON i.InvoiceID = li.InvoiceID
WHERE i.InvoiceTotal > li.InvoiceLineItemAmount
ORDER BY InvoiceNumber;

SELECT DISTINCT v1.VendorName, v1.VendorCity, v1.VendorState
FROM Vendors v1
	JOIN Vendors v2
		ON v1.VendorCity = v2.VendorCity AND
		v1.VendorState = v2.VendorState AND
		v1.VendorID <> v2.VendorID
ORDER BY v1.VendorState, v1.VendorCity;

-- pg 113

--pg 132

SELECT *
FROM Vendors
	JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID;

SELECT VendorName, InvoiceNumber, InvoiceDate, (InvoiceTotal - (PaymentTotal + CreditTotal)) AS 'Balance'
FROM Vendors Vnd
	JOIN Invoices Inv ON Vnd.VendorID = Inv.VendorID
WHERE (InvoiceTotal - (PaymentTotal + CreditTotal)) > 0
ORDER BY VendorName;

SELECT VendorName, DefaultAccountNo, AccountDescription
FROM Vendors
	JOIN GLAccounts ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
ORDER BY AccountDescription, VendorName;

SELECT VendorName, InvoiceNumber, InvoiceDate, (InvoiceTotal - (PaymentTotal + CreditTotal)) AS 'Balance'
FROM Vendors Vnd, Invoices Inv
WHERE Vnd.VendorID = Inv.VendorID
	AND (InvoiceTotal - (PaymentTotal + CreditTotal)) > 0
ORDER BY VendorName;

SELECT VendorName AS 'Vendor', InvoiceDate AS 'Date', InvoiceNumber AS 'Number', InvoiceSequence AS '#', InvoiceLineItemAmount AS 'LineItem'
FROM Vendors v
	JOIN Invoices i ON v.VendorID = i.VendorID
	JOIN InvoiceLineItems li ON i.InvoiceID = li.InvoiceID
ORDER BY 'Vendor', 'Date', 'Number', '#';

--Finish this one - reference 111
SELECT DISTINCT v1.VendorID, v1.VendorName, (v1.VendorContactFName + ' ' + v1.VendorContactLName) AS Name
FROM Vendors v1
	JOIN Vendors v2 ON v1.VendorName = v2.VendorContactFName;

--number 7
SELECT GL.AccountNo, GL.AccountDescription
FROM GLAccounts GL
	LEFT JOIN InvoiceLineItems IL ON IL.AccountNo = GL.AccountNo
	WHERE IL.AccountNo IS NULL
ORDER BY GL.AccountNo;