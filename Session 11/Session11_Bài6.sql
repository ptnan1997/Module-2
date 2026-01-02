use session11;

delimiter $$
create procedure transfer_and_update_history (in sender_id int, in receiver_id int,in amount_in decimal(10,2))
begin
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            -- Có lỗi thì rollback
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Có lỗi xảy ra, giao dịch đã bị hủy';
        END;
    start transaction;
    -- Trừ tiền vào tài khoản người gửi
    update accounts
        set balance = balance - amount_in
    where accountID = sender_id;
    -- Cộng tiền vào tài khoản người nhận
    update accounts
        set balance = balance + amount_in
    where accountID = receiver_id;
    -- Thêm một bản ghi vào bảng transactions
    insert into transactions (fromAccountID, toAccountID, amount, transactionDate)
    VALUES (
               sender_id,
               receiver_id,
               amount_in,
            now()
           );
    commit;
end $$
delimiter ;
drop procedure transfer_and_update_history;
-- Thực thi thủ tục

 call transfer_and_update_history (6,4,9000000);