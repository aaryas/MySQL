select MAX(Salary) from Employee WHERE Salary NOT IN (select MAX(Salary) from Employee ); 


