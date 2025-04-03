CREATE VIEW Lab3OBT AS
SELECT 
p.ProductID,
p.Name AS ProductName,
pc.Name AS CategoryName,
psc.Name AS SubcategoryName,
p.ListPrice AS ProductPrice,
p.Color AS ProductColor,
CASE
 WHEN p.Weight < 5 THEN 'LIGHT'
 WHEN p.Weight BETWEEN 5 AND  20 THEN 'MEDIUM'
 ELSE 'HEAVY' 
END AS 'WeightCategory',
vsp.BusinessEntityID AS RepID,
vsp.FirstName + ' ' + vsp.LastName AS RepName,
DATEPART(YEAR,soh.OrderDate) AS OrderYear,
DATEPART(MONTH,soh.OrderDate) AS OrderMonth,
sod.LineTotal AS SalesValue,
sod.OrderQty,
sod.UnitPriceDiscount AS Discount

FROM Sales.SalesOrderDetail sod

JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN Production.ProductCategory pc ON psc.ProductCategoryID = psc.ProductCategoryID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.vSalesPerson vsp ON soh.SalesPersonID = vsp.BusinessEntityID
