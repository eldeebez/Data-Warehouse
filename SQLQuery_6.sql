SELECT
pc.Name AS ProductCategory,
COALESCE(p.Color, 'no color') As ProductColor,
Sum(sod.LineTotal) AS TotalSalesAmount,
GROUPING(p.Color) AS IsTotalColor

FROM Production.Product p 
JOIN Production.ProductSubcategory ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Sales.SalesOrderDetail sod on p.ProductID = sod.ProductID
JOIN Production.ProductCategory pc on ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY CUBE(pc.Name, p.Color)