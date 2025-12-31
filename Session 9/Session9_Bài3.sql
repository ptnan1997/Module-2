use session9;

-- Viết Stored Procedure

-- GetCustomerByPhone
delimiter $$
    create procedure GetCustomerByPhone (in phone_number int)
        begin
            select FullName,
                   DateOfBirth,
                   Address
            from customers
            where PhoneNumber = phone_number;
        end $$
delimiter ;
drop procedure GetCustomerByPhone;
-- GetTotalBalance
delimiter $$
    create procedure GetTotalBalance (in Customer_ID int, out totalBalance double)
        begin
            select sum(Balance) into totalBalance
            from accounts
            where CustomerID = Customer_ID;
        end $$
delimiter ;

-- IncreaseEmployeeSalary
delimiter $$
    create procedure IncreaseEmployeeSalary (inout current_salary double,in employee_ID int)
        begin
            set current_salary =current_salary*1.1;
            Update Employees
            set Salary = current_salary
            where EmployeeID = employee_ID;
        end $$
delimiter ;
drop procedure IncreaseEmployeeSalary;

-- Thực thi các procedure

call GetCustomerByPhone(0945124578);

call GetTotalBalance (1,@totalBalance);
select @totalBalance;

select salary into @session
from employees
where EmployeeID=3;
select @session;
call IncreaseEmployeeSalary (@session,3);

-- Xóa các thủ tục nếu nó tồn tại

drop procedure if exists IncreaseEmployeeSalary;
drop procedure if exists GetTotalBalance;
drop procedure if exists GetCustomerByPhone;
