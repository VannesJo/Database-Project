USE Database_Final_project
GO
-- SOAL 1
SELECT
	pt.StaffID as [StaffId],
	[Total Purchase] = COUNT(pd.PurchaseTransactionID),
	v.VendorName
FROM Vendor as v
JOIN PurchaseTransaction as pt ON v.VendorID = pt.VendorID
JOIN PurchaseDetail as pd ON pt.PurchaseTransactionID = pd.PurchaseTransactionID
WHERE v.VendorName LIKE '% Tillman'
GROUP BY pt.StaffID, v.VendorName
HAVING COUNT(pd.PurchaseTransactionID) > 1

-- SOAL 2
SELECT
	s.StaffID,
	s.StaffName,
	s.StaffSalary,
	[Total Bionic Sold] = SUM(sd.SalesQuantity)
FROM Staff as s
JOIN SalesHeader as sh ON s.StaffID = sh.StaffID
JOIN SalesDetail as sd ON sh.SalesID = sd.SalesID
WHERE s.StaffSalary BETWEEN 8000000 AND 10000000
GROUP BY s.StaffID, s.StaffName, s.StaffSalary
HAVING SUM(sd.SalesQuantity) > 10

-- SOAL 3
SELECT
	sd.SalesID,
	CustomerName,
	CustomerGender,
	[Total Quantity Purchased] = SUM(SalesQuantity),
	[Total Bionic Purchased] = COUNT(sd.BionicID),
	CONVERT(VARCHAR, SalesTransactionDate, 107) as [SalesDate]
FROM Customer as c
JOIN SalesHeader as sh ON c.CustomerID = sh.CustomerID
JOIN SalesDetail as sd ON sd.SalesID = sh.SalesID
WHERE CustomerGender LIKE 'Female'
GROUP BY sd.SalesID, CustomerGender, SalesTransactionDate, CustomerName
HAVING SUM(SalesQuantity) > 7

-- SOAL 4
SELECT 
	[PurchaseID] = 'Purchase ' + CONVERT(VARCHAR, RIGHT(pd.PurchaseTransactionID, 3)),
	[Total Purchase Detail] = COUNT(pd.PurchaseTransactionID),
	[Highest Bionic Price] = MAX(b.BionicPrice),
	[TypeName] = bt.BionicTypeName
FROM PurchaseDetail as pd
JOIN Bionic as b ON pd.BionicID = b.BionicID
JOIN BionicType as bt ON b.BionicTypeID = bt.BionicTypeID
WHERE bt.BionicTypeName LIKE 'Hand'
GROUP BY bt.BionicTypeName, pd.PurchaseTransactionID 
HAVING COUNT(pd.PurchaseTransactionID) > 1

-- SOAL 5
SELECT
	s.StaffName,
	[StaffSalary] = 'Rp. ' + CAST(CAST(s.StaffSalary as BIGINT) AS NVARCHAR(18)),
	s.StaffGender,
	CONVERT(VARCHAR, pt.TransactionDate,107) as [PurchaseDate],
	v.VendorName
FROM Staff as s
JOIN PurchaseTransaction as pt ON s.StaffID = pt.StaffID
JOIN Vendor as v ON pt.VendorID = v.VendorID,
(
	SELECT 
		AVG(StaffSalary) as [AvgStaffSalary]
	FROM Staff
) AvgSalary
WHERE s.StaffSalary > AvgSalary.AvgStaffSalary AND YEAR(pt.TransactionDate) = 2020

-- SOAL 6

SELECT 
	sh.SalesID,
	s.StaffID,
	s.StaffName,
	s.StaffSalary,
	[StaffGender] = LEFT(StaffGender, 1),
	b.BionicName,
	[Total Sold Price] = b.BionicPrice * sd.SalesQuantity,
	CONVERT(VARCHAR, sh.SalesTransactionDate, 106) as [SalesDate]
FROM Staff as s
JOIN SalesHeader as sh ON s.StaffID = sh.StaffID
JOIN SalesDetail as sd ON sh.SalesID = sd.SalesID
JOIN Bionic as b ON sd.BionicID = b.BionicID,
(
	SELECT
		AVG(b.BionicPrice * sd.SalesQuantity) as [AvgPrice]
	FROM Bionic as b
	JOIN SalesDetail as sd ON b.BionicID = sd.BionicID
) AvgTransactionPrice
WHERE (b.BionicPrice * sd.SalesQuantity) > AvgTransactionPrice.AvgPrice AND s.StaffSalary < 5000000

