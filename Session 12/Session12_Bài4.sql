USE employee_management;

-- Tạo Trigger BEFORE INSERT:
delimiter $$
create trigger Before_insert
before insert on employees for each row
    begin
         if new.email not like '%@company.com' then
          set new.email = concat(new.email,'@company.com');
         end if;
    end $$
delimiter ;


-- Tạo Trigger AFTER INSERT:
delimiter $$
create trigger After_Insert
after insert on employees for each row
    begin
        insert into salaries (employee_id, base_salary, bonus, last_updated)
            VALUES (
                    new.employee_id,
                    10000.00,
                    0,
                    now()
                   );
    end $$
delimiter ;

insert into employees (name, email, phone, hire_date, department_id)
VALUES (
        'Nguyễn Văn Toàn',
        'nguyenvantoan',
        0906424323,
        now(),
        1
       );


-- Trigger Before DELETE:
delimiter $$
create trigger Before_Delete
Before Delete on employees for each row
    begin
        insert into salary_history (employee_id, old_salary, new_salary, reason)
        VALUES (
                old.employee_id,
                (select base_salary
                 from salaries
                 where employee_id = old.employee_id),
                NULL,
                'Employee left the company'
               );
    end $$
delimiter ;
drop trigger Before_Delete;
delete from employees where employee_id = 1;
-- Trigger BEFORE UPDATE:
delimiter $$
create trigger Before_Update
before update on attendance for each row
    begin
        if new.check_out_time is not null then
            set new.total_hours = round(timestampdiff(
                                           minute,
                                           new.check_in_time,
                                           new.check_out_time
                                           )/60,2);
        end if;
    end $$
delimiter ;
drop trigger Before_Update;

update attendance
set check_out_time = now()
where employee_id = 1;
