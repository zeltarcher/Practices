---------------------------------------------------------- Q & A ----------------------------------------------------------------------------------------
--1.	What is a result set?
--	Result set is the output of a query.

--2.	What is the difference between Union and Union All?
--	union eliminates the duplicated rows but union all will keep all the duplicate rows

--3.	What are the other Set Operators SQL Server has?
--	They are INTERSECT and EXCEPT

--4.	What is the difference between Union and Join?
--	Union is used to combined 2 or more select statements and the result is combined into new distinct rows.
--	Join is used to combined 2 or more tables that match the condition between them.

--5.	What is the difference between INNER JOIN and FULL JOIN?
--	INNER JOIN will return only matching values, non-matching values will be eliminates.
--	FULL JOIN will return all the values even matching or non-matching.

--6.	What is difference between left join and outer join
--	Left join will return all the values of left table and all the matching value of right table to the left table
--	Outer join will return all the values of all tables.

--7.	What is cross join?
--	Cross join is used to return a result table that paired combination of each row of the 1st table with each row of the second table

--8.	What is the difference between WHERE clause and HAVING clause?
--	Where clause is used to filter record from the table based on the specified condition.
--	Having clause is used to filter record from the groups based on the specified condition.

--9.	Can there be multiple group by columns?
--	yes, there can be multiple groupby columns

---------------------------------------------------------- Write queries ----------------------------------------------------------------------------------------
USE AdventureWorks2019
GO
--Q1 Ans: 504
SELECT Count(p.ProductID) AS "total count of product"
FROM Production.Product p
--Q2
SELECT Count(p.ProductID) AS "total count of product"
FROM Production.Product p
WHERE p.ProductSubcategoryID is not NULL
--Q3
SELECT p.ProductSubcategoryID, count(ProductID) AS "CountedProducts"
FROM Production.Product p
GROUP BY p.ProductSubcategoryID
HAVING p.ProductSubcategoryID is not NULL
--Q4
SELECT p.ProductSubcategoryID, count(ProductID) AS "CountedProducts"
FROM Production.Product p
GROUP BY p.ProductSubcategoryID
HAVING p.ProductSubcategoryID is NULL
--Q5
SELECT sum(i.Quantity) AS "SumOfProductsQuantity"
FROM Production.ProductInventory i
--Q6
SELECT TOP 40 i.ProductID, i.LocationID, sum(i.Quantity) AS "TheSum"
FROM Production.ProductInventory i
GROUP BY i.ProductID, i.LocationID
HAVING sum(i.Quantity)<100
--Q7
SELECT TOP 40 i.Shelf, i.ProductID, i.LocationID, sum(i.Quantity) AS "TheSum"
FROM Production.ProductInventory i
GROUP BY i.Shelf, i.ProductID, i.LocationID
HAVING sum(i.Quantity)<100
--Q8
SELECT AVG(i.Quantity) as "TheAvgOfLocIs10"
FROM Production.ProductInventory i
WHERE i.LocationID = 10
--Q9
SELECT i.ProductID, i.Shelf, AVG(i.Quantity) as "TheAvg"
FROM Production.ProductInventory i
GROUP BY i.Shelf, i.ProductID
ORDER BY i.Shelf
--Q10
SELECT i.ProductID, i.Shelf, AVG(i.Quantity) as "TheAvg"
FROM Production.ProductInventory i
GROUP BY i.Shelf, i.ProductID
HAVING i.Shelf not like 'N/A'
--Q11
SELECT p.Color, p.Class, count(p.ProductID) as "TheCount" , cast(avg(p.ListPrice) AS DECIMAL(10,2)) as "AvgPrice"
FROM Production.Product p
GROUP BY p.Color, p.Class
HAVING p.Color is not NULL AND p.Class is not NULL
--Q12
--SELECT * FROM Person.CountryRegion
--SELECT * FROM Person.StateProvince
SELECT c.CountryRegionCode, s.[Name]
FROM Person.CountryRegion c INNER JOIN Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode
--Q13
SELECT c.CountryRegionCode, s.[Name]
FROM Person.CountryRegion c INNER JOIN Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.CountryRegionCode in ('DE','CA')
--Q14
USE NORTHWND
GO

SELECT d.ProductID, DATEDIFF(YYYY, o.OrderDate,GETDATE()) AS "PurchasedYearAgo"
FROM Orders o inner join [Order Details] d
	ON o.OrderID = d.OrderID
WHERE DATEDIFF(YYYY, o.OrderDate,GETDATE())<=25
ORDER BY d.ProductID
--Q15
SELECT top 5 o.ShipPostalCode, sum(d.Quantity) as "TotalQuantity"
FROM Orders o inner join [Order Details] d
	ON o.OrderID = d.OrderID