-- SOAL 7

SELECT 
	 [SalesId] = 'Sales ' + CONVERT(VARCHAR, RIGHT(sh.SalesID, 3)),
	 [SalesDate] = CONVERT(VARCHAR, SalesTransactionDate, 107),
	 [Total Quantity] = CAST(SUM(sd.SalesQuantity) AS VARCHAR) + ' Pc(s)',
	 b.BionicName,
	 [TypeName] = bt.BionicTypeName,
	 [TypeDurability] = bt.BionicTypeDurability
FROM SalesHeader as sh
JOIN SalesDetail as sd ON sh.SalesID = sd.SalesID
JOIN Bionic as b ON sd.BionicID = b.BionicID
JOIN BionicType as bt ON b.BionicTypeID = bt.BionicTypeID,
(
	SELECT 
		AVG(BionicTypeDurability) as [TypeDur]
	FROM BionicType
) AvgDurability
WHERE bt.BionicTypeDurability < AvgDurability.TypeDur AND YEAR(sh.SalesTransactionDate) > 2016
GROUP BY sh.SalesID, SalesTransactionDate, bt.BionicTypeName, bt.BionicTypeDurability, b.BionicName

-- SOAL 8

SELECT
	[VendorId] = 'Vendor ' + CONVERT(VARCHAR, RIGHT(v.VendorID, 3)),
	[Total Quantity] = CAST(SUM(pd.PurchaseQuantity) AS VARCHAR) + ' Pc(s)',
	b.BionicID,
	bt.BionicTypeName as [TypeName],
	bt.BionicTypeDurability as [TypeDurability]
FROM Vendor as v
JOIN PurchaseTransaction as pt ON v.VendorID = pt.VendorID
JOIN PurchaseDetail as pd ON pt.PurchaseTransactionID = pd.PurchaseTransactionID
JOIN Bionic as b ON pd.BionicID = b.BionicID
JOIN BionicType as bt ON b.BionicTypeID = bt.BionicTypeID,
(
	SELECT
		MAX(BionicStock) as [MaxStock]
	FROM Bionic
) MaxBionicStock
WHERE pd.PurchaseQuantity >= MaxBionicStock.MaxStock AND bt.BionicTypeName LIKE 'Eye'
GROUP BY v.VendorID, b.BionicID, bt.BionicTypeName, bt.BionicTypeDurability
ORDER BY SUM(pd.PurchaseQuantity) DESC

-- SOAL 9
GO
CREATE VIEW LoyalCustomer
AS
	SELECT
		c.CustomerID,
		c.CustomerName,
		c.CustomerGender,
		[Total Transaction] = COUNT(sd.SalesID),
		[Total Bionic Bought] = CAST(SUM(sd.SalesQuantity) AS VARCHAR) + ' Pc(s)'
	FROM Customer as c
	JOIN SalesHeader as sh ON c.CustomerID = sh.CustomerID
	JOIN SalesDetail as sd ON sh.SalesID = sd.SalesID
	GROUP BY c.CustomerID, c.CustomerName, c.CustomerGender
	HAVING SUM(sd.SalesQuantity) > 10 AND COUNT(sd.SalesID) > 1

-- SOAL 10
GO
CREATE VIEW StaffPurchaseRecap
AS
	SELECT
		[StaffId] = s.StaffID,
		s.StaffName,
		s.StaffSalary,
		[Total Purchase Finished] = COUNT(pd.PurchaseTransactionID),
		[Total Bionic Purchased] = SUM(pd.PurchaseQuantity)
	FROM Staff as s
	JOIN PurchaseTransaction as pt ON s.StaffID = pt.StaffID
	JOIN PurchaseDetail as pd ON pt.PurchaseTransactionID = pd.PurchaseTransactionID
	WHERE YEAR(pt.TransactionDate) > 2016
	GROUP BY s.StaffID, s.StaffName, s.StaffSalary
	HAVING COUNT(pd.PurchaseTransactionID) > 1

