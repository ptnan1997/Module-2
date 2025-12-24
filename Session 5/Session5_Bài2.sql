use thongtinsinhvien;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);
-- Nhập bảng ghi vào bảng employees
INSERT INTO employees (emp_id, full_name, department, salary) VALUES
-- IT (lương cao)
(1,'Nguyen Van A','IT',15000000),
(2,'Tran Van B','IT',18000000),
(3,'Le Van C','IT',20000000),
(4,'Pham Van D','IT',17000000),
(5,'Hoang Van E','IT',16000000),
(6,'Do Van F','IT',19000000),
(7,'Bui Van G','IT',15500000),
(8,'Dang Van H','IT',16500000),
(9,'Ngo Van I','IT',17500000),
(10,'Ly Van K','IT',18500000),
(11,'Vu Van L','IT',16000000),
(12,'Trinh Van M','IT',17000000),
(13,'Cao Van N','IT',18000000),
(14,'Phan Van O','IT',19500000),
(15,'Mai Van P','IT',15000000),

-- Finance
(16,'Nguyen Thi A','Finance',14000000),
(17,'Tran Thi B','Finance',13500000),
(18,'Le Thi C','Finance',14500000),
(19,'Pham Thi D','Finance',15000000),
(20,'Hoang Thi E','Finance',15500000),
(21,'Do Thi F','Finance',16000000),
(22,'Bui Thi G','Finance',13800000),
(23,'Dang Thi H','Finance',14200000),
(24,'Ngo Thi I','Finance',14800000),
(25,'Ly Thi K','Finance',15200000),
(26,'Vu Thi L','Finance',14000000),
(27,'Trinh Thi M','Finance',14600000),
(28,'Cao Thi N','Finance',15000000),
(29,'Phan Thi O','Finance',15500000),
(30,'Mai Thi P','Finance',16000000),

-- Sales
(31,'Nguyen Van Q','Sales',9000000),
(32,'Tran Van R','Sales',9500000),
(33,'Le Van S','Sales',10000000),
(34,'Pham Van T','Sales',11000000),
(35,'Hoang Van U','Sales',10500000),
(36,'Do Van V','Sales',9800000),
(37,'Bui Van W','Sales',10200000),
(38,'Dang Van X','Sales',10800000),
(39,'Ngo Van Y','Sales',9700000),
(40,'Ly Van Z','Sales',9900000),
(41,'Vu Van AA','Sales',10300000),
(42,'Trinh Van AB','Sales',10400000),
(43,'Cao Van AC','Sales',10100000),
(44,'Phan Van AD','Sales',9500000),
(45,'Mai Van AE','Sales',9200000),

-- Marketing
(46,'Nguyen Thi Q','Marketing',10000000),
(47,'Tran Thi R','Marketing',10500000),
(48,'Le Thi S','Marketing',11000000),
(49,'Pham Thi T','Marketing',11500000),
(50,'Hoang Thi U','Marketing',12000000),
(51,'Do Thi V','Marketing',9800000),
(52,'Bui Thi W','Marketing',10200000),
(53,'Dang Thi X','Marketing',10800000),
(54,'Ngo Thi Y','Marketing',11200000),
(55,'Ly Thi Z','Marketing',11800000),
(56,'Vu Thi AA','Marketing',10000000),
(57,'Trinh Thi AB','Marketing',10500000),
(58,'Cao Thi AC','Marketing',11000000),
(59,'Phan Thi AD','Marketing',11500000),
(60,'Mai Thi AE','Marketing',12000000),

-- HR (lương thấp hơn)
(61,'Nguyen Van AF','HR',8000000),
(62,'Tran Van AG','HR',8200000),
(63,'Le Van AH','HR',8500000),
(64,'Pham Van AI','HR',9000000),
(65,'Hoang Van AJ','HR',8800000),
(66,'Do Van AK','HR',8300000),
(67,'Bui Van AL','HR',8600000),
(68,'Dang Van AM','HR',8900000),
(69,'Ngo Van AN','HR',8700000),
(70,'Ly Van AO','HR',8400000),
(71,'Vu Van AP','HR',8200000),
(72,'Trinh Van AQ','HR',8600000),
(73,'Cao Van AR','HR',9000000),
(74,'Phan Van AS','HR',8800000),
(75,'Mai Van AT','HR',8500000),

-- Operations
(76,'Nguyen Thi AF','Operations',11000000),
(77,'Tran Thi AG','Operations',11500000),
(78,'Le Thi AH','Operations',12000000),
(79,'Pham Thi AI','Operations',12500000),
(80,'Hoang Thi AJ','Operations',13000000),
(81,'Do Thi AK','Operations',11800000),
(82,'Bui Thi AL','Operations',12200000),
(83,'Dang Thi AM','Operations',12800000),
(84,'Ngo Thi AN','Operations',13200000),
(85,'Ly Thi AO','Operations',13500000),
(86,'Vu Thi AP','Operations',11000000),
(87,'Trinh Thi AQ','Operations',11500000),
(88,'Cao Thi AR','Operations',12000000),
(89,'Phan Thi AS','Operations',12500000),
(90,'Mai Thi AT','Operations',13000000),

-- thêm 10 nhân viên rải đều
(91,'Extra A','IT',17000000),
(92,'Extra B','Finance',15000000),
(93,'Extra C','Sales',9800000),
(94,'Extra D','Marketing',11200000),
(95,'Extra E','HR',8700000),
(96,'Extra F','Operations',12500000),
(97,'Extra G','IT',18500000),
(98,'Extra H','Finance',16000000),
(99,'Extra I','Sales',10400000),
(100,'Extra J','Marketing',11800000);

-- Thông kê mỗi phòng ban có bao nhiêu nhân viên
SELECT
    department AS 'Phòng ban',
    count(emp_id) AS 'Số lượng nhân viên'
FROM employees
group by department;
-- Tính mức lương trung bình của từng phòng ban
SELECT
    department AS 'Phòng ban',
    AVG(salary) AS 'Mức lương trung bình'
FROM employees
GROUP BY department;
-- Chỉ hiển thị các phòng ban có số lượng nhân viên lớn hơn 3
SELECT
    department AS 'Phòng ban',
    count(emp_id) AS 'Số lượng nhân viên'
FROM employees
GROUP BY department
HAVING COUNT(emp_id) >3;
-- Chỉ hiển thị các phòng ban có lương trung bình lớn hơn 12 triệu
SELECT
    department AS 'Phòng ban',
    AVG(salary) AS 'Mức lương trung bình'
FROM employees
GROUP BY department
HAVING AVG(salary) >12000000;