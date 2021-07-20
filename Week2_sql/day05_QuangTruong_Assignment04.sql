---------------------------------------------- Q & A ------------------------------------------------
--Q1.	What is View? What are the benefits of using views?
-- View is a virtual table that is a result set of a sql statement
--Benefits of using Views, a view can draw data from several tables and present a single table

--Q2.	Can data be modified through views?
--No we cannot modify data through view correctly

--Q3.	What is stored procedure and what are the benefits of using it?
-- A store procedure is a block of sql statement that has been store and can be executed by a single call
-- Store procedure minimize the use of slow network, reduce network traffic and improve round-trip response time

--Q4.	What is the difference between view and stored procedure?
-- A view is a virtual table that show data from multiple table,
-- while Store procedure is a group of statements that can be executed

--Q5.	What is the difference between stored procedure and functions?
-- A function must have a return value while store procedure is an optional

--Q6.	Can stored procedure return multiple result sets?
-- Yes, stored procedure can return multiple result sets

--Q7.	Can stored procedure be executed as part of SELECT Statement? Why?
-- no, because a store procedure return multiple result sets, each with it own schema

--Q8.	What is Trigger? What types of Triggers are there?
-- Trigger is a special type of store procedures 
-- that is automatically executed when an event occurs (like, insert, update, delete)
-- There are 2 type of triggers: DML and DDL triger

--Q9.	What are the scenarios to use Triggers?
--  Trigger can be set before or after the trigger event. 
-- A trigger event is when a change been made to table/data such as update, insert, delete.

--Q10.	What is the difference between Trigger and Stored Procedure?
-- Store procedure will be invoked by the user
-- While Trigger run automatically when various events happen

---------------------------------------------- Q & A ------------------------------------------------
--Q1
--a
BEGIN TRANSACTION

SELECT * FROM Region with (TABLOCK)
SELECT * FROM Territories with (TABLOCK)
SELECT * FROM EmployeeTerritories with (TABLOCK)
SELECT * FROM Employees with (TABLOCK)

INSERT INTO Region VALUES(5,'Middle Earth')
IF @@ERROR <> 0
BEGIN
	PRINT @@ERROR
	ROLLBACK TRANSACTION
END
ELSE BEGIN
	--b
	INSERT INTO Territories VALUES (99999,'Gondor',5)
	if @@ERROR <> 0
	BEGIN
		PRINT @@ERROR
		ROLLBACK TRANSACTION
	END
	ELSE BEGIN
		--c
		INSERT INTO Employees VALUES ('Aragorn','King', '','Mr.','1945-01-01 00:00:00.000',
										'1994-11-15 00:00:00.000', 'Meadown Rd.',
										'Houston',	NULL	,'WG2 7LT',	'US',
										'(71) 888-6666'	,452,NULL,
										'Anne has a BA degree in English from 
										University of Houston.  He is fluent 
										in English and Spanish.',	5,
										'http://accweb/emmployees/davolio.bmp/')

		INSERT INTO EmployeeTerritories VALUES (@@IDENTITY, 99999)
		if @@ERROR <> 0
		BEGIN
			PRINT @@ERROR
			ROLLBACK TRANSACTION
		END
		ELSE BEGIN
			--Q2
			UPDATE Territories SET TerritoryDescription = 'Arnor'
								WHERE TerritoryDescription = 'Gondor'
			IF @@ERROR <> 0
			BEGIN
				PRINT @@ERROR
				ROLLBACK
			END
			ELSE BEGIN
				--Q3
				DELETE FROM EmployeeTerritories
				WHERE TerritoryID = (SELECT TerritoryID 
									FROM Territories 
									WHERE TerritoryDescription = 'Arnor')
				DELETE FROM Territories
				WHERE TerritoryDescription = 'Arnor'

				DELETE FROM Region
				WHERE RegionDescription = 'Middle Earth'
				IF @@ERROR <> 0
				BEGIN
					print @@ERROR
					ROLLBACK
				END
				ELSE BEGIN
					COMMIT
				END
			END
		END
	END
