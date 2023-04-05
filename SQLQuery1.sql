INSERT into [dbo].[StudentDetails] values (1,'Sravani','CSBS',22,'2001-07-21','sravanibodula@gmail.com');
INSERT into [dbo].[StudentDetails] values (2,'Sravs','CSE',21,'2001-01-16','sravani@gmail.com');
INSERT into [dbo].[StudentDetails] values (3,'avani','IT',22,'2001-03-21','bodula@gmail.com');
INSERT into [dbo].[StudentDetails] values (3,'Latha','IT',22,'2001-03-21 10:37:21','bodulalatha@gmail.com');  --throws an error duplicate id(3)


select * from dbo.StudentDetails;

DELETE FROM dbo.StudentDetails where Name = 'avani';

--Adding primary key to existing column
ALTER TABLE dbo.StudentDetails ADD PRIMARY KEY (Id);

--Adding new coloumn
ALTER TABLE dbo.StudentDetails ADD Aadhar int NULL;

ALTER TABLE dbo.StudentDetails ADD Aadhar int NULL;
ALTER TABLE dbo.StudentDetails ADD  DeptId int;

--Drop colum
ALTER TABLE dbo.StudentDetails DROP Column Dept;

--update column values
UPDATE dbo.StudentDetails SET DeptId = 101 where id = 1;
UPDATE dbo.StudentDetails SET DeptId = 102 where id = 2;
UPDATE dbo.StudentDetails SET DeptId = 103 where id = 3;

--setting foreign key
alter table dbo.StudentDetails add constraint fk_name foreign key (DeptId) references dbo.Department(DeptId);
--Cannot add dept id in studentDetails which is not present in deparment ex:108 throws an error since foreign key
insert into dbo.StudentDetails values(4,'ram',21,'2001-07-21','rm@gmail.com',2345,107);
--like operator to manipulate strings
update dbo.StudentDetails set Age=20 where Name like 'Srav%';

--Creating table
CREATE TABLE dbo.Department(DeptId int PRIMARY KEY,DeptName nchar(20),HOD nchar(20));

INSERT into [dbo].[Department] values (101,'CSE','uma');
INSERT into [dbo].[Department] values (102,'IT','sriram');
INSERT into [dbo].[Department] values (103,'CSBS','sriram');
INSERT into [dbo].[Department] values (104,'ECE','uma');
INSERT into [dbo].[Department] values (105,'EEE','ram');
INSERT into [dbo].[Department] values (106,'MECH','sita');
INSERT into [dbo].[Department] values (107,'CIVIL','abcd');

select * from dbo.Department;

--Adding unique constraint 
ALTER TABLE dbo.Department ADD UNIQUE(DeptName);

--cretaing table
CREATE TABLE dbo.Employee(EmpId int PRIMARY KEY identity,EmpName nchar(20),DOB datetime,deptName nchar(20),Technology nchar(30),BaseLocation nchar(20));

insert into dbo.Employee values('sravs','2001-03-21 10:37:21','banking','csharp','chennai');
insert into dbo.Employee values('sravni','2001-04-21 10:37:21','IT','c','HYD');
insert into dbo.Employee values('srav','2001-03-20 10:37:21','Accounting','python','BNglr');
insert into dbo.Employee values('sr','2001-03-21 10:37:21','Retail','cpp','chennai',25000);
insert into dbo.Employee values('sra','2001-04-21 10:37:21','SDE','java','HYD',13999);
insert into dbo.Employee values('sravani','2001-03-20 10:37:21','Testing','python','BNglr',34000);
alter table dbo.Employee add Salary float;
update dbo.Employee set Salary = 20000 where EmpId=1;
update dbo.Employee set Salary = 40000 where EmpId=2;
update dbo.Employee set Salary = 10000 where EmpId=3;
select * from dbo.Employee;
select * from dbo.Employee where Salary>20000;

select MAX(Salary) from dbo.Employee where EmpId between 2 and 4;

select avg(Salary) from dbo.Employee;
select sum(Salary) from dbo.Employee;

select avg(Salary) from dbo.Employee where Technology='python';

select count(Salary) from dbo.Employee where Technology='python';

select distinct Technology,BaseLocation from dbo.Employee;


--composite key
CREATE TABLE dbo.Employee1(EmpId int PRIMARY KEY identity,EmpName nchar(20),DOB datetime,deptName nchar(20),Technology nchar(30),BaseLocation nchar(20));
insert into dbo.Employee1 values('sr','2001-03-21 10:37:21','Retail','cpp','chennai');
insert into dbo.Employee1 values('sra','2001-04-21 10:37:21','SDE','java','HYD');
insert into dbo.Employee1 values('sravani','2001-03-20 10:37:21','Testing','python','BNglr');
Alter table dbo.Employee1 drop constraint PK__Employee__AF2DBB99110945D2;
Alter table dbo.Employee1 alter column EmpName nchar(20) not null;
Alter table dbo.Employee1 alter column Technology nchar(20) not null;
Alter table dbo.Employee1 Add constraint comp_key primary key(EmpName,Technology);
insert into dbo.Employee1 values('sravani','2001-03-20 10:37:21','Testing','c','BNglr');

