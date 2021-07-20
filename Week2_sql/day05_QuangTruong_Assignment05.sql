-------------------------------------------------- Q & A --------------------------------------------------
--1.	What is an object in SQL?
-- An object in sql is table, schema, database, ...

--2.	What is Index? What are the advantages and disadvantages of using Indexes?
-- Indexes are database objects based on column for fastest retrieval
-- adv: fast retrival
-- dis: take addition disk space

--3.	What are the types of Indexes?
-- clustered, non-clustered

--4.	Does SQL Server automatically create indexes when a table is created? If yes, under which constraints?
--yes, under primary key and unique key

--5.	Can a table have multiple clustered index? Why?
-- Because clustered index store in ascending order, so it cannot have multiple

--6.	Can an index be created on multiple columns? Is yes, is the order of columns matter?
-- yes, it can be multiple column, and the first will be faster the last as order. So order of column is matter

--7.	Can indexes be created on views?
-- yes

--8.	What is normalization? What are the steps (normal forms) to achieve normalization?
-- is a process of prganizing data to minimize data redundancy
-- 1NF: data in each column should be atomic, identity each record by a primary key
-- 2NF: meet 1NF's conditions, separate into small tables to eliminate redundant data
-- 3NF: meet 1NF and 2ND 's conditions, does not have columns that are not fully dependent on primary key

--9.	What is denormalization and under which scenarios can it be preferable?
-- Is a strategy to increase performance of database. The idea behind it is to add the most helpful redundant 
-- data. We can use extra attributes in an existing table, add new tables, or even create instances 
-- of existing tables. The usual use is to decrease the running time of select queries.

--10.	How do you achieve Data Integrity in SQL Server?
-- use transaction

--11.	What are the different kinds of constraint do SQL Server have?
-- PK, FK, unique key, check, ...

--12.	What is the difference between Primary Key and Unique Key?
-- PK cannot be NULL while Unique key can.

--13.	What is foreign key?
-- FK is a column or combined columns that is used to establish and enforce a link/relationship between two tables

--14.	Can a table have multiple foreign keys?
-- yes

--15.	Does a foreign key have to be unique? Can it be null?
-- FK may or may not unique and can be NULL

--16.	Can we create indexes on Table Variables or Temporary Tables?
-- No

--17.	What is Transaction? What types of transaction levels are there in SQL Server?
-- Transaction keep data in consisitant state
-- levels: read commited, read uncommited, repeatable read, serializable, snapshot


-------------------------------------------------- Queries --------------------------------------------------
--Q1
-- Create table customer(cust_id int,  iname varchar (50)) 
--create table order(order_id int,cust_id int,amount money,order_date smalldatetime)

--SELECT c.cust_id, SUM(o.order_id) as "TotalOrder"
--FROM customer c
--INNER JOIN order o ON o.cust_id = c.cust_id
--WHERE DATEPART(yyyy,o.order_date) =  '2002'
--GROUP BY c.cust_id

--Test on NORTHWND
--USE NORTHWND
--GO
--SELECT c.CustomerID, SUM(o.OrderID) as "TotalOrder"
--FROM Customers c
--INNER JOIN Orders o ON o.CustomerID = c.CustomerID
--WHERE DATEPART(yyyy,o.OrderDate) =  '1996'
--GROUP BY c.CustomerID

--Q2 Create table person (id int, firstname varchar(100), lastname varchar(100)) 
--write a query that returns all employees whose last names  start with “A”.

--SELECT *
--FROM person
--WHERE lastname like 'A%'

--Q3
--Create table person(person_id int primary key, manager_id int null, name varchar(100)not null) 
--The filed managed_id contains the person_id of the employee’s manager.
--Please write a query that would return the names 
--of all top managers(an employee who does not have  a manger,
--and the number of people that report directly to this manager.

--SELECT name as "MngName", count(p1.person_id) as "NoPeopleReportTo"
--FROM person p1 
--INNER JOIN person p2 ON p1.person_id = p2.manager_id
--GROUP BY name

--Test on NORTHWND
--USE NORTHWND
--GO
--SELECT e2.FirstName+' '+e2.LastName AS "Manager", count(e1.EmployeeID) AS "NoEmpReportTo"
--FROM Employees e1
--	INNER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
--GROUP BY e2.FirstName+' '+e2.LastName

--Q4 List all events that can cause a trigger to be executed.
-- INSERT, UPDATE, DELETE 

--5. Generate a destination schema in 3rd Normal Form.  
--Include all necessary fact, join, and dictionary tables, 
--and all Primary and Foreign Key relationships.  
--The following assumptions can be made:
--a. Each Company can have one or more Divisions.
--b. Each record in the Company table represents a unique combination 
--c. Physical locations are associated with Divisions.
--d. Some Company Divisions are collocated at the same physical of Company Name and Division Name.
--e. Contacts can be associated with one or more divisions 
--and the address, but are differentiated by suite/mail 
--drop records.status of each association should be separately maintained and audited.

-- CREATE TABLE companies (companyID int NOT NULL PRIMARY KEY
--							, comName nvarchar(100))

-- CREATE TABLE persons(personID int NOT NULL PRIMARY KEY
--						, fullname nvarchar(100), address nvarchar(max))

-- CREATE TABLE locations (locID int NOT NULL PRIMARY KEY
--						, city nvarchar(100), country nvarchar(100))

-- CREATE TABLE divisions (divisionID int NOT NULL PRIMARY KEY
--							, description nvarchar(100)
--							, contactID int FORGEIN KEY REFERENCES persons(personID)
--							,locID int FORGEIN KEY REFERENCES locations(locID))

-- CREATE TABLE divisionDetails (divisionID int FORGEIN KEY REFERENCES divisions(divisionID)
--								, companyID int FORGEIN KEY REFERENCES companies(companyID))


