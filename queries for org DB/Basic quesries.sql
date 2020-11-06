-- CREATE DATABASE ORG;
-- SHOW DATABASES;
-- USE ORG;
/*
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');


CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

*/

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
	select FIRST_NAME as Worker_Name from org.worker;
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
	select upper(FIRST_NAME) from org.worker;
-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
	select * from org.worker;
    Select distinct DEPARTMENT from Worker;
    select DEPARTMENT from org.worker group by DEPARTMENT;
-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
	select substring(first_name,1,3) from org.worker;
-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
    select INSTR(FIRST_NAME,BINARY 'a') as 'Position of a' from org.worker where FIRST_NAME ='Amitabh'; -- Binary make str case sensitive
    select INSTR(FIRST_NAME,'a') as 'Position of a' from org.worker where FIRST_NAME ='Amitabh';
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
	select rtrim(first_name) from org.worker;
    select first_name from org.worker;
-- Q-7. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
	Select distinct length(DEPARTMENT) from Worker;
    Select DEPARTMENT from org.worker group by DEPARTMENT;
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
	select replace(first_name,'a','A') from org.worker;
-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
	select concat(first_name,' ', last_name) as FullName from org.worker;
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
	select first_name from Worker order by first_name asc;
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending 
-- and DEPARTMENT Descending.
	select * from worker order by first_name asc, DEPARTMENT desc;
-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
	select * from Worker where first_name in ('Satish','Vipul');
-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
	select * from Worker where first_name not in ('Satish','Vipul');
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
	Select * from Worker where DEPARTMENT like 'Admin%';
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
	select * from worker where first_name like '%a%';
-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
	select * from worker where first_name like '_____h';
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
	select * from worker where salary between 10000 and 500000;
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.    
    select * from worker where year(joining_date)=2014 and month(joining_date)=2;
-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
	select DEPARTMENT, count(*) 'number of emp in Admin' from worker where DEPARTMENT='admin'group by DEPARTMENT;
-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
	select DEPARTMENT, count(*) as min_to_max from worker  group by DEPARTMENT order by min_to_max;
-- Write an SQL query to print details of the Workers who are also Managers.
	select * from worker where WORKER_ID in (select WORKER_REF_ID from title where WORKER_TITLE='Manager');
-- Write an SQL query to fetch duplicate records having matching data in some fields of a table.
	select WORKER_TITLE, AFFECTED_FROM, count(*) from title group by WORKER_TITLE, AFFECTED_FROM having count(*)>1;
-- Write an SQL query to show only odd rows from a table.
	SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;
-- Write an SQL query to show only even rows from a table.
    SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;
-- Write an SQL query to clone a new table from another table.
	CREATE TABLE WorkerClone
    (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
	);
    
    
    insert workerclone select * from worker; -- 1st way
    create  table workercloneagain like worker; -- 2nd way
    select  * from workercloneagain;
    
--  Write an SQL query to show the current date and time.
	select curdate();
    select curtime();
    select now(); -- show date and time together
    
    
-- Write an SQL query to show the top n (say 5) records of a table.
    select * from worker limit 5;
    select * from worker order by salary desc limit 5; -- top 5 salary;
    
-- Write an SQL query to determine the nth (say n=5) highest salary from a table.
	SELECT * FROM worker w1 where 4= (select count(distinct salary) from worker w2 where w2.salary>w1.salary);
    -- SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT n-1,1; ***** if there are all values are distinct
    
-- Write an SQL query to fetch the list of employees with the same salary.
	select * from worker where salary in (select salary from worker group by salary having count(salary)>1);
    
-- Write an SQL query to show the second highest salary from a table.
	select * from worker w1 where 1= (select count(distinct salary) from worker w2 where w2.salary>w1.salary);
    select * from worker where salary in (select max(salary) from worker where salary not in (select max(salary) from worker));
    
-- Write an SQL query to show one row twice in results from a table.
	select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
	union all 
	select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';
    
-- Write an SQL query to fetch the first 50% records from a table.
	select * from worker where worker_id <= (select count(worker_id)/2 from worker);
    
-- Write an SQL query to fetch the departments that have less than four people in it.
    select department, count(*) from worker group by department having count(department)<4;

-- Write an SQL query to show all departments along with the number of people in there.
	select department , count(*) from worker group by department;

-- Write an SQL query to show the last record from a table.
	select * from worker where worker_id in (select max(worker_id) from worker);
    
-- Write an SQL query to fetch the last five records from a table.
	select * from worker order by worker_id desc limit 0,5; -- 1st way
    
-- Write an SQL query to print the name of employees having the highest salary in each department.
	select * from worker;
    select department,count(department), max(salary) from worker
    where salary in (select distinct(salary) from worker)
    group by department;
    
-- Write an SQL query to fetch three max salaries from a table.
	select * from worker order by salary desc limit 0,3;
    
-- Write an SQL query to fetch departments along with the total salaries paid for each of them.
	select department , sum(salary) from worker group by department;
    
    
    