-- chapter 6 pg 161; what if we want invoices w/total > avg invoice total
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
		WHERE InvoiceTotal > 
		(SELECT AVG (InvoiceTotal)
		FROM Invoices)
ORDER BY InvoiceTotal;

--innerjoin vs subquery 163
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices i
	JOIN Vendors v ON i.VendorID = v.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
	WHERE VendorID IN
		(SELECT VendorID
		FROM Vendors
		WHERE VendorState = 'CA')
ORDER BY InvoiceDate;