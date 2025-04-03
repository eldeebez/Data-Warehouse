SELECT *
 FROM (
    SELECT
    sp.Name as Subcategory ,
    p.color as Color,
    s.LineTotal as TotalSales
    From Production.ProductSubcategory sp
    Join production.Product p on sp.ProductSubcategoryID = p.ProductSubcategoryID
    Join Sales.SalesOrderDetail s on p.ProductID = s.ProductID
    Join Production.ProductCategory c on sp.ProductCategoryID = c.ProductCategoryID
    Where c.Name LIKE '%Bikes%'
)SourceTable
PIVOT(
    Sum(TotalSales) for Color IN ([Red], [Blue], [Black], [White], [Silver], [Yellow])
)as PIVOTTAbLE;
