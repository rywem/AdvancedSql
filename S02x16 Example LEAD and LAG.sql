use AdventureWorks2019;

-- Lead and Lag let's us grab values from subsequent or previous records relative to the position of the current record in our data
-- Useful to compare a value in a given column to the next or previous value in the same column.


SELECT 
	SalesOrderId
	, OrderDate
	, CustomerId
	, TotalDue
	, [NextTotalDue] = LEAD(TotalDue, 1) OVER(ORDER BY SalesOrderId )
	, [PreviousTotalDue] = LAG(TotalDue, 1) OVER(ORDER BY SalesOrderId )
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderId