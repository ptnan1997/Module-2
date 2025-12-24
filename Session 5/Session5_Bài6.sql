create database hethongbanhang;
use hethongbanhang;
create table customers(
    customer_id int primary key,
    customer_name varchar (100)
    );
create table orders(
    order_id int primary key,
    order_date date,
    customer_id int,
    foreign key (customer_id) references customers(customer_id)
);
create table order_items(
    Order_id int,
    Customer_id int,
    foreign key (Order_id) references orders (order_id),
    foreign key (Customer_id) references customers (customer_id),
    product_name varchar(100),
    primary key (Order_id, product_name),
    quantity int,
    price decimal(10,2)
);
-- Thêm dữ liệu cho Customers
INSERT INTO customers (customer_id, customer_name) VALUES
                                                       (1, 'Nguyễn Văn A'),
                                                       (2, 'Trần Thị B'),
                                                       (3, 'Lê Văn C'),
                                                       (4, 'Phạm Thị D'),
                                                       (5, 'Hoàng Văn E');
-- Thêm dữ liệu cho bảng Orders
INSERT INTO orders (order_id, order_date, customer_id) VALUES
                                                           (101, '2025-01-01', 1),
                                                           (102, '2025-01-02', 1),
                                                           (103, '2025-01-03', 2),
                                                           (104, '2025-01-04', 3),
                                                           (105, '2025-01-05', 4);
-- Thêm dữ liệu cho bảng Order_Items
INSERT INTO order_items (order_id, customer_id, product_name, quantity, price) VALUES
-- Đơn hàng 101 (Khách 1)
(101, 1, 'Chuột', 1, 150000),
(101, 1, 'Bàn phím', 1, 500000),

-- Đơn hàng 102 (Khách 1)
(102, 1, 'Màn hình', 1, 3000000),
(102, 1, 'Cáp HDMI', 2, 100000),

-- Đơn hàng 103 (Khách 2)
(103, 2, 'Laptop', 1, 15000000),
(103, 2, 'Túi laptop', 1, 300000),
(103, 2, 'Chuột không dây', 1, 400000),

-- Đơn hàng 104 (Khách 3)
(104, 3, 'Tai nghe', 2, 450000),

-- Đơn hàng 105 (Khách 4)
(105, 4, 'USB 32GB', 3, 120000),
(105, 4, 'Ổ cứng SSD', 1, 2000000);
-- Truy vấn Mã đơn hàng , tên khách hàng,  tổng tiền của đơn hàng
select
    o.order_id AS 'Mã Đơn Hàng',
    c.customer_name AS 'Tên Khách Hàng',
    SUM(oi.price*oi.quantity) AS 'Tổng tiền của đơn hàng'
from orders o
join customers c
on o.customer_id = c.customer_id
join order_items oi
on o.order_id = oi.order_id
group by o.order_id,c.customer_name;
-- Truy vấn Tính tổng doanh thu của mỗi khách hàng
select
    c.customer_name AS 'Tên Khách Hàng',
    SUM(oi.price*oi.quantity) AS 'Tổng doanh thu của khách hàng'
from customers c
         join orders o
              on o.customer_id = c.customer_id
         join order_items oi
              on o.order_id = oi.order_id
group by c.customer_name;
-- Chỉ hiển thị các khách hàng có doanh thu lớn hơn 20 triệu
select
    c.customer_name AS 'Tên Khách Hàng',
    SUM(oi.price*oi.quantity) AS 'Tổng doanh thu của khách hàng'
from customers c
         join orders o
              on o.customer_id = c.customer_id
         join order_items oi
              on o.order_id = oi.order_id
group by c.customer_name
having `Tổng doanh thu của khách hàng` < 20000000;
-- Hiển thị  khách hàng có doanh thu cao nhất
select
    c.customer_name AS 'Tên Khách Hàng',
    SUM(oi.price*oi.quantity) AS 'Tổng doanh thu của khách hàng'
from customers c
         join orders o
              on o.customer_id = c.customer_id
         join order_items oi
              on o.order_id = oi.order_id
group by c.customer_name
having SUM(oi.price*oi.quantity) =(
       SELECT MAX(`Tổng doanh thu khách hàng`)
       FROM
          (select
               sum(oi2.price*oi2.quantity) AS 'Tổng doanh thu khách hàng'
               from orders o2
               JOIN order_items oi2
                ON o2.order_id = oi2.order_id
                GROUP BY o2.customer_id
           ) t
       );
