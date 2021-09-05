--------------------------- CONSULTAS SELECT
SELECT NAME
FROM Usuarios
GO
--------------------------- QUITA DUPLICADOS
SELECT DISTINCT NAME 
FROM Usuarios
--------------------------- CONDICIONES
SELECT NAME, LASTNAME 
FROM Usuarios 
WHERE NAME='angel'
GO
--
SELECT NAME, LASTNAME 
FROM Usuarios 
WHERE PASSWORD > 1
GO
--------------------------- OPERADORES
SELECT NAME, LASTNAME 
FROM Usuarios 
WHERE LASTNAME='lopez' or LASTNAME='martinez'
GO
--
SELECT NAME, LASTNAME 
FROM Usuarios 
WHERE NAME='miguel' and (LASTNAME='hernandez' or LASTNAME='lopez')
GO
--------------------------- ORDER BY
SELECT NAME, LASTNAME
FROM Usuarios
ORDER BY LASTNAME DESC
GO
--------------------------- INSERT
INSERT INTO Usuarios VALUES('maria','gonzales','23585237')
INSERT INTO Usuarios VALUES
('angel','martinez','78387167'),
('miguel','hernandez','2389598'),
('manuel','lopez','87238773')
go
--
insert into maestro values(2
,'pepe',18
)
insert into maestro values(4
,'jose',23
)
--------------------------- UPDATE
UPDATE Usuarios
SET LASTNAME ='MERCADO'
WHERE NAME ='carmen'
and LASTNAME = 'contreras'
GO
--------------------------- DELETE
DELETE FROM Usuarios
WHERE NAME ='victor'
and LASTNAME = 'barron'
GO
--
DELETE FROM Usuarios
WHERE ID = 1
GO
--------------------------- TOP
SELECT TOP 5
* FROM ESTUDIANTES
GO
-- %50
SELECT TOP 50 
PERCENT*FROM ESTUDIANTES
GO
--------------------------- LIKE
SELECT*FROM Usuarios WHERE NAME LIKE 'V%'
GO
SELECT*FROM Usuarios WHERE CELLPHONE LIKE '%9'
GO
-- individual
SELECT*FROM ESTUDIANTES WHERE apellido LIKE '_amian'
GO
-- intervalo
SELECT*FROM ESTUDIANTES WHERE apellido LIKE '[c-k]arsen'
GO
-- restriccion
SELECT*FROM ESTUDIANTES WHERE apellido LIKE 'da[^n]%'
GO
---------------------------- IN
-- múltiples valores en una cláusula WHERE
SELECT*FROM ESTUDIANTES
WHERE apellido
IN ('damian','contreras')
GO
---------------------------- BETWEEN
SELECT*FROM ESTUDIANTES
WHERE ID_E
NOT BETWEEN 3 and 6
GO
SELECT*FROM ESTUDIANTES
WHERE ID_E
BETWEEN 3 and 6
GO
---------------------------- AS(alias)
SELECT E.ID_E, E.nombre, E.apellido
FROM ESTUDIANTES
AS E
WHERE E.nombre = 'angel'
GO
---------------------------- JOIN
---------------------------- INNER JOIN
SELECT E.nombre, E.id_m, M.nombre_m
FROM ESTUDIANTES AS E
INNER JOIN maestro AS M
ON E.id_m = M.id_m 
GO
---------------------------- LEFT JOIN
---------------------------- Devuelve LAS FILAS DE LA PRIMERA tabla
---------------------------- Devuelve la fila aunque no cumpla la condicion
SELECT E.nombre, E.id_m, M.nombre_m
FROM ESTUDIANTES AS E
LEFT JOIN maestro AS M
ON E.id_m = M.id_m 
GO
---------------------------- LEFT JOIN
---------------------------- Devuelve LAS FILAS DE LA segunda tabla
---------------------------- aunque no cumpla la condicion
SELECT E.nombre, E.id_m, M.nombre_m
FROM ESTUDIANTES AS E
right JOIN maestro AS M
ON E.id_m = M.id_m 
GO
---------------------------- FULL JOIN
---------------------------- Devuelve LAS FILAS DE LA PRIMERA tabla
---------------------------- Devuelve la fila aunque no cumpla la condicion
SELECT E.nombre, E.id_m, M.nombre_m
FROM ESTUDIANTES AS E
FULL JOIN maestro AS M
ON E.id_m = M.id_m 
GO
---------------------------- UNION
---------------------------- acumular los resultados de dos sentencias SELECT.
---------------------------- deben tener el mismo num de colum
SELECT nombre, apellido 
FROM ESTUDIANTES 
UNION
SELECT NAME, LASTNAME 
FROM Usuarios
---------------------------- INDEX
create index nomEstud
on Estudiantes(nombre)
go
--
DROP INDEX nomEstud 
ON Estudiantes
---------------------------- DROP
---------------------------- Borra un índice, tabla o base de datos.
DROP TABLE TIENDA
GO
---------------------------- TRUNCATE
---------------------------- ELIMINA DATOS DE UNA TABLA PERO SIN BORRAR LA TABLA
TRUNCATE TABLE TIENDA
GO
---------------------------- ALTER
---------------------------- AGREGA UNA COLUMNA A LA TABLA
ALTER TABLE Usuarios
ADD PASSWORD NVARCHAR(50)
GO
--
alter table maestro
add edad int
go
--
alter table estudiantes
add fecha date
go
--
alter table estudiantes
add id_m int null
go
---------------------------- ELIMINA UNA COLUMNA
ALTER TABLE Usuarios
DROP COLUMN PASSWORD;
GO
--
alter table estudiantes
drop constraint fk_idmaestro
go
---------------------------- MODIFICA TIPO DE COLUMNA
ALTER TABLE USUARIOS
ALTER COLUMN PASSWORD INT
GO
---------------------------- VIEW
CREATE VIEW [Personas con nombre Angel] AS
SELECT nombre, apellido
FROM ESTUDIANTES
WHERE nombre='angel'
GO
--
select*from [Personas con nombre Angel]
GO
---------------------------- NULL
SELECT*FROM maestro 
WHERE edad IS NOT NULL
GO
SELECT*FROM maestro 
WHERE edad IS NULL
GO
--
---------------------------- GROUP BY
---------------------------- ORDER BY
-- AGRUPA CON EL MISMO NOMBRE
SELECT NAME, LASTNAME
FROM Usuarios 
WHERE NAME='Victor' 
GROUP BY NAME, LASTNAME
ORDER BY NAME
GO
-- ENUMERA NOMBRE IGUALES
SELECT COUNT(ID), NAME 
FROM Usuarios 
GROUP BY NAME
GO
-- ENUMERA NOMBRE IGUALES Y ORDENA
SELECT COUNT(ID), NAME
FROM Usuarios
GROUP BY NAME
ORDER BY COUNT(ID) DESC
GO
------------------------------- PRIMARY KEY
alter table estudiantes
add constraint pk_estudiante
primary key (id_e)
go
--
alter table maestro
add constraint pk_maestro
primary key(id_m)
go
-------------------------------- Foreign key
alter table estudiantes
add constraint fk_idmaestro
foreign key (id_m)
references maestro(id_m)
go
-------------------------------- Default
alter table estudiantes
add constraint d_est
default getdate() for fecha
go
-------------------------------- CHECK
--el criterio puede incluir cualquier expresión con operadores:
alter table maestro with nocheck
add constraint ck_maestro
check (edad>=23)
go
--------------------------------
--- muestra un reporte de las restricciones existentes en una tabla
Exec sp_helpconstraint estudiantes
--- muestra información de una restricción en particular
exec sp_help d_est