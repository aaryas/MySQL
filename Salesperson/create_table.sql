-- Drop table if exists

DROP TABLE Orders;
DROP TABLE Salesperson;
DROP TABLE Customer;


-- Create table Salesperson

CREATE TABLE Salesperson (
    Salesperson_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(50) NOT NULL, 
    AGE INT, 
    SALARY INT
);

-- Create Customer table

CREATE TABLE Customer (
    Customer_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    Industry_Type VARCHAR(1)
);


-- Create Orders table

CREATE TABLE Orders (
    Order_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Order_date DATE,
    Cust_id INT,
    Salesperson_id INT,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Salesperson_id) REFERENCES Salesperson(Salesperson_ID),
    Amount INT
);
