use thongtinsinhvien;
-- Phân loại mức thu nhập của nhân viên dựa trên thông số đầu vào là tên và số lương
delimiter $$
create procedure sp_check_employee_income(in emp_name varchar(50),salary double)
    begin
        declare employee_name varchar (50);
        declare employee_income varchar (50);
        set employee_name = emp_name;
        if salary >= 15000000 then
            set employee_income = 'Thu nhập cao';
        elseif salary>=8000000 and  salary < 15000000 then
            set employee_income = 'Thu nhập trung bình';
        elseif salary < 8000000 then
            set employee_income = 'Thu nhập thấp';
        end if;
        select employee_name,employee_income;
    end $$
delimiter ;

call sp_check_employee_income ('Bui Van G', 15500000);