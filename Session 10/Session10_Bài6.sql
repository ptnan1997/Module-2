use inventorymanagement;

create table InventoryChangeHistory(
    historyID int primary key auto_increment,
    productID int,
    foreign key (productID) references products(product_id),
    oldQuantity integer,
    newQuantity integer,
    changeType enum('Increase', 'Decrease'),
    changeDate datetime
);
drop table InventoryChangeHistory;


delimiter $$
create trigger AfterProductUpdateHistory
after update on Products for each row
    begin
        if OLD.quantity <> NEW.quantity then
            insert into InventoryChangeHistory (productID, oldQuantity, newQuantity, changeType, changeDate)
            values (
                    new.product_id,
                    OLD.quantity,
                    NEW.quantity,
                    CASE
                        WHEN NEW.quantity > OLD.quantity THEN 'Increase'
                        WHEN NEW.quantity < OLD.quantity THEN 'Decrease'
                        ELSE 'No change'
                        END,
                    now()
                   );
    end if;
    end $$
delimiter ;


update products
set quantity = 60
where product_id =4;