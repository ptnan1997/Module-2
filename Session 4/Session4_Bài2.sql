use session4_bt1;
-- Chỉnh sửa dữ liệu bằng UPDATE 
-- 1. Cập nhật email cho sinh viên chưa có email
update students
set email = 'example@example.com'
where  student_id='SV003';
select*from students;
-- Cập nhật giới tính cho sinh viên có mã sv là SV005
update students
set gender = 'LGBT'
where student_id = 'SV005';
select*from students;
-- Xóa sinh viên có mã sv SV003
delete from students where student_id = 'SV003';
select*from students;