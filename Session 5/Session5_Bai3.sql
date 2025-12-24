use thongtinsinhvien;
create table products(
    product_id int primary key ,
    product_name varchar (50),
    category varchar(50),
    price decimal (10,2)
);
INSERT INTO products (product_id, product_name, category, price) VALUES
                                                                     (1, 'iPhone 14', 'Electronics', 999.99),
                                                                     (2, 'Samsung Galaxy S23', 'Electronics', 899.50),
                                                                     (3, 'Xiaomi Redmi Note 12', 'Electronics', 299.99),
                                                                     (4, 'MacBook Air M1', 'Electronics', 1099.00),
                                                                     (5, 'Dell XPS 13', 'Electronics', 1199.99),
                                                                     (6, 'HP Pavilion 15', 'Electronics', 749.99),
                                                                     (7, 'Sony WH-1000XM5', 'Accessories', 349.99),
                                                                     (8, 'AirPods Pro', 'Accessories', 249.00),
                                                                     (9, 'Logitech MX Master 3', 'Accessories', 99.99),
                                                                     (10, 'Keychron Q3', 'Accessories', 199.00),

                                                                     (11, 'Office Chair', 'Furniture', 159.99),
                                                                     (12, 'Wooden Desk', 'Furniture', 299.99),
                                                                     (13, 'Bookshelf', 'Furniture', 129.50),
                                                                     (14, 'Sofa 3 Seats', 'Furniture', 499.00),
                                                                     (15, 'Dining Table', 'Furniture', 399.99),

                                                                     (16, 'Nike Air Force 1', 'Fashion', 120.00),
                                                                     (17, 'Adidas Ultraboost', 'Fashion', 180.50),
                                                                     (18, 'Uniqlo T-Shirt', 'Fashion', 19.90),
                                                                     (19, 'Levi’s 501 Jeans', 'Fashion', 89.99),
                                                                     (20, 'Zara Jacket', 'Fashion', 129.00),

                                                                     (21, 'Panasonic Microwave', 'Home Appliances', 149.99),
                                                                     (22, 'LG Washing Machine', 'Home Appliances', 799.00),
                                                                     (23, 'Samsung Refrigerator', 'Home Appliances', 999.99),
                                                                     (24, 'Dyson Vacuum Cleaner', 'Home Appliances', 599.00),
                                                                     (25, 'Philips Air Fryer', 'Home Appliances', 199.99),

                                                                     (26, 'Apple Watch Series 9', 'Electronics', 429.00),
                                                                     (27, 'iPad Air', 'Electronics', 649.99),
                                                                     (28, 'Asus ROG Laptop', 'Electronics', 1599.00),
                                                                     (29, 'Lenovo ThinkPad X1', 'Electronics', 1399.50),
                                                                     (30, 'Acer Nitro 5', 'Electronics', 1099.99),

                                                                     (31, 'Canon EOS R10', 'Electronics', 979.00),
                                                                     (32, 'Sony Alpha A6400', 'Electronics', 899.99),
                                                                     (33, 'GoPro Hero 11', 'Electronics', 399.00),
                                                                     (34, 'DJI Mini 3', 'Electronics', 469.99),
                                                                     (35, 'Apple Pencil', 'Accessories', 129.00),

                                                                     (36, 'Samsung SSD 1TB', 'Accessories', 149.99),
                                                                     (37, 'WD External HDD 2TB', 'Accessories', 99.50),
                                                                     (38, 'TP-Link Router', 'Accessories', 79.99),
                                                                     (39, 'Anker Power Bank', 'Accessories', 49.99),
                                                                     (40, 'USB-C Hub', 'Accessories', 39.99),

                                                                     (41, 'Cooking Pan Set', 'Kitchen', 89.99),
                                                                     (42, 'Knife Set', 'Kitchen', 59.50),
                                                                     (43, 'Electric Kettle', 'Kitchen', 39.99),
                                                                     (44, 'Rice Cooker', 'Kitchen', 129.00),
                                                                     (45, 'Blender', 'Kitchen', 99.99),

                                                                     (46, 'Notebook A5', 'Stationery', 4.99),
                                                                     (47, 'Ballpoint Pen Set', 'Stationery', 6.50),
                                                                     (48, 'Desk Lamp', 'Stationery', 29.99),
                                                                     (49, 'Backpack', 'Stationery', 49.99),
                                                                     (50, 'Calculator', 'Stationery', 19.99);
SELECT * FROM products;
-- Hiển thị các sản phẩm  có giá cao hơn giá trung bình của tất cả sản phẩm
SELECT
    product_id,
    product_name
FROM products
WHERE price > (select
                   avg(price)
               from products);
-- Hiển thị sản phẩm có giá cao nhất trong từng loại sản phẩm
select
    p.category as 'Phân loại',
    p.product_name as 'Sản phẩm',
    p.price as 'Giá'
from products p
where price = (select max(price)
               from products i
               where p.category = i.category);
-- Hiển thị các sản phẩm  có ít nhất một sản phẩm có giá trên 500
SELECT *
FROM products
WHERE category IN (
    -- xét điều kiện trong (bảng nhóm các sản phẩm theo danh mục có(having) giá ít nhất là 500)
    SELECT p.category
    FROM products p
    GROUP BY category
    HAVING min(price) > 500
);
