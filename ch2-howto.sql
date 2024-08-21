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