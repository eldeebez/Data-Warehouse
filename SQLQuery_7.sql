SELECT
pc.Name AS ProductCategory,
 ps.Name AS ProductSubcategory,
 p.Name AS ProductName,
sum(sod.LineTotal) AS SalesTotal

From Production.Product p 
JOIN Production.ProductSubcategory ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Sales.SalesOrderDetail sod on p.ProductID = sod.ProductID
JOIN Production.ProductCategory pc on ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY GROUPING SETS (
    (pc.Name, ps.Name, p.Name),  -- Sales per product
    (pc.Name, ps.Name),          -- Sales per subcategory
    (pc.Name),                    -- Sales per category
    ()                            -- Total sales
);