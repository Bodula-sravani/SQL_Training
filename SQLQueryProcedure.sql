--creating a procedure
create procedure fetch_employees 
as select * from employees;

exec fetch_employees 1,2,'New York'

--insert
create procedure InsertEmployee @Id int, @Techname varchar(255)
as
insert into technologies values(@Id,@Techname);


--using update in procedure
create procedure updateEmployee @Id int, @Techname varchar(255)
as
update technologies set name = @Techname where id=@Id

--declaring temp varaiables and using them in procedure
create or alter procedure updateEmployee @Id int, @Techname varchar(255)
as declare @tempName varchar(255)
set @tempName = 'word'+@Techname
update technologies set name = @tempName where id=@Id

exec InsertEmployee 5,'Flutter'

exec updateEmployee 5,'CPP'

--begin

--declare @query varchar(255)
--set @query = 'select * from'+trim(@TableName)
--print(@query)
--execute sp_executesql @query
--end

create or alter procedure fetchdetails 
as select * from dbo.technologies;

--Giving default value to a parameter
create or alter procedure updateTechnologyName @techId int,@inputName varchar(255) = 'Basic programming'
as
update technologies set name = @inputName where id = @techId;

exec updateTechnologyName 5;
exec fetchdetails

select * from employees;
select * from technologies;

--procedure that gives output parameter(single value output) 
create or alter procedure fetchtechnologyByEmpId @EmpId int, @EmpName varchar(255) output
as
select @EmpName= name from dbo.technologies where 
id = (select technology_id from dbo.employees where id = @EmpId);

declare @TechName varchar(255);
exec fetchtechnologyByEmpId 1,@TechName output;
print(@TechName);

--when output is  multiple rows - it gives emp names separated by commas as as concatinated string
create or alter procedure fetchEmpNameByTechId @TechId int, @EmpNames varchar(255) output
as
(select @EmpNames= isnull(@EmpNames+',','')+cast(name as varchar(255)) from dbo.employees where technology_id = @TechId)

declare @EmpName varchar(255);
exec fetchEmpNameByTechId 1,@EmpName output;
print(@EmpName);



--using table to play with more coloumns and rows in stored procedure
--firstly create a custom data type which is a table with desired coloumns
--declare this data type and manipulate table insert and display value with in store procedure

--or else declare table it outside and insert and display values
create type EmpDetails as table (id int,Name varchar(255));

create or alter procedure fetchEmpDetailsByTechId @TechId int
as
declare @EmployeeDetails EmpDetails
insert into @EmployeeDetails select id,name from dbo.employees where technology_id = @TechId
select * from @EmployeeDetails

exec fetchEmpDetailsByTechId 1;


--calling one store procedure inside another

create or alter procedure insertIntoTechnology @Id int, @Name varchar(255)
as
insert into technologies values(@Id,@Name)

create or alter procedure callInsertProcedure @TechId int
as
declare @Techname varchar(255)
set @Techname = 'Python'
exec insertIntoTechnology @TechId,@Techname

exec callInsertProcedure 6

exec fetchdetails

--Try catch block 
create or alter procedure fetchTechnologies 
as
	begin try
		insert into technologies values (8,'python')
	end try
	begin catch
		declare @errorMessage varchar(255);
		set @errorMessage = 'Duplicate primary key value';
		print(@errorMessage);
	end catch

create or alter procedure fetchTechnologies 
as
	insert into technologies values (1,'python')

exec fetchTechnologies;


