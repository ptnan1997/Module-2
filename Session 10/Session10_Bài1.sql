create database InventoryManagement;
use InventoryManagement;

create table Products
(
    product_id   int primary key,
    product_name varchar(50),
    quantity     integer
);
create table inventoryChanges
(
    change_id    int primary key auto_increment,
    product_id   int,
    old_quantity integer,
    new_quantity integer,
    change_date  datetime
);
drop table inventoryChanges;
INSERT INTO Products
VALUES (1, 'Laptop Dell Inspiron', 50),
       (2, 'Chuột không dây Logitech', 150),
       (3, 'Bàn phím cơ Corsair', 80),
       (4, 'Màn hình Samsung 27 inch', 30),
       (5, 'Tai nghe Sony WH-1000XM4', 100),
       (6, 'Ổ cứng SSD 1TB Kingston', 200),
       (7, 'Ram 16GB DDR4 Corsair', 120),
       (8, 'Card đồ họa RTX 3060', 20);


delimiter $$
create trigger  AfterProductUpdate
after update on Products for each row
begin
    if old.quantity=new.quantity then
        signal sqlstate '40000'
        set message_text = 'Không thể chỉnh sửa vì giá trị mới bằng giá trị cũ';
    elseif
     old.quantity<>new.quantity then
    insert into InventoryChanges
        (product_id, old_quantity, new_quantity,change_date)
        values (
                new.product_id,
                old.quantity,
                new.quantity,
                now()
               );
    end if;
end $$
delimiter ;
drop trigger  AfterProductUpdate;

update products
set quantity = 155
where product_id = 7;

