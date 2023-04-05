--user defined functions

create or alter function fetchCountofEmpinLocation (@Location varchar(255)) returns int 
as
	begin
		return (select count(*) from employees where location=@Location)
	end

print dbo.fetchCountofEmpinLocation('New York')



--using table return type
create or alter function fetchEmpTableinLocation (@Location varchar(255)) returns table
as
return (select id , name from employees where location=@Location)

select * from dbo.fetchEmpTableinLocation('New York')

--using table type by giving desire no of coloum names
create or alter function fetchEmpTabletypeinLocation (@Location varchar(255)) returns 
@tableType table(empId int , empName varchar(255),empLocation varchar(255),salary int)
as
begin
   declare @tempLocation varchar(255) = ' City'
   declare @tempSalary float = 0.1
   insert into @tableType select id , name,concat(location,@tempLocation),salary+salary*@tempSalary 
   from employees where location=@Location
   return;
end

--calling udf inside a procedure
create or alter procedure callfetchEmpTabletypeinLocation @location varchar(255)
as
	begin
		select * from dbo.fetchEmpTabletypeinLocation(@location)
	end

exec callfetchEmpTabletypeinLocation 'New York'