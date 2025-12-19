USE CompanyDB;

SELECT * FROM (employees);

ALTER TABLE employees
ADD COLUMN Department VARCHAR(50);

INSERT INTO employees (EmployeeID,FirstName,LastName,HireDate,Salary,Department)
VALUES (1,'Phan Trương Ngọc','Ân',20221125,4000,'Kế toán'),
(2,'Đào Hồng','Sơn',20200924,6000,'Hành chính'),
(3,'Phan Thị','Nhung',20221121,3500,'Nhân sự'),
(4,'Võ Thị Thu','Trang',20221121,4000,'Chăm sóc khách hàng'),
(5,'Đoàn Ngọc','Hải',20221121,4200,'Kinh doanh'),
(6,'Dương Đức','Thịnh',20221121,4000,'Kiểm toán');

SELECT * FROM employees
WHERE Department (Department = 'Kinh doanh');
