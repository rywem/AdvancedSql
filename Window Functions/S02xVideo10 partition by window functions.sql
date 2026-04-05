-- Partition by
select 
	 [ProductID]
	 , [OrderQty]
	 , [LineTotal] = Sum(LineTotal) --over()
from Sales.SalesOrderDetail  
group by 
	ProductId
	OrderQty
Order by 1, 2