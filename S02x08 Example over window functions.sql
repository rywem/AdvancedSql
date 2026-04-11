--select 
--	*
--from sales.salesorderheader


select 
	sum(totaldue) 
from sales.SalesOrderHeader



--select 
--	sum(totaldue), 
--	Salespersonid 
--from sales.SalesOrderHeader
--group by SalesPersonID

-- found the percent of everyone's performance against the best performer comp
SELECT BusinessEntityID
	,TerritoryID
	, SalesQuota
	, Bonus
	, CommissionPct
	, SalesYTD
	, SalesLastYear
	, [Total YTD Sales]= sum(salesytd) over()
	, [Max YTD Sales]= max(salesytd) over()
	, [% of Best Performer] = salesytd/max(salesytd) over()
from sales.SalesPerson




SELECT 
	sum(SalesYTD)
	
from sales.SalesPerson
