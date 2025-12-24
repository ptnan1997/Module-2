create database thongtinsinhvien;
use thongtinsinhvien;
create table students(
    student_id  int primary key ,
    full_name varchar(100),
    birth_year year,
    gender varchar (10),
    score decimal (10,2)
);
select * from students;
drop table students;
    -- Chèn dữ liệu vào bảng
INSERT INTO students (student_id, full_name, birth_year, gender, score) VALUES

(1, 'Nguyen Van An', 2002, 'Male', 8.50),
(2, 'Tran Thi Bich', 2001, 'Female', 7.75),
(3, 'Le Hoang Nam', 2003, 'Male', 6.75),
(4, 'Pham Thu Trang', 2002, 'Female', 9.25),
(5, 'Vu Minh Duc', 2001, 'Male', 7.25),
(6, 'Do Thi Lan', 2003, 'Female', 8.00),
(7, 'Hoang Quoc Bao', 2002, 'Male', 5.75),
(8, 'Nguyen Thi Mai', 2001, 'Female', 8.75),
(9, 'Bui Tien Dat', 2003, 'Male', 6.50),
(10, 'Tran Ngoc Anh', 2002, 'Female', 9.25),
(11, 'Le Thanh Tung', 2001, 'Male', 7.0),
(12, 'Pham My Linh', 2003, 'Female', 8.75),
(13, 'Nguyen Huu Phuoc', 2002, 'Male', 6.25),
(14, 'Doan Thi Hong', 2001, 'Female', 7.5),
(15, 'Vo Quang Huy', 2003, 'Male', 8.25),
(16, 'Dang Thu Ha', 2002, 'Female', 9.75),
(17, 'Ly Minh Quan', 2001, 'Male', 5.75),
(18, 'Ngo Phuong Thao', 2003, 'Female', 7.00),
(19, 'Trinh Duc Long', 2002, 'Male', 6.75),
(20, 'Cao Thi Yen', 2001, 'Female', 8.25);

-- Các câu lệnh truy vấn dữ liệu:
-- 1. Truy vấn mã sinh viên và tên (uppercase)
select student_id, upper(full_name) from students;
-- 2. Họ tên , số tuổi của sinh viên dựa vào năm hiện tại'
select full_name, (YEAR(CURDATE()) - birth_year)as 'Tuổi'
from students;
-- 3. Hiển thị họ tên, điểm trung bình được làm tròn 1 chữ số thập phân
select
    full_name,
    ceiling(avg(score) *10)/10 AS Avg_score
from students
group by full_name;
-- 4. Tổng số sinh viên, điểm cao nhất, điểm thấp nhất
select count(student_id) as 'Tổng số sinh viên',
       max(score) as 'Điểm cao nhất',
       min(score) as 'Điểm thấp nhất'
from students;