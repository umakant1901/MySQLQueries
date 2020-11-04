 -- -> Second highest amount in payment table 

SELECT 
    MAX(amount)
FROM
    classicmodels.payments
WHERE
    amount NOT IN (SELECT 
            MAX(amount)
        FROM
            classicmodels.payments);

