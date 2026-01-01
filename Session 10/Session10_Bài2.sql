use InventoryManagement;

delimiter $$
    create trigger BeforeProductDelete
    before delete on products for each row
    begin
        if old.quantity >10 then
            signal sqlstate '45000'
            set message_text = 'Không được xóa sản phẩm có số lượng lớn hơn 10';
        end if;
    end $$
delimiter ;
drop trigger BeforeProductDelete;
delete from products where product_id =1;


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

update Products
set quantity = 5
where product_id = 8;

delete from products where product_id = 8;