use session11;

delimiter $$
create procedure transfer_money (in sender_id int, in receiver_id int,in amount_money decimal(10,2))
begin
    declare sender_balance decimal(10,2);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            -- Có lỗi thì rollback
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Có lỗi xảy ra, giao dịch đã bị hủy';
        END;

    select balance into sender_balance
    from accounts where accountID = sender_id;
    if sender_balance < amount_money then rollback;
    else
        start transaction;
        -- Trừ tiền tài khoản người gửi
        update accounts
        set balance = balance - amount_money
        where accountID = sender_id;
        -- Cộng tiền tài khoản người nhận
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
    end if;
end $$
delimiter ;
drop procedure transfer_money;
-- Thực thi thủ tục
call transfer_money(4,5,5000000);