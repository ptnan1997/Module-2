use ss6_bt1;

-- Tạo thủ tục
delimiter $$
create procedure sp_get_products_by_category(in categories_id int)
begin
    select * from products
        where category_id = categories_id;
end $$
delimiter ;
call sp_get_products_by_category (2);