-- select * from classicmodels.orders;
-- extract year , month and day from orderdate from orders table

SELECT 
    YEAR(orderDate) AS years,
    MONTHNAME(orderDate) AS monthName,
    DAY(orderDate) AS DateOfOrder
FROM
    classicmodels.orders;
