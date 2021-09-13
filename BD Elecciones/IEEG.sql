CREATE DATABASE IEEG
USE IEEG

CREATE TABLE CANDIDATOS 
(
IDCANDIDATOS CHAR (5)NOT NULL,
CARGO CHAR(12)NULL,
IDPARTIDO CHAR(3)NULL,
NOMBRE CHAR(10)NULL,
NUMVOTOS INT NULL
)
/* CON EL COMANDO ALTER TABLE ESATAMOS MODIFICANDO LA TABLA DESEDA Y LE ESTAMOS AGREGANDO A UN CAMPO LA LLAVE PRIMARIA CON ADD CONSTRAIN*/
/* PK_ Y EL NOMBRE DEL CAMPO AL CUAL LE QUEREMOS ASIGNAR LA CALVE PRIMARIA , PRIMARY KEY Y ENTRE () EL NOMBRE EL CAMPO AL CUAL LE QUEREMOS ASIGANAR LA PK*/
ALTER TABLE CANDIDATOS 
ADD CONSTRAINT PK_IDCANDIDATOS
PRIMARY KEY(IDCANDIDATOS)

CREATE TABLE PARTIDOS 
(
IDPARTIDO CHAR(3)NOT NULL,
NOMBRE CHAR(20)NULL
)
/*MODIFICAMOS LA TBALA PARTIDOS PARA ASIGANARLE A UN CAMPO EL IDENTIFICADOR O LLAVE PRIMARIA*/
ALTER TABLE PARTIDOS 
ADD CONSTRAINT PK_IDPARTIDO
PRIMARY KEY (IDPARTIDO)

CREATE TABLE CARGOSFC
(
IDCARGO CHAR(3)NOT NULL,
NOMBRE CHAR(12)NULL,
MONTO INT NULL
)

ALTER TABLE CARGOSFC
ADD CONSTRAINT PK_IDCARGO
PRIMARY KEY (IDCARGO)

CREATE TABLE MUNICIPIOS 
(
IDMUNICIPIO CHAR(2)NOT NULL,
NOMBRE CHAR(10)NULL
)
/*MODIFICAMOS LA TABLA PARA PODER ASIGNARLE UN IDENTIFICADOR*/
ALTER TABLE MUNICIPIOS 
ADD CONSTRAINT PK_IDMUNICIPIO
PRIMARY KEY(IDMUNICIPIO)

CREATE TABLE COMUNIDADES 
(
IDCOMUNIDAD CHAR(2)NOT NULL,
NOMBRE CHAR(8)NULL,
IDMUNICIPIO CHAR(2)NULL
)

ALTER TABLE COMUNIDADES
ADD CONSTRAINT PK_IDCOMUNIDAD
PRIMARY KEY(IDCOMUNIDAD)

CREATE TABLE PADRON
(
NUMCREDENCIAL CHAR(6)NOT NULL,
NOMBRE CHAR (12)NULL,
IDCASILLA CHAR(2)NULL,
VOTO CHAR (2)NULL
)
/*MODIFICAMOS LA TABLA ASIGNANDO EL IDENTIFICADOR AL CAMPO  numCredencial*/
ALTER TABLE PADRON
ADD CONSTRAINT PK_NUMCREDENCIAL
PRIMARY KEY(NUMCREDENCIAL)

CREATE TABLE VOTOS 
(
IDVOTO CHAR(3)NOT NULL,
IDCANDIDATO CHAR(5)NULL,
IDCASILLA CHAR(2)NULL
)
/*CON EL COMANDO ALTER TABLE ESTAMOS MODIFCANDO LA TABLA VOTOS*/
ALTER TABLE VOTOS 
ADD CONSTRAINT PK_IDVOTO /*ASIGNAMOS AL CAMPO voto_id COMO LLAVE PRIMARIA IDENTIFICADOR DE ESTA TABLA*/
PRIMARY KEY (IDVOTO)

CREATE TABLE FUNCIONARIOS
(
IDFUNCIONARIO CHAR(2)NOT NULL,
NOMBREFUNCIONARIO CHAR(12)NULL,
EDAD INT NULL,
IDCARGO CHAR(3)NULL,
IDCASILLA CHAR(2)NULL
)
/*MODIFICAMOS LA TABLA FuncionariosCasilla ASIGANANDOLE UN IDENTIFICADOR A LA TABLA COMO funcionario_id */
ALTER TABLE FUNCIONARIOS
ADD CONSTRAINT IPK_IDFUNCIONARIO
PRIMARY KEY (IDFUNCIONARIO)



