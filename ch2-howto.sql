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