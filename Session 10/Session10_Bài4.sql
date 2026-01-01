use thongtinsinhvien;

create table salary_logs(
    salary_log_id int primary key auto_increment,
    empId int,
    foreign key (empId) references employees (emp_id),
    old_salary int,
    new_salary int,
    lastUpdate datetime
);
drop table salary_logs;
delimiter $$
    create trigger trg_after_update_salary
    after update on employees  for each row
    begin
        if OLD.salary = NEW.salary THEN
            signal sqlstate '45000'
            set message_text = 'Số lương mới bằng số lương cũ';
        else
            insert into salary_logs
            (empId, old_salary, new_salary, lastUpdate)
            values (
                    new.emp_id,
                    old.salary,
                    new.salary,
                    now()
                   );
        end if;
    end $$

delimiter ;
drop trigger trg_after_update_salary;

update employees
set salary = 20000000
where emp_id = 6;


select *from salary_logs;