CREATE TABLE REPRESENTANTES 
(
IDREPRESENTANTE CHAR(2)NOT NULL,
NOMBREREPRESENTANTES CHAR(8)NULL,
IDPARTIDO CHAR(3)NULL,
IDCASILLA CHAR(2)NULL
)
/* MODIFICAMOS LA TABLA  RepresentantesPartido ASIGNANDO A LOS CAMPOS TANTO UN IDENTIFICADOR COMO DOS LLAVES FORANEAS QUE CORRESPONDE A DIFERENTES TABLAS*/
ALTER TABLE REPRESENTANTES 
ADD CONSTRAINT PK_IDREPRESENTANTE
PRIMARY KEY (IDREPRESENTANTE)


CREATE TABLE CASILLAS
(
IDCASILLA CHAR(2)NOT NULL,
NUMCASILLA INT NULL,
DIRECCION CHAR(15)NULL,
IDCOMUNIDAD CHAR(2)NULL,
IDMUNICIPIO CHAR(2)NULL
)
/*MODIFICAMOS LA TBLA Casillas Y ASIGANMOS UNA LLAVE PRIMARIA AL CAMPO casilla_id*/
ALTER TABLE CASILLAS
ADD CONSTRAINT PK_IDCASILLA
PRIMARY KEY(IDCASILLA)



/*MODIFICAMOS LA TABLA CANDIDATOS PARA ASIGNAR UNA CLAVE FORANEA QUE PERTENECE A OTRA TABLA*/
ALTER TABLE CANDIDATOS 
ADD CONSTRAINT FK_IDPARTIDO
FOREIGN KEY(IDPARTIDO)
REFERENCES PARTIDOS(IDPARTIDO)

ALTER TABLE FUNCIONARIOS 
ADD CONSTRAINT FK_IDCARGO
FOREIGN KEY(IDCARGO)
REFERENCES CARGOSFC(IDCARGO)

ALTER TABLE FUNCIONARIOS
ADD CONSTRAINT FK_CASILLA_FUNCIONARIOS
FOREIGN KEY(IDCASILLA)
REFERENCES CASILLAS(IDCASILLA)


/*ALTER TABLE FUNCIONARIOS
DROP FK_CASILLA_DUNCIONARIOS*/
/*MODIFICAMOS LA TABLA ASIGANDO UNA LLAVE FORANEA YA QUE EL CAMPO casilla_id  PERTENECE A A LA TABLA Casillas*/
ALTER TABLE PADRON 
ADD CONSTRAINT FK_IDCASILLA_PADRON
FOREIGN KEY(IDCASILLA)
REFERENCES CASILLAS(IDCASILLA)

/*ALTER TABLE PADRON
DROP FK_IDCASILLA*/

ALTER TABLE VOTOS 
ADD CONSTRAINT FK_CANDIDATO /*ASIGNAMOS AL CAMPO candidato_id COMO CLAVE FORANEA DEVIDO A QUE ES LLAVE PRIMARIA DE OTRA TABLA*/
FOREIGN KEY(IDCANDIDATO)
REFERENCES CANDIDATOS(IDCANDIDATOS)

ALTER TABLE VOTOS 
ADD CONSTRAINT FK_IDCASILLA_VOTOS
FOREIGN KEY(IDCASILLA)
REFERENCES CASILLAS(IDCASILLA)

/*ALTER TABLE VOTOS
DROP FK_IDCASILLA1*/

ALTER TABLE REPRESENTANTES
ADD CONSTRAINT FK_IDPARTIDO1
FOREIGN KEY(IDPARTIDO)
REFERENCES PARTIDOS(IDPARTIDO)


ALTER TABLE REPRESENTANTES
ADD CONSTRAINT FK_IDCASILLAS_REPRESENTANTES
FOREIGN KEY(IDCASILLA)
REFERENCES CASILLAS(IDCASILLA)

/*MODIFICAMOS LA TABLA Casillas PARA ASIGNAR LLAVES FORANEAS QUE HACEN REFERENCIA  DIFERENTES TABLAS*/
ALTER TABLE CASILLAS
ADD CONSTRAINT FK_IDCOMUNIDAD
FOREIGN KEY(IDCOMUNIDAD)
REFERENCES COMUNIDADES(IDCOMUNIDAD)

ALTER TABLE CASILLAS
ADD CONSTRAINT FK_IDMUNICIPIO
FOREIGN KEY(IDMUNICIPIO)
REFERENCES MUNICIPIOS(IDMUNICIPIO)

/*MODIFICAMOS LA TABLA COMUNIDAES ASIGNANDO AL CAMPO municipio_id COMO LLAVE FORANEA */
ALTER TABLE COMUNIDADES
ADD CONSTRAINT FK_IDMUNICIPIO1
FOREIGN KEY(IDMUNICIPIO)
REFERENCES MUNICIPIOS(IDMUNICIPIO)

ALTER TABLE PADRON
ADD CONSTRAINT DEFAULT_VOTO
DEFAULT 'NO'FOR VOTO

