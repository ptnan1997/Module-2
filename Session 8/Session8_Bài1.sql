use quanlysinhvien;
drop procedure sp_get_all_students;
delimiter $$
create procedure sp_get_all_students()
    begin
        select * from students;
    end
$$ delimiter ;

 call sp_get_all_students();