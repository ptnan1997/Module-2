use chinook;

-- Tạo view

create view View_High_Value_Customers
as
    select
        c.*,
        sum(iv.Total) AS `Tổng chi tiêu`
    from customer c
    join invoice iv on c.CustomerId = iv.CustomerId
    group by c.customerId;



select * from View_High_Value_Customers;

create view View_Popular_Tracks
as
    select
        t.trackid,
        t.name,
        sum(ivl.Quantity)
    from track t
    join invoiceLine ivl on t.TrackId = ivl.TrackId
    group by t.trackId,t.name
    order by sum(ivl.Quantity) desc ,trackId;

-- Tạo index
-- tạo sử dụng Hash để truy vấn và sử dụng dấu bằng để so sánh =
create index idx_Customer_Country
on customer(Country)
using hash;
-- Tạo fulltext index khi truy vấn dùng với điều kiện where match (name) against('')

create fulltext index idx_Track_Name_FT
on Track (Name);

explain analyze(select *
                from Customer
                where Country = 'USA');
explain analyze(select *
                from track
                where match(Name)against('whole'));

-- Tạo Procedure

delimiter $$
    create procedure GetHighValueCustomersByCountry (in p_Country varchar (50))
        begin
            select *
            from view_high_value_customers
            where Country = p_Country;
        end $$
delimiter ;
explain
select *
from view_high_value_customers
where Country = 'USA';
-- Gọi thủ tục
call GetHighValueCustomersByCountry ('Germany');

-- Tạo thủ tục UpdateCustomerSpending
 delimiter $$
 create procedure UpdateCustomerSpending (in p_CustomerId int,in p_Amount double)
    begin
        update Invoice
        set total = total + p_Amount
        where CustomerId = p_CustomerId;
    end $$
 delimiter ;
 -- Thực thi thủ tục
 call UpdateCustomerSpending (1,5);

-- Xóa toàn bộ view . index và procedure
drop view if exists View_High_Value_Customers;
drop view if exists View_Popular_Tracks;

drop index idx_Customer_Country on Customer;
drop index idx_Track_Name_FT on Track;

drop procedure if exists GetHighValueCustomersByCountry;
drop procedure if exists UpdateCustomerSpending;



