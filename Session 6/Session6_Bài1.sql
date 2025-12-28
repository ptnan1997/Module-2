create database ss6_bt1;
use ss6_bt1;
create table products(
    product_id int primary key ,
    product_name varchar (50),
    price double,
    category_id int,
    foreign key (category_id) references categories(category_id)
);
create table categories(
    category_id int primary key,
    category_name varchar(50)
);
-- Thêm 3 sản phẩm mới vào bảng products
insert into products (product_id, product_name, price, category_id)
values (1,'Dép lào',15000,1),
       (2,'Tai nghe Sony 1000 MX6',10000000,2),
       (3,'Bình giữ nhiệt',250000,3);
insert into products (product_id, product_name, price, category_id)
values (4,'Áo thun nam',15000,1),
       (5,'Máy tính cầm tay',10000000,2),
       (6,'Chảo chống dính',250000,3);
insert into categories (category_id, category_name)
VALUES (1,'Trang phục'),
       (2,'Thiết bị điện tử'),
       (3,'Bình giữ nhiệt');
-- Cập nhật giá của một sản phẩm đã có
UPDATE  products
SET price = 20000
WHERE product_id = 1;
-- Xóa một sản phẩm
DELETE FROM products WHERE product_id = 2;
-- Hiển thị tất cả sản phẩm, sắp xếp theo giá
select * from products
order by price desc;
-- Thống kê số lượng sản phẩm cho từng danh mục
select
    count(product_id) AS 'Số lượng sản phầm'
from products
group by category_id;