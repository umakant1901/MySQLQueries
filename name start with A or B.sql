-- show all emp whose name start with 'A' or 'B'

SELECT 
    firstName
FROM
    classicmodels.employees
WHERE
    firstName LIKE 'A%' 
UNION SELECT 
    firstName
FROM
    classicmodels.employees
WHERE
    firstName LIKE 'B%'

