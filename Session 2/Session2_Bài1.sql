CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Employees(
	EmployeeID INT,
    FirstName VARCHAR (50),
    LastName VARCHAR (50),
    HireDate DATE,
    Salary INT
);	

SELECT * FROM Employees;

ALTER TABLE Employees
ADD Department INT;

ALTER TABLE Employees
MODIFY COLUMN Salary decimal(10,2);