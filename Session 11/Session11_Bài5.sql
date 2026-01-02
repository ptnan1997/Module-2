use session11;

delimiter $$
create procedure Money_transfer_with_balance_check (in sender_id int, in receiver_id int, amount_money decimal(10,2))
begin
    declare sender_balance decimal(10,2);
    start transaction;
    select balance into sender_balance
    from accounts
    where accountID = sender_id;
    if sender_balance >= 1000000 then
        -- Trừ tiền của tài khoản người gửi
        update accounts
            set balance = balance - amount_money
        where accountID = sender_id;
        -- Cộng tiền vào tài khoản người nhận
        update accounts
            set balance = balance + amount_money
        where accountID = receiver_id;
        -- Ghi lịch sử giao dịch vào bảng transaction
        insert into transactions (fromAccountID, toAccountID, amount, transactionDate)
        VALUES (
                   sender_id,
                   receiver_id,
                   amount_money,
                now()
               );
        commit;
    else
        rollback;
    end if;
end $$
delimiter ;
drop procedure Money_transfer_with_balance_check;
-- Thực hiện thủ tục

call Money_transfer_with_balance_check (6,7,500000.00);


-- Thêm thông tin tài khoản 6 và 7

insert into accounts (accountID, balance)
VALUES (6,40000000.00),
       (7,10000000.00);