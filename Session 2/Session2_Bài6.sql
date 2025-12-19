CREATE DATABASE qlythuongmai;
USE qlythuongmai;
-- Tạo bảng Customers
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(100),
    Email 		 VARCHAR(100),
    Phone		VARCHAR(15)
);

-- Tạo bảng Orders
CREATE TABLE Orders (
	OrderID		INT PRIMARY KEY,
    OrderDate 	DATE,
    CustomerID	INT
);

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY,
    OrderID		INT,
    ProductID 	INT,
    Quantity 	INT,
    UnitPrice 	DECIMAL(10,2)
);

-- Chèn ít nhất 2 khách hàng vào bảng Customers.
INSERT INTO Customers (CustomerID,CustomerName,Email,Phone)
VALUES (1,'Trương Đình Hoàng','hoangdinhtruong@gmail.com','+84250334231'),
(2,'Vũ Thị Thu Thảo','thaocute99@gmail.com',+849201232423);
-- Chèn ít nhất 3 đơn hàng vào bảng Orders, liên kết với các khách hàng đã thêm.
INSERT INTO Orders (OrderID,OrderDate,CustomerID)
VALUES (1,'2025-11-20',2),
(2,'2025-09-21',1),
(3,'2025-04-28',2);
-- Chèn ít nhất 5 chi tiết đơn hàng vào bảng OrderDetails, liên kết với các đơn hàng và sản phẩm.
INSERT INTO OrderDetails (OrderDetailID,OrderID,ProductID,Quantity,UnitPrice)
VALUES (1,2,2,2,3600),
(2,3,3,3,3000),
(3,1,1,2,5500),
(4,1,6,1,4000),
(5,2,4,2,3750);
-- Cập nhật số điện thoại của một khách hàng cụ thể trong bảng Customers.
UPDATE Customers
SET Phone = '+84919342311'
WHERE CustomerName ='Vũ Thị Thu Thảo';
-- Xóa tất cả các đơn hàng của khách hàng không còn hoạt động
DELETE FROM Customers 
WHERE CustomerID =2;
DELETE FROM Orders
WHERE CustomerID =2;
-- Truy vấn toàn bộ danh sách khách hàng
SELECT * FROM Customers;

SELECT * FROM Orders
WHERE CustomerID = 1;
SELECT * FROM OrderDetails
WHERE OrderID = 2;




