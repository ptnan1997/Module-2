drop database if exists ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;
-- 1. Bảng customers (Khách hàng)
CREATE TABLE customers
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255)        NOT NULL,
    email       VARCHAR(255) UNIQUE NOT NULL,
    phone       VARCHAR(20),
    address     TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Bảng orders (Đơn hàng)
CREATE TABLE orders
(
    order_id     INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT NOT NULL,
    order_date   TIMESTAMP                                  DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2)                             DEFAULT 0,
    status       ENUM ('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE
);

-- 3. Bảng products (Sản phẩm)
CREATE TABLE products
(
    product_id  INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255)   NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    description TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Bảng order_items (Chi tiết đơn hàng)
CREATE TABLE order_items
(
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id      INT            NOT NULL,
    product_id    INT            NOT NULL,
    quantity      INT            NOT NULL CHECK (quantity > 0),
    price         DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- 5. Bảng inventory (Kho hàng)
CREATE TABLE inventory
(
    product_id     INT PRIMARY KEY,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    last_updated   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);

-- 6. Bảng payments (Thanh toán)
CREATE TABLE payments
(
    payment_id     INT PRIMARY KEY AUTO_INCREMENT,
    order_id       INT                                                     NOT NULL,
    payment_date   TIMESTAMP                               DEFAULT CURRENT_TIMESTAMP,
    amount         DECIMAL(10, 2)                                          NOT NULL,
    payment_method ENUM ('Credit Card', 'PayPal', 'Bank Transfer', 'Cash') NOT NULL,
    status         ENUM ('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE
);
-- Thêm dữ liệu cho các bảng
INSERT INTO customers (name, email, phone, address)
VALUES ('Nguyen Van A', 'a@gmail.com', '0901111111', 'Ha Noi'),
       ('Tran Thi B', 'b@gmail.com', '0902222222', 'TP HCM'),
       ('Le Van C', 'c@gmail.com', '0903333333', 'Da Nang'),
       ('Pham Thi D', 'd@gmail.com', '0904444444', 'Can Tho'),
       ('Hoang Van E', 'e@gmail.com', '0905555555', 'Hai Phong');
INSERT INTO products (name, price, description)
VALUES ('Laptop Dell', 1500.00, 'Laptop Dell Inspiron'),
       ('iPhone 15', 1200.00, 'Apple iPhone 15'),
       ('Tai nghe Sony', 200.00, 'Sony Wireless Headphones'),
       ('Chuột Logitech', 50.00, 'Logitech Mouse'),
       ('Bàn phím Keychron', 120.00, 'Mechanical Keyboard');
INSERT INTO inventory (product_id, stock_quantity)
VALUES (1, 20),
       (2, 15),
       (3, 30),
       (4, 50),
       (5, 25);
INSERT INTO orders (customer_id, total_amount, status)
VALUES (1, 1700.00, 'Completed'),
       (2, 1250.00, 'Completed'),
       (3, 200.00, 'Pending'),
       (4, 240.00, 'Cancelled'),
       (5, 1500.00, 'Completed');
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
-- Order 1
(1, 1, 1, 1500.00),
(1, 4, 4, 50.00),

-- Order 2
(2, 2, 1, 1200.00),
(2, 4, 1, 50.00),

-- Order 3
(3, 3, 1, 200.00),

-- Order 4
(4, 5, 2, 120.00),

-- Order 5
(5, 1, 1, 1500.00);
INSERT INTO payments (order_id, amount, payment_method, status)
VALUES (1, 1700.00, 'Credit Card', 'Completed'),
       (2, 1250.00, 'PayPal', 'Completed'),
       (3, 200.00, 'Bank Transfer', 'Pending'),
       (4, 240.00, 'Cash', 'Failed'),
       (5, 1500.00, 'Credit Card', 'Completed');