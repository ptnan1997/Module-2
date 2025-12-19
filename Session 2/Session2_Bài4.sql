CREATE DATABASE bt4_ss1;
usE bt4_ss1;

CREATE TABLE Orders(
	OrderID 	INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID  INT,
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount>0)
);
SELECT * FROM Orders;