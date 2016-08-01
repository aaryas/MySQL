select MAX(Salary) from Employee WHERE Salary NOT IN (select MAX(Salary) from Employee ); 


-- this file needs to be removed from here
