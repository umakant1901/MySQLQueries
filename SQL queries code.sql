# show databases

# use classicmodels
# 1. view the data from employee table
 # select * from classicmodels.employees;
 # select * from classicmodels.payments;
 # select * from classicmodels.orderdetails;
 # select * from classicmodels.offices;
 # select * from classicmodels.orders;

# 2. show all Job Title type along with number of employee in employees table
# select jobTitle, count(*) from classicmodels.employees group by jobTitle

# 3. show all emp whose name start with 'A'
# select firstName from classicmodels.employees where firstName like 'A%' ;

# 4. show all emp whose name start with 'A' or 'B'
/*
select firstName from classicmodels.employees where firstName like 'A%'
union
select firstName from classicmodels.employees where firstName like 'B%'
*/

-- select max(amount) from classicmodels.payments; // maximin amount from table
/* ---> Second highest amount in payment table 
select max(amount) from classicmodels.payments where amount not in
(select max(amount) from classicmodels.payments);
---- */

# select * from classicmodels.orders;
-- extract year , month and day from orderdate from orders table
# select year(orderDate) as years, monthname(orderDate) as monthName, day(orderDate) as DateOfOrder from classicmodels.orders;
-- extract order between two dates
# select * from classicmodels.orders where orderDate between '2004-01-02' and '2005-01-05'
-- fetch employee name not considered name case sensitive
 # select * from classicmodels.employees;
 # select * from classicmodels.employees where upper(firstName) like 'DIANE'
 -- self join to who report to whom-----------
 # select * from classicmodels.employees;
 # select e2.employeeNumber, concat(e2.firstName,' ',e2.lastName) as fullname, concat(e1.firstName,' ',e1.lastName) as reportedto
 # from classicmodels.employees e1 inner join classicmodels.employees e2
 # where e1.employeeNumber=e2.reportsTo;



-- --> find the nth highest amount

 # select * from classicmodels.payments;
 # select * from classicmodels.payments order by amount desc;
 # -- 5th highest amount : 101244.59
 # SELECT * FROM tbl_name t1 WHERE N-1 = (SELECT COUNT(DISTINCT col_name) FROM tbl_name t2 WHERE t2.col_name > t1.col_name);
/*
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
 */
 
 