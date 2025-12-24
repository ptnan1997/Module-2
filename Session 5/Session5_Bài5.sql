create database quanlydaotao;
use quanlydaotao;
-- Tạo bảng scores
create table scores (
    student_id int,
    subject varchar (50),
    score decimal (10,2),
    foreign key (student_id) references students (student_id),
    primary key(student_id, subject)
);
select *from students;

create table students(
    student_id int primary key,
    student_name varchar (10)
);
INSERT INTO students VALUES
                         (1, 'Nguyen Van A'),
                         (2, 'Tran Thi B'),
                         (3, 'Le Van C'),
                         (4, 'Pham Thi D'),
                         (5, 'Hoang Van E'),
                         (6, 'Do Thi F'),
                         (7, 'Bui Van G'),
                         (8, 'Dang Thi H');
INSERT INTO scores VALUES
                       (1, 'Math', 8.5),
                       (1, 'Physics', 7.5),
                       (1, 'English', 7.0),

                       (2, 'Math', 6.0),
                       (2, 'Physics', 6.5),
                       (2, 'English', 6.0),

                       (3, 'Math', 9.0),
                       (3, 'Physics', 8.5),
                       (3, 'English', 8.0),

                       (4, 'Math', 7.0),
                       (4, 'Physics', 7.5),
                       (4, 'English', 7.0),

                       (5, 'Math', 5.5),
                       (5, 'Physics', 5.0),
                       (5, 'English', 5.5);

-- 1. Điểm trung bình của mỗi sinh viên
select
    s.student_id AS 'Mã sinh viên',
    s.student_name AS 'Tên sinh viên',
    ceiling(avg(sc.score*10))/10 AS 'Điểm trung bình'
from students s
join scores sc
on s.student_id = sc.student_id
group by s.student_id, s.student_name;
-- 2. Truy vấn sinh viên có điểm trung bình lớn hơn hoặc bằng 7
select
    s.student_id AS 'Mã sinh viên',
    s.student_name AS 'Tên sinh viên',
    ceiling(avg(sc.score*10))/10 AS 'Điểm trung bình'
from students s
         join scores sc
on s.student_id = sc.student_id
group by s.student_id, s.student_name
having ceiling(avg(sc.score*10))/10 >= 7;
-- 3. Truy vấn sinh viên có điểm trung bình cao nhất trong toàn bộ danh sách
select
    s.student_id AS 'Mã sinh viên',
    s.student_name AS 'Tên sinh viên',
    ceiling(avg(sc.score*10))/10 AS 'Điểm trung bình'
from students s
         join scores sc
              on s.student_id = sc.student_id
group by s.student_id, s.student_name
HAVING AVG(sc.score) = (SELECT MAX(avg_score)
                        FROM (SELECT AVG(score) AS avg_score
                              FROM scores
                              GROUP BY student_id) t);
-- 4. Truy vấn sinh viên có điểm trung bình cao hơn điểm trung bình chung cúa tất cả sinh viên
select
    s.student_id AS 'Mã sinh viên',
    s.student_name AS 'Tên sinh viên',
    ceiling(avg(sc.score*10))/10 AS 'Điểm trung bình'
from students s
         join scores sc
              on s.student_id = sc.student_id
group by s.student_id, s.student_name
HAVING AVG(sc.score) > (
    SELECT AVG(avg_score)
    FROM (
             SELECT AVG(score) AS avg_score
             FROM scores
             GROUP BY student_id
         ) t-- đặt tên alias cho bảng phụ
);