use AdventureWorks2019;
-- Partition By Exercises Section 02 Exercise 11

/*
-- Exercise 1: 
Create a query with the following columns:
“Name” from the Production.Product table, which can be alised as “ProductName”
“ListPrice” from the Production.Product table
“Name” from the Production. ProductSubcategory table, which can be alised as “ProductSubcategory”*
“Name” from the Production.ProductCategory table, which can be alised as “ProductCategory”**

*Join Production.ProductSubcategory to Production.Product on “ProductSubcategoryID”
**Join Production.ProductCategory to ProductSubcategory on “ProductCategoryID”
All the tables can be inner joined, and you do not need to apply any criteria.

Exercise 2
	Enhance your query from Exercise 1 by adding a derived column called
	"AvgPriceByCategory " that returns the average ListPrice for the product category in each given row.

Exercise 3
	Enhance your query from Exercise 2 by adding a derived column called
	"AvgPriceByCategoryAndSubcategory" that returns the average ListPrice for the product category AND subcategory in each given row.


	Exercise 4:


Enhance your query from Exercise 3 by adding a derived column called

"ProductVsCategoryDelta" that returns the result of the following calculation:


*/

select top(100) * from Production.Product;
select top(100) * from Production.ProductSubcategory;
select top(100) * from Production.ProductCategory;


select 
	Product.[Name] as [Product Name]
	, ListPrice
	, ProductSubcategory.Name as [Product Subcategory Name]
	, ProductCategory.Name as [Product Category Name]
	, [Average Price by Category] = AVG(ListPrice) over(partition by ProductCategory.Name) -- exercise 2
	, [Average Price by Category and SubCategory] = AVG(ListPrice) over(partition by ProductCategory.Name, ProductSubcategory.Name) -- exercise 3
from Production.Product
inner join Production.ProductSubcategory 
	on Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
inner join Production.ProductCategory 
	on ProductSubcategory.ProductCategoryID = ProductCategory.ProductCategoryID