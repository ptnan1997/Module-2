create database quanlydonhang;
use quanlydonhang;
create table products(
	productID int primary key,
    productName varchar(50),
    stock int 
);
create table orders(
	orderID int primary key,
    productID int,
    quantity int,
    TotalAmount decimal(10,2)
);
create table orders_details(
	orderID int,
    productID int,
    foreign key (orderID) references orders(orderID),
    foreign key (productID) references products(productID),
    primary key(orderID,productID),
    price decimal(10,2)
);