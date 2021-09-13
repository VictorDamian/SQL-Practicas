/*1.	Nombre de los funcionarios de casilla ubicados 
en la casilla con clave C2*/

SELECT F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F
WHERE F.IDCASILLA = 'C2'
GO

/*2.	Clave y nombre de los funcionarios de casilla de la comunidad
de �Ca�as�, Asumir que se desconoce la clave de cada  comunidad. */                                             

SELECT F.IDFUNCIONARIO, F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F, CASILLAS C
WHERE F.IDCASILLA = C.IDCASILLA
AND C.IDCOMUNIDAD
IN
(SELECT CM.IDCOMUNIDAD
FROM COMUNIDADES CM
WHERE CM.IDCOMUNIDAD = c.IDCOMUNIDAD
)
GO

/*3. Clave y nombre de los funcionarios de casilla que participaron 
en comunidades de  �Valle�*/

SELECT F.IDFUNCIONARIO, F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F, CASILLAS C
WHERE F.IDCASILLA = C.IDCASILLA
AND C.IDCOMUNIDAD
IN
(SELECT CM.IDCOMUNIDAD
FROM COMUNIDADES CM
WHERE CM.IDCOMUNIDAD = c.IDCOMUNIDAD
AND CM.IDMUNICIPIO = 'VA'
)

/*4.	Clave y nombre de los funcionarios de casilla que participaron 
en la ciudad:  �Valle�*/

SELECT F.IDFUNCIONARIO, F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F, CASILLAS C
WHERE C.IDCASILLA = F.IDCASILLA
AND C.IDMUNICIPIO
IN(
SELECT M.IDMUNICIPIO
FROM MUNICIPIOS M
WHERE M.IDMUNICIPIO = C.IDMUNICIPIO
AND M.NOMBRE ='valle')
GO

/*5.	N�mero de ciudadanos inscritos en el padr�n.*/

SELECT COUNT(P.NOMBRE) AS TOTAL_C
FROM PADRON P

/*6.	Obtener la edad promedio de los funcionarios de casilla*/

SELECT AVG(F.EDAD) AS EDAD_PROM
FROM FUNCIONARIOS F

/*7. Obtener la edad del Funcionario de casilla m�s joven y rotular 
el campo como �edad m�nima�. */

SELECT MIN(F.EDAD) AS EDAD_MIN
FROM FUNCIONARIOS F

/*8.	Obtener la edad del Funcionario de casilla mayor. */

SELECT MAX(F.EDAD) AS EDAD_MAY
FROM FUNCIONARIOS F

/*9.	Clave del  funcionario de casilla m�s joven. 
(uso de subconsultas)*/

SELECT F.IDFUNCIONARIO
FROM FUNCIONARIOS F
WHERE F.EDAD = 
(
SELECT DISTINCT MIN(F2.EDAD)
FROM FUNCIONARIOS F2)
GO

/*11.	Clave del  funcionario de casilla m�s viejo.*/

SELECT F.IDFUNCIONARIO AS VETERANO
FROM FUNCIONARIOS F
WHERE F.EDAD = 
(SELECT DISTINCT MAX(F2.EDAD)
FROM FUNCIONARIOS F2)
GO

/*12.	Nombres de los funcionarios de casilla ordenados alfab�ticamente.
(usa funci�n desc)*/

SELECT F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F
ORDER BY (F.NOMBREFUNCIONARIO) DESC

/*13.	Nombres de los funcionarios de casilla ordenados alfab�ticamente 
de la a �A� la �Z� */

SELECT F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F
ORDER BY (F.NOMBREFUNCIONARIO) ASC

/*14.	Nombres y edades de los funcionarios de 
casilla ordenados del mayor al menor de edad*/

SELECT F.NOMBREFUNCIONARIO, F.EDAD
FROM FUNCIONARIOS F
ORDER BY EDAD DESC

/*15.	Nombre y edad de los cuatro Funcionarios de casilla 
m�s j�venes. (uso de funci�n top)*/

SELECT TOP 4 (F.EDAD), F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F
ORDER BY F.EDAD ASC

/* 16.	Nombre y edad de la mitad de los Funcionarios de casilla 
m�s j�venes.  (uso de percent)*/

SELECT TOP 50 PERCENT*
FROM FUNCIONARIOS F
ORDER BY EDAD ASC

/*17.	Nombre y cargo de los funcionarios de casilla y el monto 
de lo que percibe cada uno de apoyo econ�mico. */