ALTER TABLE CANDIDATOS WITH NOCHECK
ADD CONSTRAINT   CHECK_IDCANDIDATO
CHECK(IDCANDIDATOS LIKE 'cand[0-9]')


ALTER TABLE CARGOSFC WITH NOCHECK
ADD CONSTRAINT   CHECK_IDCARGO
CHECK(IDCARGO LIKE '[A-Z][A-Z][A-Z]')


ALTER TABLE FUNCIONARIOS WITH NOCHECK
ADD CONSTRAINT   CHECK_IDFUNCIONARIOS
CHECK(IDFUNCIONARIO LIKE 'f[0-9]')


ALTER TABLE PADRON WITH NOCHECK
ADD CONSTRAINT   CHECK_NUMCREDENCIAL
CHECK(NUMCREDENCIAL LIKE 'cred[0-9][0-9]')


ALTER TABLE REPRESENTANTES WITH NOCHECK
ADD CONSTRAINT   CHECK_IDREPRESENTANTE
CHECK(IDREPRESENTANTE LIKE 'r[0-9]')


ALTER TABLE MUNICIPIOS WITH NOCHECK
ADD CONSTRAINT   CHECK_IDMUNICIPIOS
CHECK(IDMUNICIPIO LIKE '[A-Z][A-Z]')


ALTER TABLE CASILLAS WITH NOCHECK
ADD CONSTRAINT   CHECK_IDCASILLAS
CHECK(IDCASILLA LIKE 'c[0-9]')


ALTER TABLE COMUNIDADES WITH NOCHECK
ADD CONSTRAINT   CHECK_IDCOMUNIDADES
CHECK(IDCOMUNIDAD LIKE '[A-Z][A-Z]')

