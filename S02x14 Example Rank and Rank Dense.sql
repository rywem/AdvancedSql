use AdventureWorks2019;
SELECT 
	SalesOrderId
	, SalesOrderDetailId
	, LineTotal 
	, Ranking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
	, [Ranking with Rank] = RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
	,
FROM Sales.SalesOrderDetail
--ORDER BY [Ranking with Rank]