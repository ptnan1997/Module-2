use InventoryManagement;
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