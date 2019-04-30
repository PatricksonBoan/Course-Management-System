Create procedure dropAClass
@sid int,
@oid int
AS
delete from Enrolled
Where sid=@sid and oid=@oid;

Create procedure dropOffers
@oid int
AS
while((select count(oid) from Enrolled where oid=@oid)>=1)
begin
delete from Enrolled
Where oid=@oid;
end
begin 
delete from offered 
where oid=@oid;
end


Create procedure getUserInfor
@id int,
@user varchar(10)
AS
if (@user='student')
begin
 Select s.fname, s.mname, s.lname, s.major, s.level, s.byear, sc.username, sc.password
 from student s, StudentCredential sc
 where s.sid=sc.sid and s.sid=@id
end
if (@user='faculty')
begin
 Select f.fname, f.mname, f.lname, f.department, fc.username, fc.password
 from Faculty f, FacultyCredential fc
 where f.fid=fc.fid and f.fid=@id
end

Create procedure UpdateUserInfor
@id int,
@fname varchar(100),
@mname varchar(100),
@lname varchar(100),
@major varchar(100),
@level varchar(100),
@byear int
AS 
UPDATE Student
SET fname=@fname, mname=@mname, lname=@lname, major=@major, level=@level, byear=@byear
WHERE sid=@id;

Create procedure UpdateUserPassword
@id int,
@password varchar(100)
AS
UPDATE StudentCredential
SET password=@password
Where sid=@id;
