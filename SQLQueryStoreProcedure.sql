USE [PracticeDatabase]
GO

/****** Object:  StoredProcedure [dbo].[fetch_employees]    Script Date: 04-04-2023 14:14:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[fetch_employees] @deptId int, @techid int,@locat varchar(255)
as
select * from employees where (department_id=@deptId or technology_id=@techid) and location=@locat;


GO


