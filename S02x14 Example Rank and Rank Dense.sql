use AdventureWorks2019;
SELECT 
	SalesOrderId
	, SalesOrderDetailId
	, LineTotal 
	, Ranking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
	, [Ranking with Rank] = RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
	, [Ranking Dense] = DENSE_RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
FROM Sales.SalesOrderDetail
--ORDER BY [Ranking with Rank]

/* When to use Rank vs Dense Rank:
	- If you are trying to group exactly one record from each partition group - either first or last - use ROW_NUMBER. Eg you want to be certain you have a first or last number
		- This probably the most common scenario	
*/