--check constraint

Alter table Employee1 add age int check(age>=21);
insert into dbo.Employee1 values('sravs','2001-03-20 10:37:21','Testing','c','BNglr',21);




select * from Employee1 where(Technology='python' or BaseLocation='BNglr');
select * from Employee1 where(not Technology='python');
select * from Employee1 where(Technology='python' and not BaseLocation='chennai');

select * from Employee1 order by Technology desc;

select BaseLocation,count(*) from Employee1 group by BaseLocation order by count(*);
select top 3 * from Employee1;
select * from dbo.Employee1;


alter table dbo.Employee1 add Salary float;
update dbo.Employee1 set Salary = 20000 where EmpId=1;
update dbo.Employee1 set Salary = 40000 where EmpId=2;
update dbo.Employee1 set Salary = 10000 where EmpId=3;
Drop table Employee1;


CREATE TABLE dbo.Employee1(EmpId int PRIMARY KEY identity,EmpName nchar(20),DOB datetime,age int,deptName nchar(20),Salary int,Technology nchar(30),BaseLocation nchar(20));

INSERT INTO Employee1(EmpName, DOB,deptName,Technology, BaseLocation, Salary)
VALUES 
    ('John Smith', '1985-02-14', 'Marketing', 'SEO', 'New York', 75000),
    ('Mary Johnson', '1990-06-22', 'Human Resources', 'HRIS', 'Los Angeles', 65000),
    ('David Lee', '1988-09-10', 'Engineering', 'Java', 'San Francisco', 90000),
    ('Jennifer Kim', '1995-01-05', 'Product Management', 'Agile', 'Seattle', 80000);
INSERT INTO Employee1(EmpName, DOB,deptName,Technology, BaseLocation, Salary)
VALUES 
    ('Sarah Lee', '1992-03-18', 'Engineering', 'Python', 'San Francisco', 95000),
    ('Robert Johnson', '1986-12-01', 'Marketing', 'Social Media', 'Los Angeles', 70000),
    ('Megan Kim', '1991-07-11', 'Product Management', 'Data Analytics', 'Seattle', 85000),
    ('Michael Chen', '1987-09-05', 'Engineering', 'JavaScript', 'New York', 92000);

INSERT INTO Employee1(EmpName, DOB,deptName,Technology, BaseLocation, Salary)
VALUES 
('Andrew Nguyen', '1990-08-22', 'Engineering', 'Java', 'San Francisco', 100000),
    ('Karen Park', '1993-04-05', 'Product Management', 'Scrum', 'Seattle', 90000),
    ('Justin Lee', '1985-11-12', 'Marketing', 'Content Marketing', 'Los Angeles', 80000),
    ('Emily Kim', '1988-02-18', 'Engineering', 'Python', 'New York', 110000),
    ('David Wang', '1995-09-03', 'Product Management', 'Product Roadmapping', 'San Francisco', 95000);

INSERT INTO Employee1(EmpName, DOB,deptName,Technology, BaseLocation, Salary)
VALUES
      ('Ashley Kim', '1992-05-10', 'Engineering', 'React', 'New York', 105000),
    ('Brian Lee', '1989-12-17', 'Product Management', 'Agile', 'San Francisco', 95000),
    ('Jessica Chen', '1987-08-08', 'Engineering', 'Node.js', 'Los Angeles', 100000),
    ('Daniel Kim', '1994-03-01', 'Marketing', 'Email Marketing', 'Seattle', 80000),
    ('Tiffany Wong', '1990-11-22', 'Engineering', 'C++', 'New York', 110000),
    ('Kevin Zhang', '1988-04-12', 'Product Management', 'Customer Research', 'San Francisco', 90000),
    ('Christina Park', '1991-02-05', 'Marketing', 'SEO', 'Los Angeles', 75000),
    ('Jonathan Lee', '1995-07-29', 'Engineering', 'Python', 'Seattle', 85000),
    ('Alex Kim', '1993-11-14', 'Product Management', 'UI/UX Design', 'New York', 100000),
    ('Julia Wang', '1990-06-03', 'Engineering', 'Java', 'San Francisco', 120000);

UPDATE Employee1 SET age = DATEDIFF(YEAR, DOB, GETDATE());

select * from dbo.Employee1;


--set operators 
select EmpName , Salary from Employee1 union (select EmpName , Salary from Employee);  --duplicates only once
select EmpName , Salary from Employee1 union all(select EmpName , Salary from Employee);  --everthing even duplicates
select EmpName , Salary from Employee1 intersect (select EmpName , Salary from Employee);
select EmpName , Salary from Employee except (select EmpName , Salary from Employee1);  --all in  left table excluding same rows in right table

