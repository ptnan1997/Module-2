create database ss6_bt2;
use ss6_bt2;
create table customers (
    customer_id int primary key,
    customer_name varchar(255),
    customer_email varchar(255)
);
create table orders(
    order_id int primary key,
    customer_id int,
    foreign key (customer_id) references customers(customer_id),
    order_date date
);
create table categories(
    cate_id int primary key,
    cate_name varchar(255)
);
create table products(
    product_id int primary key,
    product_name varchar(50),
    price double,
    cate_id int,
    foreign key (cate_id) references categories(cate_id)
);
create table order_details(
    order_id int,
    product_id int,
    foreign key (order_id) references orders (order_id),
    foreign key (product_id) references products (product_id),
    primary key (order_id,product_id),
    quantity int,
    price double
);

-- Thêm dữ liệu vào các bảng
INSERT INTO customers (customer_id, customer_name, customer_email) VALUES
                                            (1, 'Nguyen Van A', 'a@gmail.com'),
                                            (2, 'Tran Thi B', 'b@gmail.com'),
                                            (3, 'Le Van C', 'c@gmail.com'),
                                            (4, 'Pham Thi D', 'd@gmail.com');
INSERT INTO categories (cate_id, cate_name) VALUES
                                      (1, 'Laptop'),
                                      (2, 'Phone'),
                                      (3, 'Accessory');
INSERT INTO orders (order_id, customer_id, order_date) VALUES
                                                     (1, 1, '2024-01-10'),
                                                     (2, 1, '2024-02-05'),
                                                     (3, 2, '2024-02-20'),
                                                     (4, 3, '2024-03-01');
INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
-- Order 1
(1, 1, 1, 3500),
(1, 5, 2, 600),

-- Order 2
(2, 3, 1, 3000),

-- Order 3
(3, 4, 2, 2200),

-- Order 4
(4, 2, 1, 2800),
(4, 5, 1, 600);
INSERT INTO products (product_id, product_name, price, cate_id) VALUES
                                                        (1, 'MacBook Pro', 3500, 1),
                                                        (2, 'Dell XPS', 2800, 1),
                                                        (3, 'iPhone 15 Pro', 3000, 2),
                                                        (4, 'Samsung S24', 2200, 2),
                                                        (5, 'AirPods Pro', 600, 3);
select * from products;
select * from customers;
select * from order_details;
select * from orders;
select * from categories;

-- Liệt kê những khách hàng có ít nhất một đơn hàng

select
    c.customer_name AS 'Tên Khách Hàng',
    count(o.order_id) AS 'Số đơn hàng'
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id
having `Số đơn hàng` >= 1;
-- Tìm những khách hàng chưa đặt đơn hàng nào
select
    c.customer_name AS 'Tên Khách Hàng',
    sum(o.order_id) AS 'Số đơn hàng'
from customers c
        left join orders o on o.customer_id = c.customer_id
group by c.customer_id,c.customer_name
having `Số đơn hàng` is Null ;
-- Tính toán tổng số doanh thu mà khách hàng mang lại
    -- Truy vấn doanh thu của mỗi khách hàng


    select sum(Doanh_thu_khach) AS Tong_doanh_thu
    from (select
              sum(od.quantity*od.price) AS Doanh_thu_khach
          from order_details od
                   join orders o on od.order_id = o.order_id
                   join customers c on o.customer_id = c.customer_id
          group by c.customer_id)sub;
-- Xác định khách hàng  đã mua sản phẩm có giá cao nhất

    select
        c.customer_name AS 'Tên Khách Hàng',
        p.product_name AS 'Tên sản phẩm',
        od.price
    from order_details od
    join products p on od.product_id = p.product_id
    join orders o on od.order_id = o.order_id
    join customers c on o.customer_id = c.customer_id
    where od.price = (
                      select
                          max(od.price)
                      from order_details od
                      );