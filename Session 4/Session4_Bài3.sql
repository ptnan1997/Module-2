use session4_bt1;
-- Hiển thị sinh viên có năm sinh từ 2003 đến 2005
select * from students
where birth_date between '2003-01-01' and '2005-12-31';
-- Hiển thị sinh viên có giới tinh là Nam hoặc nữ
select * from students
where gender = 'Nam' or gender = 'Nữ';
-- Truy vấn sinh viên có mã sau: SV001 , SV004, SV005
select * from students
where student_id = 'SV001'
or student_id = 'SV004'
or student_id = 'SV005';
-- Chỉ hiển thị các thông tin sau : Mã sinh viên, Họ tên, Ngày sinh
Select student_id, full_name, birth_date from students;