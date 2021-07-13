USE AdventureWorks2019
GO
--Q1
SELECT a.[ProductID], a.[Name], a.[Color], a.[ListPrice]
FROM Production.Product a
--Q2
SELECT a.[ProductID], a.[Name], a.[Color], a.[ListPrice]
FROM Production.Product a
WHERE a.[ListPrice] = 0
--Q3
SELECT a.[ProductID], a.[Name], a.[Color], a.[ListPrice]
FROM Production.Product a
WHERE a.[Color] is NULL
--Q4
SELECT a.[ProductID], a.[Name], a.[Color], a.[ListPrice]
FROM Production.Product a
WHERE a.[Color] is not NULL
--Q5
SELECT a.[ProductID], a.[Name], a.[Color], a.[ListPrice]
FROM Production.Product a
WHERE a.[Color] is not NULL AND a.[ListPrice] >0
--Q6
SELECT a.[Name], a.[Color]
FROM Production.Product a
WHERE a.[Color] is not NULL
--Q7
SELECT 'NAME: '+a.[Name]+' -- '+'COLOR: '+a.[Color] AS [Name And Color]
FROM Production.Product a
WHERE a.[Name] is not NULL AND a.[Color] is not NULL
-- Q8
SELECT a.[ProductID], a.[Name]
FROM Production.Product a
WHERE a.[ProductID] between 400 and 500
--Q9
SELECT a.[ProductID], a.[Name], a.[Color]
FROM Production.Product a
WHERE a.[Color] not in ('black','blue')
--Q10
SELECT a.[Name]
FROM Production.Product a
WHERE a.[Name] like 'S%'
--Q11
SELECT a.[Name], a.[ListPrice]
FROM Production.Product a
WHERE a.[Name] like 'S%'
--Q12
SELECT a.[Name], a.[ListPrice]
FROM Production.Product a
WHERE a.[Name] like 'S%' OR a.[Name] like 'A%'
--Q13
SELECT a.[Name], a.[ListPrice]
FROM Production.Product a
WHERE a.[Name] like '[S][P][O][^K]%'

--Q14
SELECT DISTINCT a.[Color]
FROM Production.Product a
ORDER BY a.[Color] DESC

--Q15
SELECT DISTINCT a.[ProductSubcategoryID] , a.[Color]
FROM Production.Product a
WHERE a.[ProductSubcategoryID] is not NULL AND a.[Color] is not NULL

--Q16
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE (Color not IN ('Red','Black')
      AND ProductSubCategoryID = 1)
      OR (ListPrice BETWEEN 1000 AND 2000 )
ORDER BY ProductID

--Q17
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice
FROM Production.Product
WHERE (Color not IN ('Red','Black')
      AND ProductSubCategoryID = 1)
	  AND (Color IN ('Silver') AND ListPrice >1000)
      OR ((ListPrice BETWEEN 1000 AND 2000 )
			OR Color IN ('Black') 
			AND ListPrice >500 
			AND ProductSubcategoryID = 1)
ORDER BY ProductID