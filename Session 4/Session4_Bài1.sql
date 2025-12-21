/*
 Yêu cầu:

1.  Thêm ít nhất 5 sinh viên vào bảng students
2. Trong số đó:
  Có ít nhất 1 sinh viên chưa có email
  Viết câu lệnh SELECT để:
3.  a.  Hiển thị toàn bộ danh sách sinh viên
    b.  Chỉ hiển thị các cột: mã sinh viên, họ tên, email
 */
create database session4_bt1;
use session4_bt1;
create table students(
    student_id int primary key,
    full_name varchar(50),
    birth_day date,
    gender varchar(10),
    email varchar(50)
)
-- Sử dụng SELECT để hiển thị toàn bộ danh sách sinh viên
select * from students;
-- Chỉ hiển thị các cột: Mã sinh viên, họ tên, email
select student_id,full_name,email from students ;