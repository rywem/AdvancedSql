--select top(100) * from Person.Person
--select top(100) * from HumanResources.Employee
--select top(100) * from HumanResources.EmployeePayHistory


/*

Exercise 1
	Create a query with the following columns:
	FirstName and LastName, from the Person.Person table**
	JobTitle, from the HumanResources.Employee table**
	Rate, from the HumanResources.EmployeePayHistory table**
	A derived column called "AverageRate" that returns the average of all values in the "Rate" column, in each row
	**All the above tables can be joined on BusinessEntityID
	All the tables can be inner joined, and you do not need to apply any criteria.

Exercise 2
	Enhance your query from Exercise 1 by adding a derived column called
	"MaximumRate" that returns the largest of all values in the "Rate" column, in each row.

Exercise 3
	Enhance your query from Exercise 2 by adding a derived column called
	"DiffFromAvgRate" that returns the result of the following calculation:
	An employees's pay rate, MINUS the average of all values in the "Rate" column.

Exercise 4
	Enhance your query from Exercise 3 by adding a derived column called
	"PercentofMaxRate" that returns the result of the following calculation:
	An employees's pay rate, DIVIDED BY the maximum of all values in the "Rate" column, times 100.
*/


select 
	  FirstName
	, LastName
	, JobTitle
	, Rate
	, [Average Rate] = AVG(Rate) over() -- exercise 1: average pay rate for all employees in the db
	, [Max Rate] = Max(Rate) over() --exercise 2: max pay rate of all employees in the db	
	, [Difference from Average] = Rate - AVG(Rate) over() -- exercise 3: the difference between each employees rate and the average rate
	, [Perfect of Max Rate] = Rate / MAX(Rate) over()  * 100 -- exercise 4: the percent of an employee's rate against the max rate
from Person.Person 
inner join HumanResources.Employee 
	on Person.BusinessEntityID = Employee.BusinessEntityID
inner join HumanResources.EmployeePayHistory 
	on Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID
order by [Perfect of Max Rate]  desc

