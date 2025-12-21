create database quanlythuvien;
use quanlythuvien;
create table books(
	bookID int primary key,
    bookName varchar(50),
    author varchar(50),
    publicDate date
    );
create table readers(
	cccdReader int primary key,
    readerName varchar (50),
    readerAge int,
    dobReader date
    );
create table borrowings(
	bookID int,
    foreign key (bookID) references books(bookID),
    cccdReader int,
    foreign key (cccdReader) references readers(cccdReader),
    borrowDate date,
    returnDate date
);
/*
Dùng ALTER TABLE để:
Thêm ràng buộc NOT NULL cho ngày mượn
*/
alter table borrowings 
modify borrowDate date not null;