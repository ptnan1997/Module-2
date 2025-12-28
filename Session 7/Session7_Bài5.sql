use thongtinsinhvien;
alter table employees
add cmnd int not null;
select * from employees;

create view v_employee_public
as select
       emp_id,
       full_name,
       department
    from employees;