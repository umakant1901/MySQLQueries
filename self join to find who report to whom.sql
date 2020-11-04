/*
 # self join to who report to whom-----------
 # select * from classicmodels.employees;
*/

SELECT 
    e2.employeeNumber,
    CONCAT(e2.firstName, ' ', e2.lastName) AS fullname,
    CONCAT(e1.firstName, ' ', e1.lastName) AS reportedto
FROM
    classicmodels.employees e1
        INNER JOIN
    classicmodels.employees e2
WHERE
    e1.employeeNumber = e2.reportsTo;
