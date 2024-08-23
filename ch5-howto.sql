-- chapter 5, 137

SELECT COUNT(*) AS NumberOfInvoices,
	SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;

--looking for # of invoices, avg invoice amount, and total invoice amount post-7/1/22
SELECT 'After 7/1/2022' AS SelectionDate, COUNT(*) AS NumberOfIn
	FROM Invoices
	WHERE InvoiceDate > '2022-07-01';

--139 - distinct
SELECT COUNT(DISTINCT VendorID) AS NumberOfVendors,
	COUNT(VendorID) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
FROM Invoices
WHERE InvoiceDate > '2022-07-01';

--141 - avg income by vendor
--need to group vendorids and average their totals
SELECT VendorID, AVG(InvoiceTotal) AS AverageInvoiceAmount
	FROM Invoices
GROUP BY VendorId
ORDER BY AverageInvoiceAmount DESC;

--to only see the big bois:
SELECT VendorID, AVG(InvoiceTotal) AS AverageInvoiceAmount
	FROM Invoices
GROUP BY VendorId
HAVING AVG(InvoiceTotal) > 2000
ORDER BY AverageInvoiceAmount DESC;

--143 count number of invoices by vendor - summary
SELECT VendorID, COUNT(*) AS InvoiceQuantity
FROM Invoices
GROUP BY VendorID
ORDER BY 'InvoiceQuantity';

--To just get ones with multi invoices
SELECT VendorID, COUNT(*) AS InvoiceQuantity
FROM Invoices
GROUP BY VendorID
HAVING COUNT(*) > 1
ORDER BY 'InvoiceQuantity';

--Join w/group by and order by
--# of invoices and avg invoice amount for vendors in each state/city
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty, 
		AVG(InvoiceTotal) AS InvoiceAvg
	FROM Invoices i
	JOIN Vendors v ON v.VendorID = i.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VendorState, VendorCity;

--pg 145
--summary w/search condition in having clause
SELECT VendorName, COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
FROM Vendors v
JOIN Invoices i ON v.VendorID = i.VendorID
GROUP BY VendorName
HAVING AVG(InvoiceTotal) > 500
ORDER BY InvoiceQty DESC;

--147 - having vs where
SELECT InvoiceDate, COUNT(*) AS InvoiceQty,
	SUM(InvoiceTotal) AS InvoiceSum
FROM Invoices
GROUP BY InvoiceDate
HAVING InvoiceDate Between '2023-01-01' AND '2023-01-31'
	AND COUNT(*) > 1
	AND SUM(InvoiceTotal) > 100
ORDER BY InvoiceDate DESC;

SELECT InvoiceDate, COUNT(*) AS InvoiceQty,
	SUM(InvoiceTotal) AS InvoiceSum
FROM Invoices
WHERE InvoiceDate BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY InvoiceDate
HAVING COUNT(*) > 1
	AND SUM(InvoiceTotal) > 100
ORDER BY InvoiceDate DESC;

--148 - 149 - sql svr extensions - not in mysql/other dbs
--rollup: add summary rows at bottom of results
SELECT VendorID, COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceTotal
FROM Invoices
GROUP BY ROLLUP(VendorID);

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendorsFROM VendorsWHERE VendorState IN ('IA', 'NJ')
GROUP BY ROLLUP(VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

--150-151 - cube
--Adds summary rows for every combo of groups
SELECT VendorID, COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceTotal
FROM Invoices
GROUP BY CUBE(VendorID);

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendorsFROM VendorsWHERE VendorState IN ('IA', 'NJ')
GROUP BY CUBE(VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;