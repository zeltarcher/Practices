----------------------------------------------- Q & A ------------------------------------------------------------
--1.	In SQL Server, assuming you can find the result by using both joins and subqueries, which one would you prefer to use and why?
	--I would prefer using JOINS because its faster and more optimize than subqueries
--2.	What is CTE and when to use it?
	-- CTE (Common Table Expression) is a temporary result set that you can reference withn another SELECT, INSERT,... statement.
	-- We can use CTE for recursive as well
--3.	What are Table Variables? What is their scope and where are they created in SQL Server?
	-- Table variables is alike with normal table, but it can be call in store procedure as an instance that we can access its values fields. 
	-- Table variables is scoped to the store procedure, batch, or user-defined function
--4.	What is the difference between DELETE and TRUNCATE? Which one will have better performance and why?
	-- DELETE is DML, will delete records one-by-one and have a log for each of them
	-- TRUNCATE is DDL, remove all records and does not activate triggers
	-- TRUNCATE is faster than DELETE because it use less transaction log
--5.	What is Identity column? How does DELETE and TRUNCATE affect it?
	-- Identity column is an automatically generate key values based on a provided starting point and increment
	-- DELETE will retains the identity and does not reset it to the starting poing, while TRUNCATE will reset the identity to its starting point
--6.	What is difference between “delete from table_name” and “truncate table table_name”?
	-- “delete from table_name” may remove conditionally if the where clause is used
	-- While “truncate table table_name” always remove all the rows from a table
----------------------------------------------- Queries ------------------------------------------------------------
--Q1
SELECT DISTINCT city from Employees
WHERE city in (SELECT DISTINCT city from Customers)

--Q2
--a. use sub-query
SELECT DISTINCT city from Customers
WHERE not city in (SELECT DISTINCT city from Employees)

--b. not use sub-query
SELECT DISTINCT city from Customers 
except
SELECT DISTINCT city from Employees

--Q3
SELECT p.ProductName , (
					SELECT sum(od.Quantity)
					FROM [Order Details] od
					WHERE p.ProductID = od.ProductID
					) as "Quantity"
FROM Products p
--Q4

SELECT o.ShipCity, sum(Quantity) as "Qty"
FROM Orders o
	INNER JOIN
	[Order Details] od
	ON o.OrderID = od.OrderID
	INNER JOIN
	Customers c
	ON o.CustomerID = c.CustomerID
GROUP BY o.ShipCity
				

--Q5
-- a. UNION
SELECT c1.City FROM Customers c1 GROUP BY c1.City HAVING COUNT(c1.City) > 2
UNION
SELECT c2.City FROM Customers c2 GROUP BY c2.City HAVING COUNT(c2.City) = 2;


-- b. SUB-QUERY, NO UNION
SELECT DISTINCT c1.City
FROM Customers c1
WHERE c1.City in (
				SELECT c2.city
				FROM Customers c2
				GROUP BY c2.City
				HAVING COUNT(*) >= 2
				)
--Q6
SELECT DISTINCT c.City
FROM Orders o
	JOIN
	[Order Details] od
	ON o.OrderID = od.OrderID
	JOIN
	Customers c
	ON o.CustomerID = c.CustomerID
GROUP BY c.City, od.ProductID
HAVING count(od.ProductID)>=2
--Q7
SELECT DISTINCT c.CustomerID, c.ContactName
FROM Customers c
	JOIN
	Orders o
	ON c.CustomerID = o.CustomerID
WHERE c.City <> o.ShipCity

--Q8
SELECT top 5 od.ProductID, CAST(AVG(od.UnitPrice) AS DECIMAL(10,2)) as "AvgUnitPrice",
				(
				SELECT top 1 c.City
				FROM Customers c
				JOIN Orders o ON o.CustomerID = c.CustomerID
				JOIN [Order Details] od1 ON od1.OrderID = o.OrderID
				WHERE od1.ProductID = od.ProductID
				GROUP BY c.City
				ORDER BY SUM(od1.Quantity) DESC
				) as "City"
FROM [Order Details] od
GROUP BY od.ProductID
ORDER BY Sum(od.Quantity) desc
--Q9
-- sub-query
SELECT DISTINCT e.City
FROM Employees e
WHERE not e.City in (
					SELECT o.ShipCity
					FROM Orders o
					WHERE o.ShipCity is not NULL
					)

--not sub-query
SELECT DISTINCT e.City 
FROM Employees e
LEFT JOIN Customers c ON e.City = c.City
WHERE c.City IS NULL

--Q10
SELECT isNULL(
(SELECT dt1.City FROM
	(SELECT TOP 1 e.City
	FROM Employees e
		INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID
	GROUP BY e.EmployeeID,e.City
	ORDER BY SUM(o.OrderID) DESC) dt1
INNER JOIN
	(SELECT TOP 1 e.City
	FROM Orders o
		INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
		INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
	GROUP BY e.EmployeeID,e.City
	ORDER BY SUM(od.Quantity) DESC) dt2
ON dt1.City = dt2.City) 
,'No result')

--Q11. How do you remove the duplicates record of a table?

--ANS:
-- Use count(*)>1 to detect dupplicate record and delete it

--Q12. Sample table to be used for solutions below
-- Employee ( empid integer, mgrid integer, deptid integer, salary integer) 
-- Dept (deptid integer, deptname text)
-- Find employees who do not manage anybody.

--ANS:
-- SELECT empid FROM Employee WHERE not empid in (SELECT mgrid FROM Employee)

--Q13 Find departments that have maximum number of employees. 
--(solution should consider scenario having more than 1 departments that 
--have maximum number of employees). 
--Result should only have - deptname, count of employees sorted by deptname.

--ANS:
--SELECT deptname 
--FROM Employee 
--GROUP BY deptname
--HAVING COUNT(empid) = (SELECT TOP 1 COUNT(*) 
--							FROM Employee 
--							GROUP BY deptid 
--							ORDER BY COUNT(*) DESC)

--Q14 Find top 3 employees (salary based) in every department. 
--Result should have deptname, empid, salary sorted by deptname 
--and then employee with high to low salary.

--ANS:
--SELECT TOP 3 d.deptname, e.empid, e.salary 
--FROM employee e 
--JOIN dep d on e.deptid = d.deptid 
--ORDER BY salary,deptname,empid DESC