END
SELECT * FROM Region with (NOLOCK)
SELECT * FROM Territories with (NOLOCK)
SELECT * FROM EmployeeTerritories with (NOLOCK)
SELECT * FROM Employees with (NOLOCK)
--Q4
CREATE VIEW view_product_order_truong
AS
SELECT p.ProductName, SUM(od.Quantity) AS "ProductQty"
FROM Products p
INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
GROUP BY p.ProductName

--SELECT * FROM view_product_order_truong

--Q5
CREATE PROC sp_product_order_quantity_truong
@product_id int,
@totalQty int out
AS
BEGIN
	SELECT @totalQty = SUM(od.Quantity)
	FROM Products p
	INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
	WHERE p.ProductID = @product_id
	GROUP BY p.ProductName
END

DECLARE @total int
EXEC sp_product_order_quantity_truong 1, @total out
PRINT @total

--Q6
CREATE PROC sp_product_order_city_truong
@pname varchar(40)
AS
BEGIN
	SELECT TOP 5 o.ShipCity, SUM(od.Quantity) as "TotalQty"
	FROM Products p
	INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
	INNER JOIN Orders o ON o.OrderID = od.OrderID
	WHERE p.ProductName = @pname
	GROUP BY o.ShipCity
	ORDER BY TotalQty DESC
END

EXEC sp_product_order_city_truong 'Chang'

--Q7
BEGIN TRAN
	SELECT * FROM Region with (TABLOCK)
	SELECT * FROM Territories with (TABLOCK)
	SELECT * FROM EmployeeTerritories with (TABLOCK)
	SELECT * FROM Employees with (TABLOCK)
	GO
	ALTER PROC sp_move_employees_truong
	AS
	BEGIN
		if EXISTS(SELECT et.EmployeeID
				FROM EmployeeTerritories et 
				WHERE et.TerritoryID = (SELECT t.TerritoryID 
										FROM Territories t 
										WHERE t.TerritoryDescription in ('Troy')
										)
				)
		BEGIN
			DECLARE @maxTerritorryID int
			SELECT @maxTerritorryID = MAX(TerritoryID)  FROM Territories
			
			INSERT INTO Territories VALUES (@maxTerritorryID+1,'Stevens Point',
				(SELECT RegionID FROM Region WHERE RegionDescription in ('Northern')))
			UPDATE EmployeeTerritories
			SET TerritoryID = @maxTerritorryID+1
			WHERE EmployeeID in (SELECT et.EmployeeID
								FROM EmployeeTerritories et 
								WHERE et.TerritoryID = (SELECT t.TerritoryID 
														FROM Territories t 
														WHERE t.TerritoryDescription in ('Troy')
														)
								)
					AND TerritoryID = (SELECT t.TerritoryID 
										FROM Territories t 
										WHERE t.TerritoryDescription in ('Troy')
										)
		
			if @@ERROR <> 0
			BEGIN
				PRINT @@ERROR
				ROLLBACK
			END
			ELSE 
				COMMIT
		END	
	END

EXEC sp_move_employees_truong

SELECT * FROM Region with (NOLOCK)
SELECT * FROM Territories with (NOLOCK)
SELECT * FROM EmployeeTerritories with (NOLOCK)
SELECT * FROM Employees with (NOLOCK)
--Q8
CREATE TRIGGER trig_move_emp
ON EmployeeTerritories
AFTER INSERT
AS
DECLARE @EmpCount int
SELECT @EmpCount = Count(*) FROM EmployeeTerritories 
WHERE TerritoryID = (SELECT t.TerritoryID 
					FROM Territories t 
					WHERE t.TerritoryDescription in ('Stevens Point')
						AND t.RegionID = 3)	
GROUP BY EmployeeID

IF @EmpCount > 100
BEGIN
	UPDATE EmployeeTerritories
	SET TerritoryID = (SELECT t.TerritoryID 
					FROM Territories t 
					WHERE t.TerritoryDescription in ('Stevens Point')
						AND t.RegionID = 3)
	WHERE EmployeeID in (SELECT EmployeeID
						FROM EmployeeTerritories
						WHERE TerritoryID = (SELECT t.TerritoryID 
									FROM Territories t 
									WHERE t.TerritoryDescription in ('Stevens Point')
										AND t.RegionID = 3)
						)
END

DROP TRIGGER trig_move_emp

