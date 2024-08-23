--1 - pg 156
SELECT VendorID,
	SUM(PaymentTotal) AS PaymentSum
FROM Invoices
GROUP BY VendorID;

--2
SELECT TOP 10 v.VendorName,
	SUM(PaymentTotal) AS PaymentSum
FROM Invoices i
	JOIN Vendors v ON v.VendorID = i.VendorID
GROUP BY v.VendorName;

--3
SELECT VendorName,
	COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceSum
FROM Invoices i
	JOIN Vendors v ON v.VendorID = i.VendorID
GROUP BY v.VendorName
ORDER BY InvoiceCount;

--4
SELECT AccountDescription,
	COUNT(*) AS LineItemCount,
	SUM(InvoiceLineItemAmount) AS LineItemSum
FROM InvoiceLineItems i
	JOIN GLAccounts g ON i.AccountNo = g.AccountNo
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC;

--5
SELECT AccountDescription,
	COUNT(*) AS LineItemCount,
	SUM(InvoiceLineItemAmount) AS LineItemSum
FROM InvoiceLineItems il
	JOIN GLAccounts g ON il.AccountNo = g.AccountNo
	JOIN Invoices i ON i.InvoiceID = il.InvoiceID
	WHERE i.InvoiceDate BETWEEN '2022-10-01' AND '2022-12-31'
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC;

--6
SELECT SUM(InvoiceLineItemAmount) AS LineItemSum, AccountNo AS AccountNo
FROM InvoiceLineItems
GROUP BY ROLLUP (AccountNo);

--7
SELECT VendorName, AccountDescription,
	COUNT(*) AS LineItemCount,
	SUM(InvoiceLineItemAmount) AS LineItemSum
FROM Vendors v
	JOIN Invoices i ON i.VendorID = v.VendorID
	JOIN InvoiceLineItems li ON i.InvoiceID = li.InvoiceID
	JOIN GLAccounts gl ON gl.AccountNo = li.AccountNo
GROUP BY VendorName, AccountDescription
ORDER BY VendorName, AccountDescription;

--8
