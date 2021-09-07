CREATE DATABASE EXANI
GO
USE EXANI
GO

CREATE TABLE ALUMNOS(
IDFOLIO VARCHAR(2) NOT NULL,
NOMBRE VARCHAR (25),
AP_PA VARCHAR (20),
AP_MA VARCHAR (20),
BACHILLERATO VARCHAR (25),
)

ALTER TABLE ALUMNOS 
ADD CONSTRAINT PK_IDFOLIO
PRIMARY KEY(IDFOLIO)

CREATE TABLE INGLES(
IDINGLES VARCHAR(2) NOT NULL,
NOMBRE VARCHAR(25),
PUNTAJE VARCHAR(4),
ESTATUS VARCHAR(10),
IDFOLIO VARCHAR(2),
)

ALTER TABLE INGLES
ADD CONSTRAINT PK_IDINGLES
PRIMARY KEY(IDINGLES)

CREATE TABLE FISICA(
IDFISICA VARCHAR(2) NOT NULL,
NOMBRE VARCHAR(25),
PUNTAJE VARCHAR(4),
ESTATUS VARCHAR(10),
IDFOLIO VARCHAR(2),
)

ALTER TABLE FISICA
ADD CONSTRAINT PK_IDFISICA
PRIMARY KEY(IDFISICA)

CREATE TABLE MATEMATICAS(
IDMATE VARCHAR(2) NOT NULL PRIMARY  KEY,
NOMBRE VARCHAR(25),
PUNTAJE VARCHAR(4),
ESTATUS VARCHAR(10),
IDFOLIO VARCHAR(2),
FOREIGN KEY (IDFOLIO) REFERENCES ALUMNOS(IDFOLIO)
)

INSERT INTO ALUMNOS(IDFOLIO, NOMBRE, AP_MA, AP_PA, BACHILLERATO) VALUES (1, 'Naruto', 'Uzumaki', 'Uchiha', 'RH')
INSERT INTO ALUMNOS(IDFOLIO, NOMBRE, AP_MA, AP_PA, BACHILLERATO) VALUES (2, 'Sasuke', 'Uchiha', 'Uchiha', 'MED')
INSERT INTO ALUMNOS(IDFOLIO, NOMBRE, AP_MA, AP_PA, BACHILLERATO) VALUES (3, 'Goku', 'Uzumaki', 'Uchiha', 'ELEC')
INSERT INTO ALUMNOS(IDFOLIO, NOMBRE, AP_MA, AP_PA, BACHILLERATO) VALUES (4, 'Madara', '', 'Uchiha', 'TIC')
INSERT INTO ALUMNOS(IDFOLIO, NOMBRE, AP_MA, AP_PA, BACHILLERATO) VALUES (5, 'Chitoge', 'Tsugomi', 'Uchiha', 'CON')

INSERT INTO INGLES(IDINGLES, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (12, 'INGLES', 390, 'REPROBADO', 1)
INSERT INTO INGLES(IDINGLES, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (13, 'INGLES', 405, 'REPROBADO', 2)
INSERT INTO INGLES(IDINGLES, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (14, 'INGLES', 890, 'APROBADO', 3)
INSERT INTO INGLES(IDINGLES, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (15, 'INGLES', 690, 'APROBADO', 4)
INSERT INTO INGLES(IDINGLES, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (16, 'INGLES', 760, 'APROBADO', 5)

INSERT INTO MATEMATICAS(IDMATE, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (43, 'MATE', 399, 'REPROBADO', 1)
INSERT INTO MATEMATICAS(IDMATE, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (42, 'MATE', 298, 'REPROBADO', 2)
INSERT INTO MATEMATICAS(IDMATE, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (41, 'MATE', 1220, 'APROBADO', 3)
INSERT INTO MATEMATICAS(IDMATE, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (44, 'MATE', 1390, 'APROBADO', 4)
INSERT INTO MATEMATICAS(IDMATE, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (46, 'MATE', 400, 'REPROBADO', 5)

INSERT INTO FISICA (IDFISICA, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (98, 'FISICA', 678, 'APROBADO', 1)
INSERT INTO FISICA (IDFISICA, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (87, 'FISICA', 548, 'APROBADO', 2)
INSERT INTO FISICA (IDFISICA, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (76, 'FISICA', 389, 'REPROBADO', 3)
INSERT INTO FISICA (IDFISICA, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (6, 'FISICA', 319, 'REPROBADO', 4)
INSERT INTO FISICA (IDFISICA, NOMBRE, PUNTAJE, ESTATUS, IDFOLIO) VALUES (16, 'FISICA', 1287, 'APROBADO', 5)

SELECT*FROM ALUMNOS
SELECT*FROM FISICA orDER BY IDFOLIO
SELECT*FROM MATEMATICAS orDER BY IDFOLIO
SELECT*FROM INGLES orDER BY IDFOLIO

SELECT A.NOMBRE
FROM ALUMNOS A, INGLES I
WHERE A.IDFOLIO = I.IDFOLIO
AND I.IDFOLIO
IN(
SELECT ING.IDFOLIO
FROM INGLES ING
WHERE ING.ESTATUS = 'APROBADO'
)
---�Qui�n ya curso todas las materias?
SELECT A.NOMBRE
FROM ALUMNOS A, INGLES I,
FISICA F, MATEMATICAS M
WHERE 
A.IDFOLIO = I.IDFOLIO
AND I.IDFOLIO
IN(
SELECT ING.IDFOLIO
FROM INGLES ING
WHERE ING.ESTATUS = 'APROBADO'
)
AND F.IDFOLIO = A.IDFOLIO
AND F.IDFOLIO
IN(
SELECT F1.IDFOLIO
FROM FISICA F1
WHERE F1.ESTATUS = 'APROBADO'
)
AND A.IDFOLIO = M.IDFOLIO
AND M.IDFOLIO
IN(
SELECT M1.IDFOLIO
FROM MATEMATICAS M1
WHERE M1.ESTATUS = 'APROBADO'
)
GO
--�Qui�nes han cursado al menos una materia?
SELECT A.NOMBRE, 
I.ESTATUS AS INGLES,
M.ESTATUS AS MATE,
F.ESTATUS AS FISI
FROM ALUMNOS A 
INNER JOIN
INGLES I
ON I.IDFOLIO = A.IDFOLIO
INNER JOIN
MATEMATICAS M
ON M.IDFOLIO = A.IDFOLIO
INNER JOIN
FISICA F
ON F.IDFOLIO = A.IDFOLIO
WHERE I.ESTATUS = 'APROBADO'
AND F.ESTATUS = 'APROBADO'
AND M.ESTATUS = 'APROBADO'
GO
--3) �Qui�n no ha cursado F�sica?
--calificaciones superiores a 400. 5,4,3 GO,MA,CHI
SELECT A.NOMBRE
FROM ALUMNOS A
WHERE A.IDFOLIO
IN
(
SELECT M.IDFOLIO
FROM MATEMATICAS M
WHERE M.PUNTAJE >= 400
AND M.IDFOLIO = A.IDFOLIO
)
GO
SELECT M.PUNTAJE, A.NOMBRE
FROM MATEMATICAS M, ALUMNOS A
WHERE M.PUNTAJE >= 400 AND M.IDFOLIO = A.IDFOLIO
GO