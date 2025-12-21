create database quanlytaikhoan;
use quanlytaikhoan;
create table `users`(
	`userID` int primary key, 
    `userName` varchar(50),
    `email` varchar(50),
    unique(userName,email),
    `password` int not null,
    `status` varchar(10) default ('active')
);
alter table `users`
add check (`status`= 'active');
drop table `users`;