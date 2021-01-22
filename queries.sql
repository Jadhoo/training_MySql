-- question 1

CREATE DATABASE Training;
USE Training;

CREATE TABLE CustomerType (
	RecId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerType VARCHAR(20)
);
    
INSERT INTO CustomerType (CustomerType) VALUES
	('Bank'), ('Atm'), ('Registration'), ('Currency'), ('Regular');
    
SELECT * FROM CustomerType;

CREATE TABLE Customers(
	RecId INT PRIMARY KEY,
    CustomerNumber INT,
    CustomerName VARCHAR(25),
    CustomerType INT,
    City VARCHAR(20),
    FOREIGN KEY (CustomerType) REFERENCES CustomerType(RecId)
);

INSERT INTO Customers VALUES
	(1000000, 100020, 'John', 5, 'Mumbai'),
    (1000003, 100113, 'Mary', 1, 'Hyd'),
    (1000004, 100114, 'Andrew', 2, 'Mumbai'),
    (1000005, 100168, 'Parag', 5, 'Bangalore');
	
SELECT * FROM Customers;


CREATE TABLE Orders (
	RecId INT PRIMARY KEY,
	CustomerRecId INT,
    OrderNumber INT,
    Amount FLOAT(10, 2),
    FOREIGN KEY (CustomerRecId) REFERENCES Customers(RecId)
);

DROP TABLE Orders;


INSERT INTO ORDERS VALUES
	(1528070, 1000000, 5186542, 200000),
    (1576256, 1000000, 5226795, 15000.00),
    (969148, 1000003, 839745, 104381.49),
    (857731, 1000004, 4657221, 800000.00),
    (878079, 1000004, 4677654, 750000.00),
    (760520, 1000004, 4559526, 1400000.00);
    
SELECT * FROM Orders;


-- quetion 2 
SELECT * FROM Customers;

-- question 3
SELECT CustomerName
FROM Customers 
WHERE CustomerType = 5;

-- question 4
SELECT CustomerName, COUNT(*) AS NoOfOrders
FROM Customers c JOIN Orders o ON
 c.RecId = o.CustomerRecId
 GROUP BY o.CustomerRecId
 HAVING NoOfOrders > 1;
 
 
 
 -- question 5
 SELECT * FROM Orders
 WHERE Amount > 750000;
 
 
 -- question 6
 SELECT SUM(Amount) AS SumOfAmounts
 FROM Orders;
 
 -- question 7
 SELECT CustomerNumber, CustomerName, ct.CustomerType
 FROM Customers c JOIN CustomerType ct
 ON c.CustomerType = ct.RecId
 ORDER BY CustomerNumber;
