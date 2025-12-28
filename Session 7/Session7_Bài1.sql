create schema quanlysinhvien;
use quanlysinhvien;
create table students
(
    student_id int primary key auto_increment,
    full_name  varchar(50),
    birth_year year,
    class      varchar(50),
    address    varchar(255)
);
-- Thêm dữ liệu vào bảng students
INSERT INTO students (full_name, birth_year, class, address)
VALUES ('Nguyễn Văn An', 2003, '12A1', '123 Đường Láng, Hà Nội'),
       ('Trần Thị Bình', 2004, '12A2', '45 Nguyễn Trãi, TP.HCM'),
       ('Lê Hoàng Minh', 2002, '12B1', '78 Lê Lợi, Đà Nẵng'),
       ('Phạm Thị Lan', 2003, '12A3', '56 Trần Phú, Hải Phòng'),
       ('Vũ Đức Huy', 2004, '12B2', '89 Hùng Vương, Cần Thơ'),
       ('Hoàng Thị Ngọc', 2003, '12A1', '34 Quang Trung, Huế'),
       ('Đặng Văn Khánh', 2002, '12B3', '67 Bà Triệu, Vinh'),
       ('Bùi Minh Châu', 2004, '12A2', '12 Nguyễn Huệ, Nha Trang'),
       ('Lý Quốc Bảo', 2003, '12B1', '90 Lê Hồng Phong, Quy Nhơn'),
       ('Mai Thị Hương', 2004, '12A3', '23 Võ Văn Tần, Vũng Tàu');
-- Tạo một view  có tên v_student_basic
create view v_student_basic
as select student_id, full_name, class
from students;

select * from v_student_basic;
