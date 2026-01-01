use inventorymanagement;


create table ProductSummary(
    SummaryID int primary key,
    TotalQuantity int
);

insert into ProductSummary (SummaryID, TotalQuantity)
VALUES (
        1,
        (select sum(quantity)
        from Products)
       );

delimiter $$
create trigger AfterProductUpdateSummary
after update on Products for each row
    begin
        if old.quantity <> new.quantity then
            update ProductSummary
            set
                TotalQuantity = (SELECT SUM(quantity) FROM Products)
            where SummaryID= 1;
        end if;
    end $$
delimiter ;
drop trigger AfterProductUpdateSummary;


update products
set quantity = 200
where product_id = 6;


