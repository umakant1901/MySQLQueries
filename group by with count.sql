-- show all Job Title type along with number of employee in employees table
SELECT 
    jobTitle, COUNT(*)
FROM
    classicmodels.employees
GROUP BY jobTitle
