use hethongbanhang;
alter table orders
add order_status bit;
create index idx_status_orderdate
on orders(order_date,order_status)