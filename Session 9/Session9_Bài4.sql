USE chinook;

-- Tạo view

create view View_Album_Artist
as
    select
        al.AlbumId,
        al.Title,
        ar.Name
    from album al
    join artist ar on al.ArtistId = ar.ArtistId;

create view View_Customer_Spending
as
    select
        c.customerId,c.FirstName,c.LastName,c.Email,
        iv.total
    from customer c
    join invoice iv on c.CustomerId = iv.CustomerId;

create index idx_Employee_LastName
on Employee (LastName);



explain analyze (select EmployeeId
                 from Employee
                 where LastName like 'King');
-- -> Filter: (employee.LastName like 'King')
 -- (cost=0.46 rows=1) (actual time=0.0147..0.0171 rows=1 loops=1)
-- -> Covering index range scan on Employee (LastName = 'King')
--  (cost=0.46 rows=1) (actual time=0.0126..0.015 rows=1 loops=1)

-- Tạo Stored Procedure

delimiter $$
create procedure GetTracksByGenre (in genre_id int)
begin
    select t.TrackId,t.Name, al.Title, ar.Name
    from track t
    join album al on t.AlbumId = al.AlbumId
    join artist ar on al.ArtistId = ar.ArtistId
    where GenreId = genre_id;
end $$
delimiter ;

delimiter $$
    create procedure GetTrackCountByAlbum (in p_AlbumId int)
        begin
            select count(trackid)
            from track
            where AlbumId = p_AlbumId;
        end $$
delimiter ;

-- Thực thi
call GetTracksByGenre (3);

call GetTrackCountByAlbum(7);

-- Xóa
drop view View_Album_Artist;
drop view View_Customer_Spending;

drop index idx_Employee_LastName on Employee;

drop procedure GetTracksByGenre;
drop procedure GetTrackCountByAlbum;