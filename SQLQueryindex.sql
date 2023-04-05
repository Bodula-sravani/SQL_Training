--indexes

select * from employees

--since we have a index with name and salary (unique) so no duplicates - throws error
insert into employees values(16,'Andrew Nguyen','1990-08-22',1,1,'San Francisco',100000,21)

create index Name_salary on employees(name,salary);

select * from employees.Name_salary

drop index employees.Name_salary