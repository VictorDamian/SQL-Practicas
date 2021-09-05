CREATE DATABASE GuiaSql
GO
USE GuiaSql
GO

CREATE TABLE Usuarios
(
ID INT IDENTITY (1,1) PRIMARY KEY,
NAME NVARCHAR (100),
LASTNAME NVARCHAR (100),
CELLPHONE NVARCHAR (100)
)
GO
select*from Usuarios
CREATE TABLE TIENDA
(
ID_T INT IDENTITY (1,1) PRIMARY KEY,
NOMBRE NVARCHAR (50),
)
GO



INSERT INTO TIENDA VALUES ('DOÑA MIKA')
INSERT INTO TIENDA VALUES ('COOPEL')

CREATE TABLE ESTUDIANTES
(
ID_E INT not NULL,
nombre varchar(20)null,
apellido varchar(20)null
)

create table maestro
(
id_m int not null,
nombre_m varchar(20)not null,
)
go

select*from estudiantes
select*from maestro

insert into maestro values(1
,'fito'
)

insert into estudiantes values(1,'vic','damian',1,'')
insert into estudiantes values(4,'manuel','damian',1,'')
insert into estudiantes values(5,'angel','devian',1,'')

insert into estudiantes values(6,'angel','karsen',1,'')
insert into estudiantes values(7,'angel','larsen',1,'')
insert into estudiantes values(8,'angel','carsen',1,'')

update ESTUDIANTES
set id_m = ' '
where ID_E = 8

insert into estudiantes values
(2,'carmen','contreras',1,''),
(3,'marlon','glass',1,'')
go