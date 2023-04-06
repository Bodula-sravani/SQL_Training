--Triggers

drop table logs

create table logs(UniqueID uniqueidentifier,Message varchar(255),Time datetime);


create or alter trigger technologyTrigger
on employees
after insert 
as
insert into logs values ( newid() ,'Employee inserted',CURRENT_TIMESTAMP)

select * from employees;

insert into employees values (19,'David Warner',	'1995-09-03',	2,	2	,'San Francisco',	95000,	26);

select * from logs
