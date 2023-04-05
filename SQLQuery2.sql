--Math functions
select abs(-9);
select 11%2;
select floor(1.00);  --lowest (downing)
select CEILING(1);  --one highest value

select power(5,2);

select ROUND(85,-2);  --moves decimals in tens ones places if negative

select round(21.55,0,0);  -- third arg: 0 - for one up(celi) , 1-for one low(floor)

select SQUARE(10);
select SQRT(25);

--Datetime functions

select GETDATE();
select DATEADD(day,1,'2023-04-04');  -- adds 1 day to given date , can be used month&year,hour etc
select DATEDIFF(YEAR,'2023-12-12','2021-12-12');  -- diff in given interval(day,year,etc) between 2nd date and first
select datediff(minute,'2023-12-12 10:00:00','2023-12-12 10:02:02'); -- datediff_big() for larger differences(high num)
select datepart(year,'2023-02-02');  -- gives year or month in given date
select DATEFROMPARTS(2023,1,2);  -- gives a date from given args

--string functions
--working even on ints
select concat('hello','world');
select * from dbo.Employee1
select concat(rtrim(BaseLocation),'-',rtrim(EmpName),'-',salary) as employe_location from Employee1;

select replace('Hello world','world','me');
select replace(BaseLocation,'a','#') from Employee1;

select REVERSE(EmpName) from Employee1;

select reverse(Salary) from Employee1;

select SUBSTRING('this is a sub string',15,6);

select SUBSTRING(EmpName,-1,5) from Employee1;
--It replaces the char with given char l - # , w-@ , o-*
select TRANSLATE('Hello world','lwo','#@*');  -- same no of chars in 2nd and 3rd args but replace, replaces the whole thing

select UPPER('hai hello');
select lower('HEllo WORLd');

select STR(23.4572,6,4); --gives varchar of a number

select RIGHT('hai everyone',5);  -- from right side 
select left('hai everyone',5);  -- 5 chars from left side 

update Employee1 set BaseLocation = replace(BaseLOcation,'New York','Texas');