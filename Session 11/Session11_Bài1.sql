create database session11;
use session11;
create table accounts
(
    accountID int primary key auto_increment,
    balance   decimal(10, 2)
    check(balance >0)
);
create table transactions
(
    transactionID   int primary key auto_increment,
    fromAccountID   int not null,
    toAccountID     int not null,
    amount          decimal(10, 2),
    transactionDate datetime
);
drop table transactions;
drop  table accounts;
INSERT INTO accounts (balance)
VALUES (5000000.00),
       (12500000.50),
       (850000.75),
       (32000000.00),
       (7800000.25);

delimiter $$
create procedure send_money(in account_id int, in amount_in int)
    begin
        start transaction;
        update accounts
            set balance = balance + amount_in
        where accountID = account_id;
        insert into transactions
            (fromAccountID, toAccountID, amount, transactionDate)
        values (
                0,
                account_id,
                amount_in,
                now()
               );
        commit;

    end $$
delimiter ;
drop procedure send_money;

call send_money (1,1000000);