USE Companydb;
CREATE TABLE Product(
	`ProductID` INT PRIMARY KEY,
    `ProductName` VARCHAR(50),
	`Category` VARCHAR(50),
    `Price` 	INT,
    `StockQuantity` INT
);
SELECT * FROM Product;
INSERT INTO Product (`ProductID`,`ProductName`,`Category`,`Price`,`StockQuantity`) 
VALUES(3,'Quần short','Quần áo', 5500,17);