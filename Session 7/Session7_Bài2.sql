use hethongbanhang;
select * from orders;
select * from customers;
/* Tạo một VIEW có tên v_order_info
VIEW hiển thị các thông tin:
mã đơn hàng
ngày đặt hàng
tên khách hàng
VIEW được tạo từ hai bảng: customers và orders
Chỉ viết câu lệnh CREATE VIEW
    Không cần tạo VIEW có khả năng cập nhật dữ liệu
 */
create view v_order_info
as  select
        o.order_id,
        o.order_date,
        c.customer_name
    from orders o
    join customers c on o.customer_id = c.customer_id;

select * from v_order_info;