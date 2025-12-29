use quanlydonhang;
INSERT INTO products (productID, productName, stock)
VALUES (1, 'iPhone 15', 50),
       (2, 'Samsung Galaxy S24', 40),
       (3, 'MacBook Air M2', 30),
       (4, 'Dell XPS 13', 25),
       (5, 'iPad Pro', 35),
       (6, 'Bàn phím Keychron', 60),
       (7, 'Chuột Logitech MX Master', 55),
       (8, 'Tai nghe Sony WH-1000XM5', 20),
       (9, 'Màn hình LG 27 inch', 45),
       (10, 'Router TP-Link AX3000', 70);
INSERT INTO orders (orderID, productID, quantity, TotalAmount)
VALUES (1, 1, 1, 25000000),
       (2, 2, 2, 44000000),
       (3, 3, 1, 28000000),
       (4, 4, 1, 30000000),
       (5, 5, 2, 42000000),
       (6, 6, 3, 7500000),
       (7, 7, 2, 3600000),
       (8, 8, 1, 8500000),
       (9, 9, 2, 14000000),
       (10, 10, 1, 3200000);
INSERT INTO order_details (orderID, productID, price)
VALUES (1, 1, 25000000),
       (2, 2, 22000000),
       (3, 3, 28000000),
       (4, 4, 30000000),
       (5, 5, 21000000),
       (6, 6, 2500000),
       (7, 7, 1800000),
       (8, 8, 8500000),
       (9, 9, 7000000),
       (10, 10, 3200000);


-- Tạo thủ tục

delimiter $$
    create procedure sp_check_order_value(in totalAmount double)
    begin
        declare check_order_value varchar (50);

        if totalAmount >= 5000000 then
            set check_order_value ='Đơn hàng giá trị cao';
        else
            set check_order_value ='Đơn hàng bình thường';
        end if;
        select check_order_value;
    end $$
delimiter ;
drop procedure sp_check_order_value;
call sp_check_order_value (5000000);