SELECT 
    pc.Name AS ProductCategory, 
    SUM(CASE WHEN YEAR(soh.OrderDate) = 2011 THEN sod.OrderQty ELSE 0 END) AS [2011],
    SUM(CASE WHEN YEAR(soh.OrderDate) = 2012 THEN sod.OrderQty ELSE 0 END) AS [2012],
    SUM(CASE WHEN YEAR(soh.OrderDate) = 2013 THEN sod.OrderQty ELSE 0 END) AS [2013],
    SUM(CASE WHEN YEAR(soh.OrderDate) = 2014 THEN sod.OrderQty ELSE 0 END) AS [2014],

    SUM(CASE 
        WHEN p.ListPrice < 20 THEN sod.OrderQty 
        ELSE 0 
    END) AS Inexpensive,
    SUM(CASE 
        WHEN p.ListPrice BETWEEN 20 AND 75 THEN sod.OrderQty 
        ELSE 0 
    END) AS Regular,
    SUM(CASE 
        WHEN p.ListPrice BETWEEN 75 AND 750 THEN sod.OrderQty 
        ELSE 0 
    END) AS High,
    SUM(CASE 
        WHEN p.ListPrice > 750 THEN sod.OrderQty 
        ELSE 0 
    END) AS Expensive
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;