-- Partidos
INSERT INTO PARTIDOS(IDPARTIDO,NOMBRE) VALUES ('PAN','Accion Nacional')
INSERT INTO PARTIDOS(IDPARTIDO,NOMBRE) VALUES ('PRI','Revolucionario Inst')
INSERT INTO PARTIDOS(IDPARTIDO,NOMBRE) VALUES ('pum','yukiky')                                                                                                                                               
SELECT *FROM PARTIDOS		
-- candidatos
INSERT INTO CANDIDATOS (IDCANDIDATOS,CARGO,IDPARTIDO,NOMBRE,NUMVOTOS) VALUES ('cand1','presidente','PAN','lecho',0)
INSERT INTO CANDIDATOS (IDCANDIDATOS,CARGO,IDPARTIDO,NOMBRE,NUMVOTOS) VALUES ('cand2','gobernador','PAN','chencho',0)
INSERT INTO CANDIDATOS (IDCANDIDATOS,CARGO,IDPARTIDO,NOMBRE,NUMVOTOS) VALUES ('cand3','presidente','PRI','chucho',0)
INSERT INTO CANDIDATOS (IDCANDIDATOS,CARGO,IDPARTIDO,NOMBRE,NUMVOTOS) VALUES ('cand4','gobernador','PRI','nacho',0)
SELECT *FROM CANDIDATOS
-- cargos
INSERT INTO CARGOSFC (IDCARGO,NOMBRE,MONTO) VALUES ('esc','Escrutador',300)
INSERT INTO CARGOSFC (IDCARGO,NOMBRE,MONTO) VALUES ('pre','Presidente',500)
INSERT INTO CARGOSFC (IDCARGO,NOMBRE,MONTO) VALUES ('sec','Secretario',400)
SELECT *FROM CARGOSFC
-- municipio
INSERT INTO MUNICIPIOS(IDMUNICIPIO,NOMBRE) VALUES ('ir','Irapuato')     
INSERT INTO MUNICIPIOS(IDMUNICIPIO,NOMBRE) VALUES ('sa','Salamanca')    
INSERT INTO MUNICIPIOS(IDMUNICIPIO,NOMBRE) VALUES ('va','Valle')   
SELECT *FROM MUNICIPIOS
-- comunidad
INSERT INTO COMUNIDADES(IDCOMUNIDAD,NOMBRE,IDMUNICIPIO) VALUES ('ca','ca�as','va')
INSERT INTO COMUNIDADES(IDCOMUNIDAD,NOMBRE,IDMUNICIPIO) VALUES ('gu','Guarapo','va')
INSERT INTO COMUNIDADES(IDCOMUNIDAD,NOMBRE,IDMUNICIPIO) VALUES ('lo','Lobos','sa')    												 
--INSERT INTO Comunidades(comunidad_id,nombre,municipio_id) VALUES ('va','Guanajuato','valle')
SELECT *FROM COMUNIDADES	
-- casilla
INSERT INTO CASILLAS(IDCASILLA,NUMCASILLA,DIRECCION,IDCOMUNIDAD) VALUES ('c1',1,'Alamo 12','ca')  
INSERT INTO CASILLAS(IDCASILLA,NUMCASILLA,DIRECCION,IDCOMUNIDAD) VALUES ('c2',2,'Rio Lerma 312','ca')
INSERT INTO CASILLAS(IDCASILLA,NUMCASILLA,DIRECCION,IDMUNICIPIO) VALUES ('c3',1,'Obregon 123','va')
INSERT INTO CASILLAS(IDCASILLA,NUMCASILLA,DIRECCION,IDMUNICIPIO) VALUES ('c4',2,'Albino Garcia35','va')
INSERT INTO CASILLAS(IDCASILLA,NUMCASILLA,DIRECCION,IDMUNICIPIO) VALUES ('c5',3,'Arteaga112','va') 
INSERT INTO CASILLAS(IDCASILLA,NUMCASILLA,DIRECCION,IDCOMUNIDAD) VALUES ('c6',1,'sn','lo')      
SELECT *FROM CASILLAS
-- padron
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred01','mexicanito1','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred02','mexicanito2','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred03','mexicanito3','c1','no')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred04','mexicanito4','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred05','mexicanito5','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred06','mexicanito6','c1','no')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred07','mexicanito7','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred08','mexicanito8','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred09','mexicanito9','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred10','mexicanito10','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred11','mexicanito11','c1','no')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred12','mexicanito12','c1','si')
INSERT INTO PADRON(NUMCREDENCIAL,NOMBRE,IDCASILLA,VOTO) VALUES ('cred13','mexicanito13','c1','no')
SELECT *FROM PADRON
-- representante
INSERT INTO REPRESENTANTES(IDREPRESENTANTE,NOMBREREPRESENTANTES,IDPARTIDO,IDCASILLA) VALUES ('r1','juan','PRI','c1')
INSERT INTO REPRESENTANTES(IDREPRESENTANTE,NOMBREREPRESENTANTES,IDPARTIDO,IDCASILLA) VALUES ('r2','juse','PAN','c1')
INSERT INTO REPRESENTANTES(IDREPRESENTANTE,NOMBREREPRESENTANTES,IDPARTIDO,IDCASILLA) VALUES ('r3','mari','PRI','c2')
INSERT INTO REPRESENTANTES(IDREPRESENTANTE,NOMBREREPRESENTANTES,IDPARTIDO,IDCASILLA) VALUES ('r4','laura','PAN','c2')
INSERT INTO REPRESENTANTES(IDREPRESENTANTE,NOMBREREPRESENTANTES,IDPARTIDO,IDCASILLA) VALUES ('r5','raul','PRI','c4')
INSERT INTO REPRESENTANTES(IDREPRESENTANTE,NOMBREREPRESENTANTES,IDPARTIDO,IDCASILLA) VALUES ('r6','bertha','PAN','c4')
SELECT *FROM REPRESENTANTES
-- funcionario
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f1','martinez',23,'pre','c1')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f2','lara',34,'pre','c2')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f3','sanchez',43,'sec','c1')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f4','briones',45,'sec','c2')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f5','estrada',62,'esc','c1')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f6','carrillo',33,'pre','c3')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f7','puetne',24,'sec','c4')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f8','chavez',45,'esc','c1')
INSERT INTO FUNCIONARIOS(IDFUNCIONARIO,NOMBREFUNCIONARIO,EDAD,IDCARGO,IDCASILLA) VALUES ('f9','mata',23,'pre','c4')                                     
SELECT *FROM FUNCIONARIOS
-- votos
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v1','cand1','c1')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v10','cand4','c1')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v11','cand1','c3')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v12','cand2','c3')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v13','cand3','c3')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v14','cand4','c3')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v15','cand3','c4')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v16','cand4','c4')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v17','cand3','c4')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v18','cand4','c4')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v2','cand2','c1')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v20','cand3','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v21','cand3','c3')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v22','cand3','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v23','cand3','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v24','cand2','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v2j','cand2','c1')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v3','cand1','c1')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES ('v4','cand2','c1')

INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES('v5','cand3','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES('v6','cand4','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES('v7','cand1','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES('v8','cand2','c2')
INSERT INTO VOTOS(IDVOTO,IDCANDIDATO,IDCASILLA) VALUES('v9','cand3','c3')
SELECT *FROM VOTOS

SELECT*FROM PARTIDOS
SELECT*FROM CANDIDATOS
SELECT*FROM VOTOS
SELECT*FROM REPRESENTANTES
SELECT*FROM CASILLAS
SELECT*FROM PADRON
SELECT*FROM MUNICIPIOS
SELECT*FROM COMUNIDADES
SELECT*FROM FUNCIONARIOS
SELECT*FROM CARGOSFC 