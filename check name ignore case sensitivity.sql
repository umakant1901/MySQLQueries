/* 
 # fetch employee name not considered name case sensitive
 # select * from classicmodels.employees;
*/
select * from classicmodels.employees where upper(firstName) like 'DIANE'