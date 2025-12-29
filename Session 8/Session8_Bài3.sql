use thongtinsinhvien;
select * from employees;

-- Tạo thủ tục

delimiter $$
    create procedure sp_get_avg_salary ()
        begin
            declare avg_salary double;
            set avg_salary = (
                select avg(salary)
                from employees
                );
            select avg_salary;
        end $$
delimiter ;

-- Thực thi thủ tục
call sp_get_avg_salary();