SELECT F.NOMBREFUNCIONARIO, C.NOMBRE, C.MONTO
FROM FUNCIONARIOS F, CARGOSFC C
WHERE F.IDCARGO = C.IDCARGO

/*18.	�Cu�nto gast� el IEEG en pago a funcionarios de casilla?  */

SELECT SUM(C.MONTO)
FROM FUNCIONARIOS F, CARGOSFC C
WHERE F.IDCARGO = C.IDCARGO

/*19.	Total invertido en pago a escrutadores. */

SELECT SUM(C.MONTO)
FROM FUNCIONARIOS F, CARGOSFC C
WHERE F.IDCARGO = C.IDCARGO
AND F.IDCARGO = 'esc'

/*20.	Total invertido en pago a escrutadores, presidentes y secretarios. */

SELECT C.NOMBRE, SUM(C.MONTO)
FROM CARGOSFC C
INNER JOIN FUNCIONARIOS F
ON F.IDCARGO = C.IDCARGO
GROUP BY C.NOMBRE

/*21.	Total invertido en pago a presidentes y secretarios solamente. */

SELECT SUM(C.MONTO)
FROM CARGOSFC C
INNER JOIN FUNCIONARIOS F
ON F.IDCARGO = C.IDCARGO
WHERE C.IDCARGO IN('pre','sec')

/*22.	Nombre de los candidatos cuyo nombre empiece con la letra �C�*/

SELECT C.NOMBRE
FROM CANDIDATOS C
WHERE C.NOMBRE LIKE 'C%'

/*23.	Nombre de los candidatos cuyo nombre contenga  las letras �Ch�*/

SELECT C.NOMBRE
FROM CANDIDATOS C
WHERE C.NOMBRE LIKE '%CH%'

/*24.	Nombre de los funcionarios de casilla que tengan 23, 33 o 43 a�os 
(usa la clausula IN)*/

SELECT F.NOMBREFUNCIONARIO
FROM FUNCIONARIOS F
WHERE F.EDAD IN('23','33','43')

/*25.	N�mero de Mexicanos en el padr�n que no votaron*/

SELECT COUNT(P.NOMBRE)
FROM PADRON P
WHERE P.VOTO = 'NO'

/*26.	Nombre de los candidatos cuyo nombre no contenga la letra �e�*/

SELECT C.NOMBRE
FROM CANDIDATOS C
WHERE C.NOMBRE LIKE '%E%'

/*27.	�Vot� o no vot� el mexicanito4? */

SELECT P.VOTO
FROM PADRON P
WHERE P.NOMBRE = 'MEXICANITO4'

/*28.	Clave de casilla y direcci�n donde vot� el �Mexicanito4�*/

SELECT P.IDCASILLA, C.DIRECCION
FROM PADRON P
INNER JOIN CASILLAS C
ON P.IDCASILLA = C.IDCASILLA
WHERE P.NOMBRE = 'MEXICANITO4'

/*29.	Nombre del candidato o partido por quien vot� el �Mexicanito4�*/

SELECT PA.NOMBRE
FROM PADRON P
INNER JOIN CASILLAS C
ON C.IDCASILLA = P.IDCASILLA
INNER JOIN REPRESENTANTES R
ON R.IDCASILLA = C.IDCASILLA
INNER JOIN PARTIDOS PA
ON PA.IDPARTIDO = R.IDPARTIDO
WHERE P.NOMBRE = 'MEXICANITO4'


/*30.	nombre de las comunidades con al menos un voto hasta el momento.*/

SELECT C.NOMBRE
FROM COMUNIDADES C
INNER JOIN CASILLAS CS
ON CS.IDCOMUNIDAD = C.IDCOMUNIDAD
INNER JOIN PADRON P
ON P.IDCASILLA = CS.IDCASILLA
WHERE P.VOTO = 'SI'


/*31.	lista de las comunidades donde no se ha registrado ning�n voto hasta 
ahora (se recomienda aplicar subconsulta)*/

SELECT C.NOMBRE
FROM COMUNIDADES C

/*32.	Clave del partido sin �representantes de partido� en las elecciones 
(subconsulta)*/

SELECT P.IDPARTIDO
FROM PARTIDOS P
WHERE P.IDPARTIDO NOT IN
(
SELECT R.IDPARTIDO
FROM REPRESENTANTES R
WHERE R.IDPARTIDO = P.IDPARTIDO
)


/*33.	Clave de las casillas donde no se ha generado ning�n voto hasta el
momento. (subconsulta)*/

