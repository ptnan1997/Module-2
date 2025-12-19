CREATE DATABASE hethongbanle;
USE hethongbanle;
CREATE TABLE Sales(
	SaleID	INT PRIMARY KEY,
    SaleDate DATE,
    CustomerID	INT,
    TotalAmount	DECIMAL(10,2)
);
CREATE TABLE Products(
	ProductID	INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category	VARCHAR(255),
    Price	DECIMAL(10,2)
);
AlTER TABLE Products
MODIFY Price DECIMAL (10,3);
CREATE TABLE SalesDetails(
	SaleDetailID	INT PRIMARY KEY,
    SaleID INT,
    ProductID	INT,
    Quantity	INT,
	UnitPrice	DECIMAL(10,2)
);
SELECT * FROM Sales;
SELECT * FROM Products;
SELECT * FROM SalesDetails;
INSERT INTO Sales (SaleID,SaleDate, CustomerID, TotalAmount) VALUES
(1,'2025-10-05', 201, 276000),
(2,'2025-10-12', 202, 331000),
(3,'2025-10-20', 203, 544000),
(4,'2025-11-02', 204, 320000),
(5,'2025-11-15', 205, 489000),
(6,'2025-12-01', 206, 367000);
INSERT INTO SalesDetails (SaleDetailID,SaleID, ProductID, Quantity, UnitPrice) VALUES
-- Hóa đơn 1
(1,1, 1, 2, 83000),     -- Loa Bluetooth Mini
(2,1, 2, 1, 39000),     -- Bóng đèn 150W
(3,1, 3, 1, 108000),    -- Đèn LED

-- Hóa đơn 2
(4,2, 4, 1, 115000),    -- Sữa rửa mặt Cerave
(5,2, 5, 2, 67000),     -- Kem chống nắng
(6,2, 6, 1, 237000),    -- Máy cạo râu

-- Hóa đơn 3
(7,3, 9, 2, 252000),    -- Giày sneaker
(8,3, 10, 1, 109000),   -- Giày vải

-- Hóa đơn 4
(9,4, 7, 2, 154500),    -- Combo vệ sinh
(10,4, 8, 1, 69000),     -- Quạt mini

-- Hóa đơn 5
(11,5, 1, 1, 83000),
(12,5, 6, 1, 237000),
(13,5, 3, 1, 108000),

-- Hóa đơn 6
(14,6, 4, 1, 115000),
(15,6, 5, 1, 67000),
(16,6, 2, 1, 39000),
(17,6, 8, 2, 69000);


