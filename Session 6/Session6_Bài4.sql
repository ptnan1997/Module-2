use ss6_bt2;

create table customers
(
    customer_id    int primary key,
    customer_name  varchar(255),
    customer_email varchar(255)
);
create table orders
(
    order_id    int primary key,
    customer_id int,
    foreign key (customer_id) references customers (customer_id),
    order_date  date
);
create table categories
(
    cate_id   int primary key,
    cate_name varchar(255)
);
create table products
(
    product_id   int primary key,
    product_name varchar(50),
    price        double,
    cate_id      int,
    foreign key (cate_id) references categories (cate_id)
);
create table order_details
(
    order_id   int,
    product_id int,
    foreign key (order_id) references orders (order_id),
    foreign key (product_id) references products (product_id),
    primary key (order_id, product_id),
    quantity   int,
    price      double
);
INSERT INTO customers (customer_id, customer_name, customer_email)
VALUES (1, 'Nguyen Van A', 'a@gmail.com'),
       (2, 'Tran Thi B', 'b@gmail.com'),
       (3, 'Le Van C', 'c@gmail.com'),
       (4, 'Pham Thi D', 'd@gmail.com'),
       (5, 'Hoang Van E', 'e@gmail.com'),
       (6, 'Nguyen Thi F', 'f@gmail.com'),
       (7, 'Vu Van G', 'g@gmail.com'),
       (8, 'Ly Thi H', 'h@gmail.com'),
       (9, 'Bui Van I', 'i@gmail.com'),
       (10, 'Do Thi K', 'k@gmail.com');
-- 1. Bảng customers
INSERT INTO customers (customer_id, customer_name, customer_email)
VALUES (1, 'Nguyen Van A', 'a@gmail.com'),
       (2, 'Tran Thi B', 'b@gmail.com'),
       (3, 'Le Van C', 'c@gmail.com'),
       (4, 'Pham Thi D', 'd@gmail.com'),
       (5, 'Hoang Van E', 'e@gmail.com'),
       (6, 'Nguyen Thi F', 'f@gmail.com'),
       (7, 'Vu Van G', 'g@gmail.com'),
       (8, 'Ly Thi H', 'h@gmail.com'),
       (9, 'Bui Van I', 'i@gmail.com'),
       (10, 'Do Thi K', 'k@gmail.com');

-- 2. Bảng categories
INSERT INTO categories (cate_id, cate_name)
VALUES (1, 'Laptop'),
       (2, 'Phone'),
       (3, 'Accessory'),
       (4, 'Tablet'),
       (5, 'Smartwatch'),
       (6, 'Charger');

-- 3. Bảng products
INSERT INTO products (product_id, product_name, price, cate_id)
VALUES (1, 'MacBook Pro', 3500, 1),
       (2, 'Dell XPS', 2800, 1),
       (3, 'iPhone 15 Pro', 3000, 2),
       (4, 'Samsung S24', 2200, 2),
       (5, 'AirPods Pro', 600, 3),
       (6, 'iPad Air', 2500, 4),
       (7, 'Samsung Galaxy Tab S9', 2000, 4),
       (8, 'Apple Watch Series 9', 1200, 5),
       (9, 'Galaxy Watch 6', 900, 5),
       (10, 'Anker 65W Charger', 300, 6),
       (11, 'Baseus 100W GaN Charger', 450, 6);

-- 4. Bảng orders
INSERT INTO orders (order_id, customer_id, order_date)
VALUES (1, 1, '2024-01-10'),
       (2, 1, '2024-02-05'),
       (3, 2, '2024-02-20'),
       (4, 3, '2024-03-01'),
       (5, 3, '2025-12-26'),
       (6, 4, '2025-01-05'),
       (7, 1, '2025-01-12'),
       (8, 2, '2025-01-18'),
       (9, 5, '2025-01-25'),
       (10, 6, '2025-02-02'),
       (11, 3, '2025-02-10'),
       (12, 7, '2025-02-15'),
       (13, 8, '2025-02-20'),
       (14, 1, '2025-03-01'),
       (15, 9, '2025-03-15'),
       (16, 2, '2025-04-01'),
       (17, 10, '2025-04-10'),
       (18, 4, '2025-05-05');

-- 5. Bảng order_details
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
-- Đơn 1
(1, 1, 1, 3500),
(1, 5, 2, 600),
-- Đơn 2
(2, 3, 1, 3000),
-- Đơn 3
(3, 4, 2, 2200),
-- Đơn 4
(4, 2, 1, 2800),
(4, 5, 1, 600),
(5, 4, 2, 2200),
(6, 5, 8, 600),
(6, 3, 2, 3000),
(7, 5, 6, 600),
(7, 4, 3, 2200),
(8, 5, 10, 600),
(8, 1, 1, 3500),
(9, 10, 15, 300),
(9, 3, 1, 3000),
(10, 5, 7, 600),
(10, 4, 4, 2200),
(11, 5, 9, 600),
(11, 8, 2, 1200),
(12, 10, 12, 300),
(12, 6, 1, 2500),
(13, 11, 8, 450),
(13, 4, 5, 2200),
(14, 5, 5, 600),
(14, 3, 2, 3000),
(15, 10, 10, 300),
(15, 9, 3, 900),
(16, 5, 12, 600),
(16, 4, 3, 2200),
(17, 11, 6, 450),
(17, 7, 1, 2000),
(18, 5, 8, 600),
(18, 8, 1, 1200);
-- Thêm mới một đơn hàng mới vào bảng orders và chi tiết  của đơn hàng đó vào bảng order_details
insert into orders (order_id, customer_id, order_date)
VALUES (5, 3, '2025-12-26');
insert into order_details (order_id, product_id, quantity, price)
VALUES (5, 4, 2, 2200);



-- Tính tổng doanh thu của toàn bộ cửa hàng
/*
    1. Doanh thu theo từng đơn hàng
    2. Doanh thu của cửa hàng = tổng các doanh thu các đơn hàng
*/
select sum(`Doanh thu theo đơn hàng`) AS `Doanh thu cửa hàng`
from (select sum(od.quantity * od.price) AS `Doanh thu theo đơn hàng`
      from order_details od
      group by od.order_id) t;
-- Tính doanh thu trung bình của mỗi đơn hàng
/*
    1. doanh thu theo từng đơn hàng
    2. trung bình doanh thu theo từng đơn hàng
*/
select avg(`Doanh Thu`)
from (select sum(od.quantity * od.price) AS `Doanh Thu`
      from order_details od
      group by od.order_id) t;
-- Truy vấn thông tin đơn hàng có doanh thu cao nhất
select max(`Doanh Thu`)
from (select sum(od.quantity * od.price) AS `Doanh Thu`
      from order_details od
      group by od.order_id) AS `Đơn hàng doanh thu cao nhất`;
-- Truy vấn top 3 sản phẩm bán chạy dựa trên tổng số lượng sản phẩm đã bán
SELECT
    od.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity
FROM order_details od
         JOIN products p ON od.product_id = p.product_id
GROUP BY od.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 3;



select *
from order_details;
select *
from products;
select *
from categories;
select *
from orders;
select *
from customers;