DROP TABLE IF EXISTS dbo.People
GO
CREATE TABLE dbo.People(
	id int primary key identity,
	name nvarchar(50),
	surname nvarchar(50),
	address nvarchar(200),
	town nvarchar(50)
)
GO