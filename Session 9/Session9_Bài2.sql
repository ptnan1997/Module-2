use session9;
explain analyze
(select PhoneNumber
 from customers);
-- Tạo Single-column Index
create index idx_phone
    on Customers (PhoneNumber);

alter table customers
    drop index idx_phone;

-- Trước khi dùng index tốc độ truy vấn là
-- -> Covering index scan on customers using PhoneNumber  (cost=0.75 rows=5) (actual time=0.0372..0.0436 rows=5 loops=1)
-- Sau khi dùng index tốc độ truy vấn là
-- -> Covering index scan on customers using PhoneNumber  (cost=0.75 rows=5) (actual time=0.0194..0.0241 rows=5 loops=1)

explain analyze
(select FullName
 from customers
 where PhoneNumber = 0922334455);
/*
-> Filter: (customers.PhoneNumber = 922334455)  (cost=0.75 rows=1) (actual time=0.0224..0.0259 rows=1 loops=1)
-> Table scan on customers  (cost=0.75 rows=5) (actual time=0.0181..0.0225 rows=5 loops=1)
 */

-- Tạo Composite Index
create index idx_idBrand_alary
    on Employees (BranchID, Salary);


-- Truy vấn nhân viên theo chi nhánh và mức lương
delimiter $$
create procedure call_emp_by_branch_and_salary(in branchName varchar(100), salary double, out Full_name varchar(100))
begin
    select e.FullName
    into Full_name
    from employees e
             join branch b on e.BranchID = b.BranchID
    where b.BranchName = branchName
      and e.salary = salary;
end $$
delimiter ;
drop procedure call_emp_by_branch_and_salary;

explain analyze (select @Full_name);

-- Trước khi có index
-- -> Rows fetched before execution  (cost=0..0 rows=1) (actual time=100e-6..100e-6 rows=1 loops=1)
-- Sau khi có index
-- -> Rows fetched before execution  (cost=0..0 rows=1) (actual time=100e-6..200e-6 rows=1 loops=1)

-- Tạo Unique Index trên 2 cột accountID và CustomerID của bảng Accounts

create unique index idx_AccID_CustomerID
    on Accounts (AccountID, CustomerID);
-- Viết câu lệnh hiển thị tất cả index đã được tạo trên 3 bảng Customers Employees và Accounts
show index from Customers;

show index from Employees;

show index from Accounts;

-- Xóa index trên bảng Customers
DROP INDEX idx_phone ON Customers;

-- Xóa index trên bảng Employees
DROP INDEX idx_idBrand_alary ON Employees; -- ( không thể xóa được vì có foreign key )

-- Xóa index trên bảng Accounts
DROP INDEX idx_AccID_CustomerID ON Accounts;