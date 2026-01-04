use ecommerce ;

-- Trigger Before insert

create trigger Before_Insert
before insert on order_items for each row
    begin
        if NEW.quantity > (select stock_quantity
                          from inventory
                          where product_id = new.product_id ) then
            signal sqlstate '45000' set message_text = 'Số lượng không đủ ';
        end if;
    end ;

drop trigger Before_Insert;
insert into order_items (order_id, product_id, quantity, price)
values (
        2,2,30,3000
       );

-- Trigger AFTER INSERT:

create trigger After_Insert
after insert on  order_items for each row
    begin
        update orders
            set total_amount = (select sum(quantity*price)
                                from order_items
                                where order_id = new.order_id)
        where order_id = new.order_id;
    end;
drop trigger After_Insert;
insert into order_items (order_id, product_id, quantity, price)
VALUES (
        3,4,2,50
       );
-- Trigger Before Update

create trigger Before_Update
before update on order_items for each row
    begin
    if new.quantity > (select stock_quantity
                        from inventory
                        where product_id = new.product_id) then
        signal sqlstate '45000' set message_text = 'Vượt quá số lượng tồn kho';
        end if;
    end;
drop trigger Before_Update;
update order_items
set quantity = 51
where order_id = 1 and
    product_id = 4;

-- Trigger AFTER UPDATE:

create trigger After_Update
after update on order_items for each row
    begin
        update orders
            set total_amount = (select sum(quantity*price)
                                from order_items
                                where order_id = new.order_id)
        where order_id = new.order_id;

    end;
update order_items
set quantity = 3
where order_item_id = 4;

-- Trigger BEFORE DELETE:

create trigger Before_Delete
before delete on orders for each row
    begin
        if old.status = 'Completed' then
            signal sqlstate '45000' set message_text = 'Can not delete this order when status is Completed';
        end if;
    end;

delete from orders where order_id = 5;

-- Trigger AFTER DELETE:

create trigger After_Delete
after delete on order_items for each row
    begin
        update inventory
            set stock_quantity = stock_quantity + old.quantity
        where product_id = old.product_id;
    end;
drop trigger After_Delete;
delete from order_items where order_item_id =8;

-- Xóa Trigger:

drop trigger Before_Insert;
drop trigger After_Insert;
drop trigger Before_Update;
drop trigger After_Update;
drop trigger Before_Delete;
drop trigger After_Delete;