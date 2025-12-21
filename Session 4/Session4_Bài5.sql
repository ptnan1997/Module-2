create database quanlynhanvien;
use quanlynhanvien;
create table employees(
	emp_id int primary key,
    full_name varchar (50),
    birth_year year,
    department	varchar (50),
    salary decimal(10,3),
    phone int
);
select * from employees;

-- Hiển thị danh sách nhân viên có mức lương từ 10 triệu đến 20 triệu
select * from employees
where salary between 10000000 and 20000000;
-- Hiển thị nhân viên thuộc phòng ban IT or HR
select * from employees
where department = 'IT' or department = 'HR';
-- Hiển thị nhân viên có họ tên chứa chữ Anh
select * from employees
where full_name  like '%Anh%';
-- Hiển thị nhân viên chưa có số điện thoại
select * from employees
where phone is null;
-- Cập nhật và xóa dữ liệu
select * from employees;
-- Cập nhật lương tăng 10% cho nhân viên IT
update employees
set salary= salary + salary*10/100
where department = 'IT';
select * from employees;
-- Cập nhật số điện thoại cố định cho nhân viên chưa có số điện thoại
update employees 
set phone = 925007773
where phone is null;
select * from employees;
-- Đuổi việc nhân viên có mức lương thấp hơn 5 triệu
delete from employees where salary <5000000;
select * from employees;
