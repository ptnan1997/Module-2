use employee_management;

-- Stored Procedure IncreaseSalary:
delimiter $$
create procedure IncreaseSalary (
    in emp_id_in int,
    in new_salary_in int,
    in reason_in varchar(50)
)
begin
    start transaction;
    if not exists (select employee_id
                   from employees
                   where employee_id = emp_id_in) then rollback;
    else
        update salaries
        set base_salary= new_salary_in
        where employee_id = emp_id_in;
        insert into salary_history (employee_id, old_salary, new_salary, change_date, reason)
        VALUES (
                   emp_id_in,
                null,
                   new_salary_in,
                now(),
                   reason_in
               );
        commit;
        end if;
end $$
delimiter ;

-- Stored Procedure DeleteEmployee
delimiter $$
create procedure DeleteEmployee (in emp_id_in int)
begin
    start transaction;
    if not exists (select employee_id
                   from employees
                   where employee_id = emp_id_in) then rollback;
    else
        DELETE FROM salaries
        WHERE employee_id = emp_id_in;


        DELETE FROM employees
        WHERE employee_id = emp_id_in;

        COMMIT;
        end if;
end $$
delimiter ;


call IncreaseSalary (6,13000,'Up Salary');

call DeleteEmployee (5);