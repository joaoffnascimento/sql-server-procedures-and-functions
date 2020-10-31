if exists (select name from master.dbo.sysdatabases where name = N'Zoboomafoo')
	drop database [Zoboomafoo]
go

create database [Zoboomafoo]	
	on (name = N'Zoboomafoo_Data'
		, filename = N'/var/opt/mssql/data/zoboomafoo.mdf' 
		, size = 10
		, filegrowth = 10%) 
	log	
		on (name = N'Zoboomafoo_Log'	
		, filename = N'/var/opt/mssql/data/zoboomafoo.ldf'  
		, size = 01
		, filegrowth = 10%)