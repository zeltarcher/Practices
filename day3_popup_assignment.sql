USE NORTHWND
GO

--top 3 products from everycity with maximum sale
SELECT * FROM 
(select p.ProductID,p.ProductName, dt.ShipCity, dt.totalSoldQty, 
	dense_rank() over(partition by dt.ShipCity order by dt.totalSoldQty desc) rnk 
	from Products p
	inner join
	(Select od.ProductID,o.OrderID, o.ShipCity, sum(od.Quantity) "totalSoldQty" 
		from Orders o
		inner join 
		[Order Details] od
		on o.OrderID = od.OrderID
		group by od.ProductID,o.OrderID, o.ShipCity
	)dt
	on p.ProductID = dt.ProductID
)dt2
where dt2.rnk <=3


--Recursive CTE
--Calculate distance
--Initiate values
--create database travel
--use travel
--go
create table #trips(destination char(1), distance int)

insert into #trips values ('A',0)
insert into #trips values ('B',20)
insert into #trips values ('C',50)
insert into #trips values ('D',70)
insert into #trips values ('E',85)

--SELECT * FROM #trips

with chainCTE
as
(
	SELECT destination, distance 
	FROM #trips 
	ORDER BY distance 
	OFFSET 1 ROWS 
	FETCH NEXT 4 ROWS ONLY
)
, CalcDistanceCTE as
(
	SELECT CAST('' as varchar(1)) as "preDes",t.destination curDes,CAST(null as int) as "preDis",  t.distance curDis,  0 stop_point
	FROM #trips t 
	WHERE t.distance = 0
	UNION ALL
	SELECT CAST(cte.curDes as varchar(1)) "preDes",t1.destination curDes,CAST(cte.curDis as int) "preDis", t1.distance curDis,  cte.stop_point+1
	FROM chainCTE t1, CalcDistanceCTE cte 
	WHERE cte.stop_point<2 
		and not cte.curDes in (cte.preDes) 
		and not t1.destination in (cte.curDes)
)
, resultList as
(
	SELECT cd.curDes+'-'+cd.preDes as "destination",ABS(cd.curDis - cd.preDis) as "distance"
	FROM CalcDistanceCTE cd
)
select DISTINCT destination,distance from resultList 
WHERE destination in ('B-A','C-B','D-C','E-D')