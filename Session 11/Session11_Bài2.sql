use session11;


delimiter $$
create procedure Withdraw(in account_id int, in amount_in decimal(10,2))
begin
    declare MYbalance decimal(10,2);
    start transaction;
    select balance into MYbalance
    from accounts where accountId =account_id;
    if MYbalance<0 then rollback;
    else
        IF amount_in IS NULL THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'amount_in is NULL';
        END IF;
    update accounts
    set balance = (balance - amount_in)
    where accountID = account_id;

    insert into transactions(fromAccountID, toAccountID, amount, transactionDate)
    values (
               account_id,
               0,
               amount_in,
               now()
           );
        commit;
    end if;
end $$
delimiter ;
drop procedure Withdraw;
-- Thực thi thủ tục
call Withdraw(2,500000.00);

update accounts
set balance = 12500000.00
where accountId = 2;