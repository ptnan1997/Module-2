use ss6_bt2;
select * from products;
select * from orders;
select * from customers;
select * from categories;
select * from order_details;
alter table order_details
add primary key (order_id,product_id);

insert into products (product_id, product_name, price, cate_id) VALUES (6,'Aorus 15G',4000,1);
-- Liệt kê sản phẩm cùng với tên danh mục tương ứng
select
    p.product_name AS 'Tên Sản Phẩm',
    cg.cate_name AS 'Tên Danh Mục'
from categories cg
join products p  on cg.cate_id = p.cate_id
group by p.product_name,cg.cate_name ;
-- Điếm số đơn hàng của từng khách hàng
    select
        c.customer_name AS 'Tên khách hàng',
        count(o.order_id) AS 'Tổng số đơn hàng'
    from customers c
    join orders o on c.customer_id = o.customer_id
    group by c.customer_name;
-- Xác định 5 khách hàng có tổng doanh thu cao nhất
    select
        c.customer_name AS 'Tên khách hàng',
        sum(od.price *od.quantity) AS 'Tổng doanh thu'
    from order_details od
    join  orders o on o.order_id = od.order_id
    join customers c on o.customer_id = c.customer_id
    group by o.customer_id
    order by  `Tổng doanh thu` DESC
    limit 5;
-- Tìm các sản phẩm chưa từng xuất hiên trong bất ký đơn hàng nào
    select
        p.product_name AS 'Tên sản phẩm'
    from products p
    right join order_details od on p.product_id = od.product_id
    where p.product_id is not NULL
    group by p.product_id;

-- Tìm ra những khách hàng đã mua sản phẩm thuộc danh mục có số lượng sản phẩm lớn nhất
    /*
    1. Những khách hàng đã mua sản phẩm
    2. Tim ra danh sách sản phẩm thuộc Danh mục có số lượng sản phẩm lớn nhất
    */

    select
        c.customer_name AS 'Tên khách hàng',
        cate.cate_name
    from order_details od
    join orders o on od.order_id = o.order_id
    join products p on od.product_id = p.product_id
    join customers c on o.customer_id = c.customer_id
    join categories cate on p.cate_id = cate.cate_id
    where cate.cate_name = (select
        cate.cate_name
    from categories cate
    join products p on cate.cate_id = p.cate_id
    group by cate.cate_name
    order by count(p.product_id) DESC
    limit 1)
    group by c.customer_name,cate.cate_name;








