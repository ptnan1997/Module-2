create database quanlykhoahoc;
use quanlykhoahoc;
create table courses(
	course_id int primary key,
    course_name varchar(50),
    `description` varchar(255),
    price decimal(10,2) not null
);
create table teachers(
	teacher_id int primary key,
    teacher_name varchar(50) not null,
    email varchar(50) not null
);
create table students(
	student_id int primary key,
    student_name varchar(50) not null,
    email varchar(50) not null
);
create table enrollments(
	teacher_id int,
    student_id int,
    foreign key(teacher_id) references teachers(teacher_id),
    foreign key(student_id) references students(student_id),
    primary key(teacher_id,student_id),
    opening_date date not null
);
-- Thêm ràng buộc check cho giá khóa học >0 
alter table courses
add check (price > 0);
-- Lệnh xóa enrollments khi cần dùng
drop table enrollments;