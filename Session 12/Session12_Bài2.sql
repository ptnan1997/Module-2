use ecommerce;


-- Stored Procedure sp_create_order:

delimiter $$
create procedure sp_create_order
    (
        in customer_id_in int,
        in product_id_in int,
        in quantity_in int,
        in price_in double
    )
begin
    declare orderId int;
    begin
        if quantity_in > (select stock_quantity
                          from inventory
                          where product_id = product_id_in)
        then
            rollback;
        else
            insert into orders (customer_id, order_date, total_amount)
            VALUES (customer_id_in,
                    now(),
                    quantity_in
                    );
            set orderid = LAST_INSERT_ID();
            insert into order_items (order_id, product_id, quantity, price)
                VALUES  (
                         orderId,
                         product_id_in,
                         quantity_in,
                         price_in
                        );
            update inventory
                set stock_quantity = stock_quantity - quantity_in
            where product_id = product_id_in;
            update orders
                set total_amount = (select sum(quantity*price)
                                    from order_items
                                    where order_id = orderId )
            where order_id = orderId;
            COMMIT;
        end if;
    end;
end $$
delimiter ;
drop procedure sp_create_order;
call sp_create_order (4,4,5,50);

-- Stored Procedure sp_pay_order:

delimiter $$
create procedure sp_pay_order(
    in order_id_in int,
    in payment_method_in varchar(50)
)
begin
    DECLARE payAMOUNT INT;
    SET payAMOUNT = (SELECT total_amount
                  from orders
                  where order_id = order_id_in);
    BEGIN
        if (select status
            from orders
            where order_id =order_id_in) <> 'Pending'
        then
            rollback;
            signal sqlstate '45000' set message_text = 'Order status is not pending';
        else
            insert into payments (order_id, amount, payment_method)
                VALUES (
                           order_id_in,
                           payAMOUNT,
                           payment_method_in
                       );
            update orders
                set status = 'Completed'
            where order_id = order_id_in;
            COMMIT;
        end if;
        end;
end $$
delimiter ;

call sp_pay_order (3,'Credit Card');


-- Stored Procedure sp_cancel_order:

delimiter $$
create procedure  sp_cancel_order(in order_id_in int)
begin
    declare find_product int;
    declare find_quantity int;
    set find_quantity = (select quantity
                         from order_items
                         where order_id = order_id_in);
    set find_product = (select product_id
                        from order_items
                        where order_id = order_id_in);

start transaction;

    if (select status
        from orders
        where order_id =order_id_in) <> 'Pending'
    then
        rollback;
        signal sqlstate '45000' set message_text = 'Order status is not pending';
    else
        update inventory
            set stock_quantity = stock_quantity + find_quantity
        where product_id = find_product ;
        delete from order_items where order_id = order_id_in;
        update orders
            set status = 'Cancelled'
        where order_id = order_id_in;
    commit ;
    end if;
end $$
delimiter ;
drop procedure  sp_cancel_order;

call sp_cancel_order (7);

-- Xóa tất cả các đối tượng:

drop procedure sp_create_order;
drop procedure sp_pay_order;
drop procedure  sp_cancel_order;
