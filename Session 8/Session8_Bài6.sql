use quanlydaotao;
select * from students;

delimiter $$
create procedure sp_classify_student (in avg_score double, out classify_student varchar (50))
    begin
        case
            when avg_score >= 8 then
                set classify_student = 'Giỏi';
            when avg_score >= 6.5 and avg_score < 8 then
                set classify_student = 'Khá';
            when avg_score >= 5 and avg_score <6.5 then
                set classify_student = 'Trung bình';
            when avg_score < 5 then
                set classify_student = 'Yếu';
        end case;
        select classify_student into classify_student;
    end $$
delimiter ;
drop procedure sp_classify_student;
call sp_classify_student(7.8,@classify_student);
select @classify_student;