GROUP BY o.ShipPostalCode
HAVING o.ShipPostalCode is not NULL
ORDER BY sum(d.Quantity) DESC
--or
SELECT o.ShipPostalCode, sum(d.Quantity) as "TotalQuantity"
FROM Orders o inner join [Order Details] d
	ON o.OrderID = d.OrderID
GROUP BY o.ShipPostalCode
HAVING o.ShipPostalCode is not NULL
ORDER BY sum(d.Quantity) DESC
offset 0 rows
fetch next 5 rows only
--Q16
SELECT top 5 o.ShipPostalCode, sum(d.Quantity) as "TotalQuantity", DATEDIFF(YYYY, o.OrderDate,GETDATE()) AS "PurchasedYearAgo"
FROM Orders o inner join [Order Details] d
	ON o.OrderID = d.OrderID
GROUP BY o.ShipPostalCode, DATEDIFF(YYYY, o.OrderDate,GETDATE())
HAVING o.ShipPostalCode is not NULL AND DATEDIFF(YYYY, o.OrderDate,GETDATE()) <= 20
ORDER BY sum(d.Quantity) DESC
--Q17
SELECT c.City, count(c.CustomerID) AS "TotalCustomer"
FROM Customers c
GROUP BY c.City
--Q18
SELECT c.City, count(c.CustomerID) AS "TotalCustomer"
FROM Customers c
GROUP BY c.City
HAVING count(c.CustomerID) > 10
--Q19
SELECT distinct c.ContactName
FROM Orders o inner join Customers c
	ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >'1998-01-01'
--Q20
SELECT c.ContactName, o.OrderDate
FROM Orders o inner join Customers c
	ON o.CustomerID = c.CustomerID
WHERE o.OrderDate in (SELECT TOP 1  o1.OrderDate FROM Orders o1
						ORDER BY o1.OrderDate DESC)
--Q21
SELECT c.ContactName, isnull(sum(d.Quantity),0) as "TotalQuantity"
FROM Customers c left join Orders o
	ON o.CustomerID = c.CustomerID
	left join [Order Details] d
	ON d.OrderID = o.OrderID
GROUP BY c.ContactName
--Q22
SELECT c.CustomerID,c.ContactName, sum(d.Quantity) as "TotalQuantity"
FROM Customers c left join Orders o
	ON o.CustomerID = c.CustomerID
	left join [Order Details] d
	ON d.OrderID = o.OrderID
GROUP BY c.CustomerID,c.ContactName
HAVING sum(d.Quantity)>100
ORDER BY TotalQuantity
--Q23
SELECT distinct sup.CompanyName, ship.CompanyName
FROM Orders o 
	LEFT JOIN [Order Details] d ON o.OrderID = d.OrderID
	INNER JOIN [Products] p ON d.ProductID = p.ProductID
	RIGHT JOIN [Suppliers] sup ON p.SupplierID = sup.SupplierID
	INNER JOIN Shippers ship ON o.ShipVia = ship.ShipperID

--Q24
SELECT o.OrderDate, p.ProductName
FROM Orders o
	LEFT JOIN [Order Details] d ON o.OrderID = d.OrderID
	INNER JOIN Products p ON d.ProductID = p.ProductID
ORDER BY o.OrderDate DESC
--Q25
SELECT e1.FirstName+' '+e1.LastName AS "NameEmp1", e2.FirstName+' '+e2.LastName AS "NameEmp2", e1.Title
FROM Employees e1
	INNER JOIN Employees e2 ON e1.Title = e2.Title AND e1.EmployeeID != e2.EmployeeID
--Q26
SELECT e2.FirstName+' '+e2.LastName AS "Manager", count(e1.EmployeeID) AS "NoEmpReportTo"
FROM Employees e1
	INNER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
GROUP BY e2.FirstName+' '+e2.LastName
HAVING count(e1.EmployeeID)>2
--Q27
SELECT c.City, c.ContactName, 'Customer' as "Type" FROM Customers c
UNION
SELECT sup.City, sup.ContactName, 'Suppliers' as "Type" FROM Suppliers sup
--Q28
CREATE TABLE T1 (F1 int)
CREATE TABLE T2 (F2 int)

--DROP TABLE T1
--DROP TABLE T2

INSERT INTO T1(F1) VALUES(1)
INSERT INTO T1(F1) VALUES(2)
INSERT INTO T1(F1) VALUES(3)

INSERT INTO T2(F2) VALUES(2)
INSERT INTO T2(F2) VALUES(3)
INSERT INTO T2(F2) VALUES(4)

SELECT F1 FROM T1
SELECT F2 FROM T2

SELECT * FROM T1 INNER JOIN T2 ON T1.F1 = T2.F2
--result
--2	2
--3	3


--Q29
SELECT * FROM T1 LEFT JOIN T2 ON T1.F1 = T2.F2
--result
--1	NULL
--2	2
--3	3