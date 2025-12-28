use ss6_bt2;

select * from products;

-- Tìm sản phẩm có giá nằm trong một khoảng cụ thể
    SELECT p.product_name,p.price
    FROM products p
    WHERE p.price between 2000 and 3000;
-- Tìm các sản phẩm có tên chứa một chuỗi ký tự nhất định
    SELECT  p.product_name
    FROM products p
    WHERE p.product_name LIKE 'A%';
-- Tính giá trung bình của sản phẩm cho mỗi danh mục
    SELECT
        avg(p.price) AS 'Giá trung bình của sản phẩm'
    FROM products p
    GROUP BY p.cate_id;
-- Tìm những sản phẩm có giá cao hơn mức giá trung bình của toàn bộ sản phẩm

SELECT
    p.product_name AS 'Tên Sản Phẩm'
FROM products p
WHERE p.price > (
                SELECT AVG(p.price)
                FROM products p
    );
-- Tìm sản phẩm có giá thấp nhất cho từng danh mục
    select *
    from products
    where price in (select min(p.price)
                    from products p
                    group by cate_id);
