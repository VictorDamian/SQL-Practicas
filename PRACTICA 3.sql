CREATE DATABASE CICLISMO
USE CICLISMO
GO

CREATE TABLE EQUIPO
(
NOM_EQ CHAR(10) NOT NULL,
DIRECTOR NVARCHAR(50)
)
GO
ALTER TABLE EQUIPO
ADD CONSTRAINT PK_NOM_EQ
PRIMARY KEY(NOM_EQ)
GO
--------------------------------
CREATE TABLE CICLISTA
(
DORSAL INT NOT NULL,
NOMBRE_C NVARCHAR(50),
EDAD INT,
NOM_EQ CHAR(10)NULL
)
GO
DROP TABLE CICLISTA
ALTER TABLE CICLISTA
ADD CONSTRAINT PK_DORSAL
PRIMARY KEY (DORSAL)
GO
ALTER TABLE CICLISTA
ADD CONSTRAINT FK_NOM_EQ
FOREIGN KEY(NOM_EQ)
REFERENCES EQUIPO(NOM_EQ)
GO
----------------------------------
CREATE TABLE ETAPA
(
N_ETAPA INT NOT NULL,
KM INT,
SALIDA INT,
LLEGADA INT,
DORSAL INT NULL,
)
GO
ALTER TABLE ETAPA
ADD CONSTRAINT PK_NETAPA
PRIMARY KEY (N_ETAPA)
GO
ALTER TABLE ETAPA
ADD CONSTRAINT FK_DORSAL
FOREIGN KEY (DORSAL)
REFERENCES CICLISTA(DORSAL)
GO
--------------------------
CREATE TABLE PUERTO
(
NOMBRE_P CHAR(10)NOT NULL,
ALTURA INT,
CATEGORIA NVARCHAR(50),
N_ETAPA INT NULL,
DORSAL INT NULL,
)
GO
ALTER TABLE PUERTO
ADD CONSTRAINT PK_NOMP
PRIMARY KEY(NOMBRE_P)
GO
ALTER TABLE PUERTO
ADD CONSTRAINT FK_NETAPA
FOREIGN KEY(N_ETAPA)
REFERENCES ETAPA(N_ETAPA)
GO
ALTER TABLE PUERTO
ADD CONSTRAINT FK_PDORSAL
FOREIGN KEY(DORSAL)
REFERENCES CICLISTA(DORSAL)
GO
---------------------------
CREATE TABLE MAILLOT
(
CODIGO INT NOT NULL,
TIPO NVARCHAR(20),
PREMIO NVARCHAR(20),
COLOR NVARCHAR(20),
N_ETAPA INT,
)
GO
ALTER TABLE MAILLOT
ADD CONSTRAINT PK_CODIGO
PRIMARY KEY (CODIGO)
GO
------------------------------
CREATE TABLE LLEVAR
(
DORSAL INT NOT NULL,
N_ETAPA INT NOT NULL,
CODIGO INT NOT NULL,
)
GO
ALTER TABLE LLEVAR
ADD CONSTRAINT PK_NETP
PRIMARY KEY(CODIGO, N_ETAPA)
GO
ALTER TABLE LLEVAR
ADD CONSTRAINT FK_ETP
FOREIGN KEY (N_ETAPA)
REFERENCES ETAPA(N_ETAPA)
GO
ALTER TABLE LLEVAR
ADD CONSTRAINT FK_DOR
FOREIGN KEY (DORSAL)
REFERENCES CICLISTA(DORSAL)
GO
ALTER TABLE LLEVAR
ADD CONSTRAINT FK_COD
FOREIGN KEY (CODIGO)
REFERENCES MAILLOT(CODIGO)
GO