COMMIT
GO
--Q9
CREATE TABLE people_truong(
	id int,
	fullname varchar(30),
	cityID int
)

CREATE TABLE city_truong(
	id int,
	cityName varchar(30)
)

BEGIN TRAN
	INSERT INTO city_truong VALUES(1,'Seattle')
	INSERT INTO city_truong VALUES(2,'Green Bay')

	INSERT INTO people_truong VALUES(1,'Aaron Rogers',2)
	INSERT INTO people_truong VALUES(2,'Russell Wilson',1)
	INSERT INTO people_truong VALUES(3,'Jody Nelson',2)

	if exists(SELECT p.id
				FROM people_truong p
				WHERE p.cityID = (SELECT c.id
								FROM city_truong c
								WHERE c.cityName = 'Seattle'))
	BEGIN
		INSERT INTO city_truong VALUES(3,'Madison')
		UPDATE people_truong 
		SET cityID = 3
		WHERE id = (SELECT p.id
					FROM people_truong p
					WHERE p.cityID = (SELECT c.id
									FROM city_truong c
									WHERE c.cityName = 'Seattle'))
	END		
	DELETE FROM city_truong WHERE cityName = 'Seattle'
	IF @@ERROR <> 0
		ROLLBACK
	ELSE
COMMIT
GO
	CREATE VIEW Packers_truong
	AS
	SELECT fullname
	FROM people_truong 
	WHERE cityID = 2
GO
SELECT * FROM people_truong
SELECT * FROM Packers_truong

DROP VIEW Packers_truong
DROP TABLE people_truong
DROP TABLE city_truong

--Q10
GO
CREATE PROC sp_birthday_employees_truong
AS
BEGIN
	SELECT * INTO #birthday_employees_truong
	FROM Employees Where DATEPART(MM,BirthDate) = 02	
	SELECT * FROM #birthday_employees_truong
END

EXEC sp_birthday_employees_truong
GO
--Q11
--sub-query
CREATE PROC sp_truong_1
AS
BEGIN
	SELECT City FROM Customers
	WHERE CustomerID in (SELECT c.CustomerID FROM Customers c
						WHERE not c.CustomerID in ((SELECT o.CustomerID 
													FROM Orders o))
						OR c.CustomerID in(SELECT o.CustomerID FROM Orders o
												GROUP BY o.CustomerID
												HAVING COUNT(o.OrderID) = 1))
	GROUP BY City
	HAVING COUNT(CustomerID)>1
END

EXEC sp_truong_1

GO
--no sub-query
CREATE PROC sp_truong_2
AS
BEGIN
	WITH cte_CustOrderLessThan2
	AS
	(
		SELECT c.City,c.CustomerID
		FROM Customers c
		LEFT JOIN Orders o ON o.CustomerID = c.CustomerID
		GROUP BY c.City,c.CustomerID
		HAVING COUNT(o.OrderID) < 2
	)SELECT cte.City 
	FROM cte_CustOrderLessThan2 cte
	GROUP BY cte.City
	HAVING COUNT(cte.CustomerID) > 1
END

EXEC sp_truong_1

GO

--Q12 How do you make sure two tables have the same data?
-- EXCEPT, if the result is empty, they have the same data
SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers

--Q14
CREATE TABLE #q14 (fname varchar(20),lname varchar(20),mname varchar(10))

INSERT INTO #q14 VALUES ('John','Green',NULL)
INSERT INTO #q14 VALUES ('Mike','White','M')

SELECT a.fname+' '+lname+' '+
		IIF(a.mname is null,'',a.mname+'.') as "Full Name"
FROM #q14 a

--Q15
CREATE TABLE #q15 (Student varchar(10),Marks int,Sex varchar(5))

INSERT INTO #q15 VALUES('Ci','70','F')
INSERT INTO #q15 VALUES('Bob','80','M')
INSERT INTO #q15 VALUES('Li','90','F')
INSERT INTO #q15 VALUES('Mi','95','M')

SELECT TOP 1 *
FROM #q15
WHERE Sex = 'F'
ORDER BY Marks DESC

--Q16
SELECT *
FROM #q15
ORDER BY Sex, Marks DESC