SELECT C.IDCASILLA
FROM CASILLAS C
WHERE C.IDCASILLA NOT IN
(
SELECT V.IDCASILLA
FROM VOTOS V
WHERE V.IDCASILLA = C.IDCASILLA
)
GO

/*34.	Nombre del partido con m�s votos en la comunidad de �ca�as�*/

SELECT TOP 1 P.NOMBRE
FROM PARTIDOS P
WHERE P.IDPARTIDO
IN(
SELECT CA.IDPARTIDO
FROM CANDIDATOS CA
WHERE CA.IDCANDIDATOS
IN(
SELECT V.IDCANDIDATO
FROM VOTOS V
WHERE V.IDCASILLA 
IN(
SELECT C.IDCASILLA
FROM CASILLAS C
WHERE C.IDCOMUNIDAD
IN(
SELECT CO.IDCOMUNIDAD
FROM COMUNIDADES CO
WHERE CO.NOMBRE = 'ca�as'
))))GROUP BY P.NOMBRE ORDER BY P.NOMBRE

/*35.	Nombre del  partido  y n�mero total de votos en la comunidad 
de �ca�as�*/

SELECT P.NOMBRE, COUNT(V.IDVOTO) AS TOTAL
FROM PARTIDOS P, VOTOS V
WHERE P.IDPARTIDO
IN(
SELECT CA.IDPARTIDO
FROM CANDIDATOS CA
WHERE CA.IDCANDIDATOS
IN(
SELECT V.IDCANDIDATO
WHERE V.IDCASILLA 
IN(
SELECT C.IDCASILLA
FROM CASILLAS C
WHERE C.IDCOMUNIDAD
IN(
SELECT CO.IDCOMUNIDAD
FROM COMUNIDADES CO
WHERE CO.NOMBRE = 'ca�as'
))))GROUP BY P.NOMBRE ORDER BY P.NOMBRE

/*CREAR UN ALMACENAMIENTO PARA VISULIZAR EL NOMBRE LOS REPRESENTANTES 
DE CASILLAS ,QUE FUNJIERON COMO ESCRUTADORES */  

CREATE PROC ESCRUTADORES
AS 
	SELECT F.NOMBREFUNCIONARIO
	FROM FUNCIONARIOS F
	INNER JOIN CARGOSFC C
	ON C.IDCARGO = F.IDCARGO
	WHERE C.NOMBRE='Escrutador'
GO

exec ESCRUTADORES

/*CREAR PROCEDIMIENTO ALMACENADO PARA VISUALIZAR LOS FUNCIONARIOS CON 
CARGOO "X" Y EDAD "Y" */

CREATE PROCEDURE SP_FUNCIONARIOSX 
@CARGO CHAR(10),
@EDAD INT
AS
	SELECT C.NOMBRE,F.NOMBREFUNCIONARIO, F.EDAD
	FROM FUNCIONARIOS F, CARGOSFC C
	WHERE F.IDCARGO = C.IDCARGO
	AND C.IDCARGO = @CARGO and f.EDAD = @EDAD
GO

SP_FUNCIONARIOSX sec, 24

/*DISOARADOR QUE MUESTRE LAS TABLAS DE FUNCIONARIOSCASILLA CADA QUE SE
INSERTE O MODIFIQUE ALGUN REGISTRO*/

CREATE TRIGGER FUNCIONARIOS 
ON FUNCIONARIOSCASILLA
FOR INSERT,UPDATE
AS
SELECT *FROM FUNCIONARIOS
go

/*DISPARADOR QUE ACTUALICE (INCREMENTE) LOS VOTOS DE UN CANDIDATO CADA 
QUE SE REGISTRA UN VOTO A SU FAVOR */

CREATE TRIGGER INCREMENTA_VOTOS
ON VOTOS
FOR INSERT
AS
UPDATE CANDIDATOS
SET NUMVOTOS=NUMVOTOS+1
FROM INSERTED INNER JOIN CANDIDATOS
ON INSERTED.IDCANDIDATO=CANDIDATOS.IDCANDIDATOS
go

/*INDEX*/

CREATE INDEX INDICEFUNCIONARIO
ON FUNCIONARIOS (NOMBREFUNCIONARIO);


CREATE NONCLUSTERED INDEX INFUNCI
ON FUNCIONARIOS (NOMBREFUNCIONARIO);


/*PARA VER CLAVES DE UNA TABLA  EXEC  sp_helpconstraint  NombreTabla*/
                                                
SP_HELPTEXT INCREMENTA_VOTOS              
                                       