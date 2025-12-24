create database quanlybanhang;
use quanlybanhang;
CREATE TABLE Customers (
      customer_id INT PRIMARY KEY,
      customer_name VARCHAR(100) NOT NULL
);
CREATE TABLE Orders (
      order_id INT PRIMARY KEY,
      order_date DATE NOT NULL,
      customer_id INT,
      FOREIGN KEY (customer_id)
      REFERENCES Customers(customer_id)
);
CREATE TABLE Order_items (
       order_id INT,
       product_name VARCHAR(100) NOT NULL,
       quantity INT NOT NULL,
       price DECIMAL(10,2) NOT NULL,
       FOREIGN KEY (order_id)
       REFERENCES Orders(order_id)
);
-- Thêm dữ liệu cho Customer (10 khách hàng)
INSERT INTO Customers (customer_id, customer_name) VALUES
                                                       (1, 'Nguyen Van An'),
                                                       (2, 'Tran Thi Binh'),
                                                       (3, 'Le Hoang Cuong'),
                                                       (4, 'Pham Thi Dao'),
                                                       (5, 'Hoang Minh Duc'),
                                                       (6, 'Vu Thu Ha'),
                                                       (7, 'Doan Quoc Huy'),
                                                       (8, 'Bui Thi Lan'),
                                                       (9, 'Dang Van Nam'),
                                                       (10, 'Phan Ngoc Oanh');
select * from Customers;
-- Thêm dữ liệu cho Orders (15 đơn hàng)
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
                                                           (101, '2025-01-05', 1),
                                                           (102, '2025-01-07', 2),
                                                           (103, '2025-01-10', 3),
                                                           (104, '2025-01-12', 1),
                                                           (105, '2025-01-15', 4),
                                                           (106, '2025-01-18', 5),
                                                           (107, '2025-01-20', 6),
                                                           (108, '2025-01-22', 7),
                                                           (109, '2025-01-25', 8),
                                                           (110, '2025-01-28', 9),
                                                           (111, '2025-02-01', 10),
                                                           (112, '2025-02-03', 2),
                                                           (113, '2025-02-05', 3),
                                                           (114, '2025-02-07', 4),
                                                           (115, '2025-02-10', 5);
select * from Orders;
-- Thêm dữ liệu cho Order_items
INSERT INTO Order_items (order_id, product_name, quantity, price) VALUES
                                                                      (101, 'Laptop Dell', 1, 1200),
                                                                      (101, 'Mouse Logitech', 2, 25),

                                                                      (102, 'iPhone 14', 1, 999),
                                                                      (102, 'AirPods Pro', 1, 249),

                                                                      (103, 'Samsung TV', 1, 1500),
                                                                      (103, 'HDMI Cable', 2, 20),

                                                                      (104, 'MacBook Air', 1, 1100),

                                                                      (105, 'Office Chair', 2, 150),

                                                                      (106, 'Keyboard Mechanical', 1, 200),
                                                                      (106, 'Mouse Pad', 1, 20),

                                                                      (107, 'Washing Machine', 1, 800),

                                                                      (108, 'Refrigerator', 1, 1300),

                                                                      (109, 'Electric Kettle', 3, 40),

                                                                      (110, 'Nike Shoes', 2, 120),

                                                                      (111, 'Adidas Jacket', 1, 180),

                                                                      (112, 'Tablet Samsung', 1, 650),

                                                                      (113, 'Gaming Monitor', 2, 450),

                                                                      (114, 'Desk Lamp', 2, 35),

                                                                      (115, 'Backpack', 1, 90);
select * from Order_items;

-- Truy vấn mã đơn hàng, ngày đặt hàng và tên khách hàng
select
    o.order_id as 'Mã đơn hàng',
    o.order_date as 'Ngày đặt hàng',
    c.customer_name as 'Tên Khách hàng'
from Orders o
join Customers c
on  o.customer_id = c.customer_id;

-- Hiển thị danh sách sản phẩn trong mỗi đơn hàng
select
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt hàng',
    i.product_name AS 'Tên sản phẩm'
from Orders o
join Order_items i
on o.order_id = i.order_id;
-- Tính tổng tiền của mỗi đơn hàng
select
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt hàng',
    oi.product_name AS 'Tên sản phẩm',
    c.customer_name AS 'Tên khách hàng',
    SUM(oi.quantity * oi.price) AS 'TotalAmount'
from Orders o
join Order_items Oi on o.order_id = Oi.order_id
join Customers C on o.customer_id = C.customer_id
group by o.order_id,o.order_date,c.customer_name,oi.product_name
-- Hiển thị các đơn hàng có tổng tiền lớn hơn 1000
select
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt hàng',
    oi.product_name AS 'Tên sản phẩm',
    c.customer_name AS 'Tên khách hàng',
    SUM(oi.quantity * oi.price) AS 'TotalAmount'
from Orders o
         join Order_items Oi
on o.order_id = Oi.order_id
         join Customers c
on o.customer_id =c.customer_id
group by o.order_id,o.order_date,c.customer_name,oi.product_name
having SUM(oi.quantity * oi.price) >=1000;