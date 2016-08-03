-- Create table Starbucks_Employees

CREATE TABLE Starbucks_Employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    hourlyrate INT,
    storeid INT,
    FOREIGN KEY(storeid) REFERENCES Starbucks_Stores(store_id)
);


-- Create Starbucks_Stores table

CREATE TABLE Starbucks_Stores (
   store_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   city VARCHAR(20)
);




