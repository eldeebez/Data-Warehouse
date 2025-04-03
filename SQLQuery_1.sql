SELECT p.ProductID, sp.ProductSubcategoryID, sp.Name, p.Color, S.LineTotal
FROM Production.ProductSubcategory sp
JOIN Production.Product p on sp.ProductSubcategoryID = p.ProductSubcategoryID
Join Sales.SalesOrderDetail s on p.ProductID = S.ProductID


