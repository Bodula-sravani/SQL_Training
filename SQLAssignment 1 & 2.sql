Drop table Employee

create table Employee(
  EmpNo int primary key,
  EmpName varchar(255),
  Job varchar(255),
  Manager varchar(255),
  HireDate date,
  Salary float,
  Commission float,
  DeptNo int
);

insert into Employee values(8087, 'Ramesh', 'CLERK', 8789, '2022-08-09', 4500.00, NULL, 10)
insert into Employee values(8089, 'Rajesh', 'staff3', 8789, '2022-08-09', 5500.00, NULL, 30)
insert into Employee values(8094, 'Rakesh', 'staff2', 8789, '2022-08-09', 500.00, NULL, 10)
insert into Employee values(8091, 'Rafesh', 'staff', 8789, '2022-08-09', 4500.00, NULL, 30)
insert into Employee values(8092, 'Ram', 'manager', 8789, '2022-08-09', 500.00, NULL, 10)
insert into Employee values(8093, 'Ravih', 'head', 8789, '2022-08-09', 4500.00, NULL, 10)


--1.Display details of all the employees from Employee table.
select * from Employee

--2.Add a new record to Employee table.8088, 'Ramesh', 'CLERK', 8789, '2022-08-09', 4500.00, NULL, 10
insert into Employee values(8088, 'Ramesh', 'CLERK', 8789, '2022-08-09', 4500.00, NULL, 10)

--3. Count the number of records in Employee table
select Count(*) as No_Of_Records from Employee

--4.Search the details of those employees who work in deptno 30.
select * from Employee where DeptNo=30

--5.Sort the records in Employee table

select * from Employee order by EmpNo;

--6.Update the salary of the last inserted record to 500.

update Employee set Salary = 500 where EmpNo = (select top 1 EmpNo from Employee order by EmpNo desc);

--7.Delete the last inserted record.

delete from Employee where EmpNo = (select top 1 EmpNo from Employee order by EmpNo desc);


--SQL assignment 2

create table Products(
           product_code int primary key,
		   product_name varchar(255),
		   price float,
		   quantity_remaining int,
		   quantity_sold int
);

create table Sales(
           order_id int primary key,
		   order_date date,
           product_code int,
		   quantity_ordered int,
		   sale_price int
);

alter table Sales add foreign key(product_code) references Products(product_code);

alter table Sales drop constraint PK__Sales__465962291004AE29
alter table Sales drop column order_id

alter table Sales add order_id int identity primary key

-- takes name and quantity , checks if available and makes the sale accordingly
create or alter procedure make_sale @name varchar(255),@quantity int,@orderDate date
as
begin
	declare @count int,@pro_code int,@price float
	set @count = (select quantity_remaining from Products where product_name=@name);
	set @pro_code = (select product_code from Products where product_name=@name)
	set @price  = (select price from Products where product_name=@name)
	if @count>=@quantity
		begin
		update Products set quantity_sold +=@quantity , quantity_remaining-=@quantity where product_name = @name
		insert into Sales values(@orderDate,@pro_code,@quantity,@price)
		end
	else
		begin
		print('Product quantity is not avaibale')
		end
end



-- for every IPhone 13 pro max sale, checks if available and makes the sale accordingly
create or alter procedure iPhone13ProMax_sale @date date
as
exec make_sale 'IPhone 13 pro max',1,@date

insert into Products values(1234,'IPhone 13 pro max',150000,10,10)
insert into Products values(1235,'IPhone 13 ',100000,10,8)
insert into Products values(1236,'one plus',50000,3,10)
insert into Products values(1237,'Dell',150000,10,10)
insert into Products values(1238,'Lenevo',60000,0,10)

exec iPhone13ProMax_sale '2023-02-01';

select * from Products
select * from Sales

exec make_sale 'Dell',3,'2023-06-21'