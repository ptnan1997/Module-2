use session11;

delimiter $$
create procedure add_money (in account_id int, in amount_in decimal(10,2))
    begin
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                -- Có lỗi thì rollback
                ROLLBACK;
                SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Có lỗi xảy ra, giao dịch đã bị hủy';
            END;
        start transaction;
        update accounts
        set balance = balance + amount_in
        where accountID = account_id;
        insert into transactions (fromAccountID, toAccountID, amount, transactionDate)
        values (
                   0,
                   account_id,
                   amount_in,
                now()
               );
        commit;
    end $$
delimiter ;

-- Thực thi thủ tục
call add_money (2,500000);