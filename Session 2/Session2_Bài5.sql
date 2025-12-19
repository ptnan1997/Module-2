-- Tạo cơ sở dữ liệu
CREATE DATABASE qlbanhang;
USE qlbanhang;
-- Tạo bảng Products
CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR (100),
    Category 	VARCHAR (50),
    Price 		DECIMAL(10,2),
    StockQuantity INT 
);
SELECT * FROM Products;
-- Tạo bảng Orders
CREATE TABLE Orders (
	OrderID 	INT PRIMARY KEY,
    OrderDate 	DATE,
    ProductID	INT,
    Quantity	INT,
    TotalAmount	DECIMAL(10,2)
);
SELECT * FROM Orders;
-- Chèn 3 sản phẩm vào bảng Products
INSERT INTO  Products (ProductID,ProductName,Category,Price,StockQuantity)
VALUES (1,'Laisve Glove','Clothing',1890,200),
(2,'Cedar Crest','Clothing',4290,10),
(3,'GARMIN Venu 3','Electronics',48316,78);
-- Chèn 2 đơn hàng vào bảng Orders
INSERT INTO Orders(OrderID,OrderDate,ProductID,Quantity)
VALUES (1,20240516,3,2),
(2,20250818,2,5);
-- Cập nhật lại TotalAmount trong bảng Order bằng giá cụ thể
UPDATE Orders
SET TotalAmount = Quantity*2000
WHERE (ProductID = 2);



