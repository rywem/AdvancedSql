-- Partition by
use AdventureWorks2019;

-- Traditional aggregation
select 
	   [ProductID]
	 , [OrderQty]
	 , [LineTotal] = Sum(LineTotal)
from Sales.SalesOrderDetail  
group by 
	ProductId,
	OrderQty
order by 1,2

-- Using partition by to get the same result without grouping
select 
	 [ProductID]
	 , SalesOrderID
	 , SalesOrderDetailID
	 , [OrderQty]
	 , UnitPrice
	 , UnitPriceDiscount
	 , LineTotal
	 , [ProductID Line Total] = Sum(LineTotal) over(partition by [ProductID], [OrderQty])
from Sales.SalesOrderDetail
order by [ProductID], [OrderQty] desc

