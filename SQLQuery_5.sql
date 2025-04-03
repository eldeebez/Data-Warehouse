SELECT

pc.Name AS ProductCategory,

sum(case when YEAR(soh.OrderDate) = 2011 then sod.OrderQty else 0 end ) AS [2011],
sum(case when YEAR(soh.OrderDate) = 2012 then sod.OrderQty else 0 end ) AS [2012],
sum(case when YEAR(soh.OrderDate) = 2013 then sod.OrderQty else 0 end ) AS [2013],
sum(case when YEAR(soh.OrderDate) = 2014 then sod.OrderQty else 0 end ) AS [2014],

sum(CASE WHEN pp.ListPrice < 20 then sod.OrderQty else 0 end) as [Inexpensive],
sum(CASE WHEN pp.ListPrice > 20 AND pp.ListPrice < 75 then sod.OrderQty else 0 end) as [Regular],
sum(CASE WHEN pp.ListPrice > 75 AND pp.ListPrice < 750 then sod.OrderQty else 0 end) as [High],
sum(CASE WHEN pp.ListPrice > 750 THEN sod.OrderQty else 0 end) as [Expensive]

FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh on sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product pp on sod.ProductID  = pp.ProductID
JOIN Production.ProductSubcategory psc on pp.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc on psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
