create database ss3_bt1;
use ss3_bt1;
/* Viết lệnh CREATE TABLE cho:
Bảng classes
Bảng students
*/
create table classes(
	classId int primary key,
    className varchar(50)
    );
create table student(
	studentId int primary key,
    studentName varchar(50),
    classId int not null,
    foreign key(classId) references classes(classId)
    );
   
    