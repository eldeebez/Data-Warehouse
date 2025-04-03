SELECT * FROM (
    SELECT 
    YEAR(OrderDate) AS SalesYeat,
    MONTH(OrderDate) AS SalesMonth,
    SubTotal
    FROM Sales.SalesOrderHeader
)SourceTable
Pivot(
    AVG(SubTotal) FOR SalesMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
)PIVOTTABLE