/*
 #find the nth highest amount
 #select * from classicmodels.payments;
 #select * from classicmodels.payments order by amount desc;
 #-- 5th highest amount : 101244.59
 #SELECT * FROM tbl_name t1 WHERE N-1 = (SELECT COUNT(DISTINCT col_name) FROM tbl_name t2 WHERE t2.col_name > t1.col_name);
*/
SELECT 
    *
FROM
    classicmodels.payments p1
WHERE
    4 = (SELECT 
            COUNT(DISTINCT amount)
        FROM
            classicmodels.payments p2
        WHERE
            p2.amount > p1.amount);

 