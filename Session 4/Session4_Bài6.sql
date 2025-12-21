create database quanlysanpham;
use quanlysanpham;
-- Tạo bảng Products
create table products(
	product_id varchar(10) primary key,
    product_name  varchar(50),
    category varchar (50),
    price decimal(10,0),
    quantity int
);
INSERT INTO products (product_id, product_name, category, price, quantity) VALUES
(1, 'iPhone 15 Pro Max', 'Điện thoại', 34990000, 50),
(2, 'Samsung Galaxy S24 Ultra', 'Điện thoại', 31990000, 35),
(3, 'MacBook Pro M3 14 inch', 'Laptop', 49990000, 20),
(4, 'Dell XPS 15', 'Laptop', 42990000, 15),
(5, 'AirPods Pro 2', 'Tai nghe', 6490000, 120),
(6, 'Sony WH-1000XM5', 'Tai nghe', 8990000, 80),
(7, 'Ốp lưng iPhone 15 Silicone', 'Phụ kiện', 1200000, 200),
(8, 'Sạc nhanh 65W GaN', 'Phụ kiện', 890000, 150),
(9, 'Xiaomi 14', 'Điện thoại', 18990000, 60),
(10, 'Asus ROG Strix G16', 'Laptop', 45990000, 10);
-- Truy vấn dữ liệu
-- Hiển thị sản phẩm có giá từ 5.000.000  đến 15.000.000
 select * from products
 where price between 5000000 and 15000000;

 -- Hiển thị sản phẩm thuộc loại Laptop hoặc Tablet
 select * from products
 where category = 'Laptop' or category = 'Tablet';

 -- Hiển thị sản phẩm có tên bắt đầu bằng "Sam"
 select * from products
 where product_name LIKE 'Sam%';
 
 -- Hiển thị sản phẩm không thuộc loại Phone
 select * from products 
 where not category='Điện thoại';
 -- Cập nhật và xóa dữ liệu
 -- Giảm giá 5% cho các sản phẩm thuộc loại Laptop
 update products
 set price = price - price*5/100
 where category='Laptop';
select * from products ;
-- Xóa các sản phẩm có số lượng tồn kho bằng 0
delete from products where quantity = 0;
select * from products;
