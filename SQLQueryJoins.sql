--joins


select * from Employee;

select * from StudentDetails;
select * from Department;

select s.Name,d.DeptName,d.HOD from StudentDetails s
inner join Department d
on s.DeptId=d.DeptId;

select s.Name,d.DeptName,d.HOD from StudentDetails s
left join Department d
on s.DeptId=d.DeptId;

select s.Name,d.DeptName,d.HOD from StudentDetails s
right join Department d
on s.DeptId=d.DeptId;

select s.Name,d.DeptName,d.HOD from StudentDetails s
full outer join Department d
on s.DeptId=d.DeptId;

select d.DeptName,d.HOD from Department d,Department d2
where d.DeptId = d2.DeptId;


--trying to insert a department id which is not in dept table - throws error 
--insert into dbo.StudentDetails values(5,'sita',22,'2001-01-23','sita@gmail.com',23123,108);

