use session4_bt1;
select * from students;
insert into students(student_id,full_name,birth_date,gender,email)
values ('SV003','Phạm Thị Lan Anh','2003-03-18', 'Nữ', 'lananh.pham@example.com'),
('SV006', 'Hoàng Thị Ngọc', '2003-09-12', 'Nữ', NULL),
('SV007', 'Đặng Văn Khánh', '2002-07-30', 'Nam', NULL),
('SV008', 'Bùi Minh Châu', '2004-02-14', 'Nữ', 'chau.bui@example.com'),
('SV009', 'Lý Quốc Bảo', '2003-11-08', 'Nam', NULL),
('SV010', 'Mai Thị Hương', '2004-04-25', 'Nữ', 'huong.mai@example.com');
-- Hiển thị sinh viên chưa có email
 select * from students
 where email is NULL;
-- Hiển thị sinh viên đã có email
 select * from students
 where email is NOT NULL;
-- Hiển thị sinh viên có tên bắt đầu bằng chữ Ng
select * from students
where full_name like  'Ng%';
-- Hiển thị sinh viên không phải giới tính Nam
select * from students
where not gender = 'Nam';
