CREATE DATABASE CICLISMO
GO
USE CICLISMO
GO

CREATE TABLE EQUIPO
(
NOM_EQ CHAR(25) NOT NULL,
DIRECTOR VARCHAR(30)
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
NOMBRE_C VARCHAR(30)NOT NULL,
EDAD INT,
NOM_EQ CHAR(25)NULL
)
GO

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
KM INT NOT NULL,
SALIDA VARCHAR(35) NOT NULL,
LLEGADA VARCHAR(35) NOT NULL,
DORSAL INT,
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
NOMBRE_P CHAR(35)NOT NULL,
ALTURA INT NOT NULL,
CATEGORIA VARCHAR(50) NOT NULL,
N_ETAPA INT NOT NULL,
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
CODIGO CHAR(3) NOT NULL,
TIPO VARCHAR(30)NOT NULL,
PREMIO INT NOT NULL,
COLOR VARCHAR(20)NOT NULL,
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
CODIGO char(3) NOT NULL,
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

INSERT INTO EQUIPO(NOM_EQ, DIRECTOR) VALUES 
('Amore Vita', 'Ricardo Padacci'),
('Artiach', 'Jose Perez'),
('Banesto', 'Miguel Echevarria'),
('Bresciali-Refin', 'Pietro Armani'),
('Carrera', 'Luigi Petroni'),
('Castorama', 'Jean Philip'),
('Euskadi', 'Pedro Txucaru'),
('Gatorade', 'Gian Luca Pacceli'),
('Gewiss', 'Moreno Argentin'),
('Jolly Club', 'Johan Richard'),
('Kelme', 'Alvaro Pino'),
('Lotus Festina', 'Suarez Cuevas'),
('Mapei-Clas', 'Juan Fernandez'),
('Mercatone Uno', 'Ettore Romano'),
('Motorola', 'John Fidwell'),
('Navigare', 'Lonrenzo Sciacci'),
('ONCE', 'Manuel Sainz'),
('PDM', 'Piet Van Der Kruis'),
('Seguros Amaya', 'Minguez'),
('Telecom', 'Morgan Reikcard'),
('TVM', 'Steveens Henk'),
('Wordperfect', 'Bill Gates')
GO

INSERT INTO CICLISTA (DORSAL, NOMBRE_C, EDAD, NOM_EQ) VALUES 
(1, 'Miguel Induroin', 32, 'Banesto'),
(2, 'Pedro Delgado', 35, 'Banesto'),
(3, 'Alex Zulle', 27,'ONCE'),
(4, 'Tony Rominger', 30, 'Mapei-Clas'),
(5, 'Gert-Jan Theunisse', 32, 'TVM'),
(6, 'Adriano Baffi', 33, 'Mercatone Uno'),
(7, 'Massimiliano Lelli', 30, 'Mercatone Uno'),
(8, 'Jean Van Poppel', 33, 'Lotus Festina'),
(9, 'Massimo Podenzana', 34, 'Navigare'),
(10, 'Mario Cipollini', 28, 'Mercatone Uno'),
(11, 'Flavio Giupponi', 31, 'Bresciali-Refin'),
(12, 'Alessio Di Basco', 31, 'Amore Vita'),
(13, 'Lale Cubino', 28, 'Seguros Amaya'),
(14, 'Roberto Pagnin', 33, 'Navigare'),
(15, 'Jesper Skibby', 31, 'TVM'),
(16, 'Dimitri Konishev', 29, 'Jolly Club'),
(17, 'Bruno Leali', 37, 'Bresciali-Refin'),
(18, 'Robert Millar', 37, 'TVM'),
(19, 'Julian Gorospe', 34, 'Banesto'),
(20, 'Alfonso Gutierrez', 29, 'Artiach'),
(21, 'Erwin Nijboe', 31, 'Artiach'),
(22, 'Giorgio Furlan', 32, 'Gewiss'),
(23, 'Lance Armstrong', 27, 'Motorola'),
(24, 'Claudio Chiappucci', 29, 'Carrera'),
(25, 'Gianni Bugno', 32, 'Gatorade'),
(26, 'Mikel Zarrabeitia', 27, 'Banesto'),
(27, 'Laurent Jalabert', 28, 'ONCE'),
(28, 'Jesus Montoya', 33, 'Banesto'),
(29, 'Angel Edo', 28, 'Kelme'),
(30, 'Melchor Mauri', 28, 'Banesto'),
(31, 'Vicente Aparicio', 30, 'Banesto'),
(32, 'Laurent Dufaux', 28, 'ONCE'),
(33, 'Stefano della Santa', 29, 'Mapei-Clas'),
(34, 'Angel Yesid Camargo', 30, 'Kelme'),
(35, 'Erik Dekker', 28, 'Wordperfect'),
(36, 'Gian Matteo Fagnini', 32, 'Mercatone Uno'),
(37, 'Scott Sunderland', 29, 'TVM'),
(38, 'Javier Palacin', 25, 'Euskadi'),
(39, 'Rudy Verdonck', 30, 'Lotus Festina'),
(40, 'Viatceslav Ekimov', 32, 'Wordperfect'),
(41, 'Rolf Aldag', 25, 'Telecom'),
(42, 'Davide Cassani', 29, 'TVM'),
(43, 'Francesco Casagrande', 28, 'Mercatone Uno'),
(44, 'Luca Gelfi', 27, 'Gatorade'),
(45, 'Alberto Elli', 26, 'Artiach'),
(46, 'Agustin Sagasti', 24, 'Euskadi'),
(47, 'Laurent Pillon', 32, 'Gewiss'),
(48, 'Marco Saligari', 29, 'Gewiss'),
(49, 'Eugeni Berzin', 23, 'Gewiss'),
(50, 'Fernando Escartin', 27, 'Mapei-Clas'),
(51, 'Udo Bolts', 30, 'Telecom'),
(52, 'Vladislav Bobrik', 26, 'Gewiss'),
(53, 'Michele Bartoli', 28, 'Mercatone Uno'),
(54, 'Steffen Wesemann', 30, 'Telecom'),
(55, 'Nicola Minali', 28, 'Gewiss'),
(56, 'Andrew Hampsten', 29, 'Banesto'),
(57, 'Stefano Zanini', 28, 'Navigare'),
(58, 'Gerd Audehm', 34, 'Telecom'),
(59, 'Mariano Picolli', 28, 'Mercatone Uno'),
(60, 'Giovanni Lombardi', 28, 'Bresciali-Refin'),
(61, 'Walte Castignola', 26, 'Navigare'),
(62, 'Raul Alcala', 30, 'Motorola'),
(63, 'Alvaro Mejia', 32, 'Motorola'),
(64, 'Giuseppe Petito', 28, 'Mercatone Uno'),
(65, 'Pascal Lino', 29, 'Amore Vita'),
(66, 'Enrico Zaina', 24, 'Gewiss'),
(67, 'Armand de las Cuevas', 28, 'Castorama'),
(68, 'Angel Citracca', 28, 'Navigare'),
(69, 'Eddy Seigneur', 27, 'Castorama'),
(70, 'Sandro Heulot', 29, 'Banesto'),
(71, 'Prudencio Induroin', 27, 'Banesto'),
(72, 'Stefano Colage', 28, 'Bresciali-Refin'),
(73, 'Laurent Fignon', 35, 'Gatorade'),
(74, 'Claudio Chioccioli', 36, 'Amore Vita'),
(75, 'Juan Romero', 32, 'Seguros Amaya'),
(76, 'Marco Giovannetti', 34, 'Gatorade'),
(77, 'Javier Mauleon', 33, 'Mapei-Clas'),
(78, 'Antonio Esparza', 35, 'Kelme'),
(79, 'Johan Bruyneel', 33, 'ONCE'),
(80, 'Federico Echave', 37, 'Mapei-Clas'),
(81, 'Piotr Ugrumov', 33, 'Gewiss'),
(82, 'Edgar Corredor', 30, 'Kelme'),
(83, 'Hernan Buenahora', 32, 'Kelme'),
(84, 'Jon Unzaga', 31, 'Mapei-Clas'),
(85, 'Dimitri Abdoujaparov', 30, 'Carrera'),
(86, 'Juan Martinez Oliver', 32, 'Kelme'),
(87, 'Fernando Mota', 32, 'Artiach'),
(88, 'Angel Camarillo', 28, 'Mapei-Clas'),
(89, 'Stefan Roche', 36, 'Carrera'),
(90, 'Ivan Ivanov', 27, 'Artiach'),
(91, 'Nestor Mora', 28, 'Kelme'),
(92, 'Federico Garcia', 27, 'Artiach'),
(93, 'Bo Hamburger', 29, 'TVM'),
(94, 'Marino Alonso', 30, 'Banesto'),
(95, 'Manuel Guijarro', 31, 'Lotus Festina'),
(96, 'Tom Cordes', 29, 'Wordperfect'),
(97, 'Casimiro Moreda', 28, 'ONCE'),
(98, 'Eleuterio Anguita', 25, 'Artiach'),
(99, 'Per Pedersen', 29, 'Seguros Amaya'),
(100, 'William Palacios', 30, 'Jolly Club')
GO

INSERT INTO ETAPA(N_ETAPA, KM, SALIDA, LLEGADA, DORSAL) VALUES 
(1, 9, 'Valladolid', 'Valladolid', 1),
(2, 180, 'Valladolid', 'Salamanca', 36),
(3, 240, 'Salamanca', 'Caceres', 12),
(4, 230, 'Almendralejo', 'Cordoba', 83),
(5, 170, 'Cordoba', 'Granada', 27),
(6, 150, 'Granada', 'Sierra Nevada', 52),
(7, 250, 'Baza', 'Alicante', 22),
(8, 40, 'Benidorm', 'Benidorm', 1),
(9, 150, 'Benidorm', 'Valencia', 35),
(10, 200, 'Igualada', 'Andorra', 2),
(11, 195, 'Andorra', 'Estacion de Cerler', 65),
(12, 220, 'Benasque', 'Zaragoza', 12),
(13, 200, 'Zaragoza', 'Pamplona', 93),
(14, 172, 'Pamplona', 'Alto de la Cruz de la Demanda', 86),
(15, 207, 'Santo Domingo de la Calzada', 'Santander', 10),
(16, 160, 'Santander', 'Lagos de Covadonga', 5),
(17, 140, 'Cangas de Onis', 'Alto del Naranco', 4),
(18, 195, 'Avila', 'Avila', 8),
(19, 190, 'Avila', 'Destilerias Dyc', 2),
(20, 52, 'Segovia', 'Destilerias Dyc', 2),
(21, 170, 'Destilerias Dyc', 'Madrid', 27)
GO

INSERT INTO PUERTO(NOMBRE_P, ALTURA, CATEGORIA, N_ETAPA, DORSAL) VALUES 
('Alto del Naranco', 565, '1', 10, 30),
('Arcalis', 2230, 'E', 10, 4),
('Cerler-Circo de Ampriu', 2500, 'E', 11, 9),
('Coll de la Comella', 1362, '1', 10, 2),
('Coll de Ordino', 1980, 'E', 10, 7),
('Cruz de la Demanda', 1850, 'E', 11, 20),
('Lagos de Covadonga', 1134, 'E', 16, 42),
('Navacerrada', 1860, '1', 19, 2),
('Puerto de Alisas', 672, '1', 15, 1),
('Puerto de la Morcuera', 1760, '2', 19, 2),
('Puerto de Mijares', 1525, '1', 18, 24),
('Puerto de Navalmoral', 1521, '2', 18, 2),
('Puerto de Pedro Bernardo', 1250, '1', 18, 25),
('Sierra Nevada', 2500, 'E', 2, 26)
GO

INSERT INTO MAILLOT(codigo, tipo, color, premio) VALUES 
('MGE', 'General', 'Amarillo', 8000000),
('MMO', 'Montana', 'Blanco y Rojo', 2000000),
('MMS', 'Mas Sufrido', 'Estrellitas moradas', 2000000),
('MMV', 'Metas volantes', 'Rojo', 2000000),
('MRE', 'Regularidad', 'Verde', 2000000),
('MSE', 'Sprints especiales', 'Rosa', 2000000)
GO

INSERT INTO LLEVAR(N_ETAPA, codigo, dorsal) VALUES 
(1, 'MGE', 1),
(1, 'MMO', 1),
(1, 'MMS', 67),
(1, 'MMV', 1),
(1, 'MRE', 1),
(1, 'MSE', 1),
(2, 'MGE', 1),
(2, 'MMO', 25),
(2, 'MMS', 69),
(2, 'MMV', 16),
(2, 'MRE', 27),
(2, 'MSE', 8),
(3, 'MGE', 1),
(3, 'MMO', 25),
(3, 'MMS', 67),
(3, 'MMV', 16),
(3, 'MRE', 27),
(3, 'MSE', 12),
(4, 'MGE', 1),
(4, 'MMO', 24),
(4, 'MMS', 69),
(4, 'MMV', 17),
(4, 'MRE', 27),
(4, 'MSE', 8),
(5, 'MGE', 2),
(5, 'MMO', 25),
(5, 'MMV', 16),
(5, 'MRE', 27),
(5, 'MSE', 12),
(6, 'MGE', 2),
(6, 'MMO', 26),
(6, 'MMV', 16),
(6, 'MRE', 20),
(6, 'MSE', 12),
(7, 'MGE', 2),
(7, 'MMO', 26),
(7, 'MMV', 33),
(7, 'MRE', 20),
(7, 'MSE', 99),
(8, 'MGE', 4),
(8, 'MMO', 26),
(8, 'MMV', 33),
(8, 'MRE', 20),
(8, 'MSE', 99),
(9, 'MGE', 26),
(9, 'MMO', 26),
(9, 'MMV', 48),
(9, 'MRE', 20),
(9, 'MSE', 99),
(10, 'MGE', 26),
(10, 'MMO', 30),
(10, 'MMV', 48),
(10, 'MRE', 20),
(10, 'MSE', 99),
(11, 'MGE', 3),
(11, 'MMO', 30),
(11, 'MMV', 48),
(11, 'MRE', 20),
(11, 'MSE', 99),
(12, 'MGE', 3),
(12, 'MMO', 30),
(12, 'MMV', 48),
(12, 'MRE', 20),
(12, 'MSE', 99),
(13, 'MGE', 30),
(13, 'MMO', 30),
(13, 'MMV', 48),
(13, 'MRE', 20),
(13, 'MSE', 99),
(14, 'MGE', 30),
(14, 'MMO', 28),
(14, 'MMV', 42),
(14, 'MRE', 20),
(14, 'MSE', 22),
(15, 'MGE', 30),
(15, 'MMO', 28),
(15, 'MMV', 42),
(15, 'MRE', 20),
(15, 'MSE', 22),
(16, 'MGE', 1),
(16, 'MMO', 28),
(16, 'MMV', 42),
(16, 'MRE', 20),
(16, 'MSE', 22),
(17, 'MGE', 1),
(17, 'MMO', 28),
(17, 'MMV', 42),
(17, 'MRE', 20),
(17, 'MSE', 22),
(18, 'MGE', 1),
(18, 'MMO', 26),
(18, 'MMV', 20),
(18, 'MRE', 27),
(18, 'MSE', 10),
(19, 'MGE', 1),
(19, 'MMO', 28),
(19, 'MMV', 42),
(19, 'MRE', 20),
(19, 'MSE', 22),
(20, 'MGE', 1),
(20, 'MMO', 28),
(20, 'MMV', 42),
(20, 'MRE', 20),
(20, 'MSE', 22),
(21, 'MGE', 1),
(21, 'MMO', 2),
(21, 'MMV', 42),
(21, 'MRE', 20),
(21, 'MSE', 22)
GO

SELECT*FROM EQUIPO
SELECT*FROM CICLISTA
SELECT*FROM ETAPA
SELECT*FROM PUERTO
SELECT*FROM MAILLOT
SELECT*FROM LLEVAR

-- Obtener el nombre y la altura de todos los puertos de 1ª categoría.
SELECT NOMBRE_P, ALTURA 
FROM PUERTO 
WHERE CATEGORIA = '1'
GO
-- Obtener el nombre y la edad de todos los ciclistas.
SELECT NOMBRE_C, EDAD 
FROM CICLISTA
GO
-- Obtener el nombre de los ciclistas cuya edad está entre 20 y 30 años.
SELECT NOMBRE_C 
FROM CICLISTA 
WHERE EDAD
BETWEEN 20 AND 30
GO
-- Obtener el número de las etapas donde el nombre de la
-- ciudad de llegada tenga por segunda letra una “O” o donde el
-- nombre de la ciudad de salida lleve dos o más ‘A’s
SELECT N_ETAPA, LLEGADA, SALIDA
FROM ETAPA
WHERE LLEGADA LIKE '_O%' OR SALIDA LIKE '%A%A%'
GO
-- Obtener el nombre de los puertos de 1ª, 2ª o 3ª categoría
SELECT NOMBRE_P FROM PUERTO 
WHERE CATEGORIA
IN ('1','2','3')
GO
-- Obtener todos los datos de aquellos ciclistas de los
-- que se desconocía su edad
SELECT*FROM CICLISTA
WHERE EDAD IS NULL
GO
-- Obtener de los maillots el tipo y el premio en dólares
-- (supongamos que está en pesetas) ($1 = 150 ptas.) de aquellos maillots
-- cuyo premio supere los 100 dólares. SELECT TIPO, PREMIO/150 AS DOLARESFROM MAILLOTWHERE PREMIO/150 >= 100
GO
-- Obtener pares de números de etapas y nombres de
-- puertos ganados por el mismo ciclista. SELECT E.N_ETAPA, NOMBRE_P
FROM PUERTO P, ETAPA E
WHERE E.DORSAL = P.DORSAL
GO
-- Obtener el nombre de los ciclistas compañeros de equipo
-- de ‘Miguel Induráin’ que sean más jóvenes que él. 
SELECT C1.NOMBRE_C,C1.EDAD, C2.NOMBRE_C, C2.EDAD
FROM CICLISTA C1, CICLISTA C2
WHERE C1.NOMBRE_C = 'Miguel Induroin' 
AND C1.NOM_EQ = C2.NOM_EQ
AND C1.EDAD > C2.EDAD
GO
-- Obtener los nombres de los ciclistas pertenecientes al equipo
-- dirigido por ‘Álvaro Pino’. 
SELECT NOMBRE_C
FROM CICLISTA C, EQUIPO AS E
WHERE E.DIRECTOR = 'Alvaro Pino'
AND C.NOM_EQ = E.NOM_EQ
GO
-- Obtener pares nombre de ciclista, número de etapa, de tal
-- forma que dicho ciclista haya ganado dicha etapa. Además la etapa debe
-- superar los 150 km. de recorrido. 
SELECT C.NOMBRE_C, E.N_ETAPA
FROM CICLISTA C, ETAPA E
WHERE C.DORSAL = E.DORSAL
AND E.KM > 150
GO
-- Obtener el nombre de los ciclistas compañeros de equipo de
-- ‘Miguel Induráin’ que sean más jóvenes que él. (Es el mismo enunciado
-- de antes) 
SELECT C1.NOMBRE_C
FROM CICLISTA C1
WHERE C1.NOM_EQ
IN 
(SELECT C2.NOM_EQ
FROM CICLISTA C2
WHERE C2.NOMBRE_C ='Miguel Induroin')
AND C1.EDAD < 
(SELECT C2.EDAD 
FROM CICLISTA C2
WHERE C2.NOMBRE_C='Miguel Induroin')
GO
-- Obtener los nombres de los ciclistas pertenecientes
-- al equipo dirigido por ‘Álvaro Pino’.
SELECT NOMBRE_C
FROM CICLISTA C1
WHERE C1.NOM_EQ
IN 
(
SELECT E1.NOM_EQ 
FROM EQUIPO E1
WHERE E1.DIRECTOR = 'Alvaro Pino'
)
GO
-- Obtener los nombres de los puertos cuya altura es
-- mayor que la media de altura de los puertos de 2ª categoría
SELECT NOMBRE_P
FROM PUERTO
WHERE ALTURA >
(
SELECT AVG(ALTURA)
FROM PUERTO
WHERE CATEGORIA='2'
)
GO
-- Obtener el nº de las etapas ganadas por ciclistas con
-- edad superior a los 30 años.
SELECT E.N_ETAPA, E.DORSAL
FROM ETAPA E
WHERE E.DORSAL 
IN
(
SELECT C.DORSAL
FROM CICLISTA C
WHERE C.DORSAL > 30
)
GO
-- Obtener el número de las etapas ganadas por
-- ciclistas que pertenezcan a equipos cuyo director 
-- tenga un nombre que empiece por ‘A’. 
SELECT E.N_ETAPA
FROM ETAPA E
WHERE E.DORSAL
IN
(
SELECT C.DORSAL
FROM CICLISTA C
WHERE C.NOM_EQ
IN
(SELECT EQ.NOM_EQ
FROM EQUIPO EQ
WHERE EQ.DIRECTOR LIKE 'A%')
)
GO
-- Obtener el nombre de los puertos y de los ciclistas que
-- los hayan ganado que tengan la mayor pendiente. 
SELECT P.NOMBRE_P, C.NOMBRE_C
FROM PUERTO P, CICLISTA C
WHERE C.DORSAL = P.DORSAL
AND P.PENDIENTE >= ALL 
(
SELECT P1.PENDIENTE
FROM PUERTO P1
)
GO
--Obtener el nombre de los puertos y de los ciclistas que
--los hayan ganado, cumpliendo que el puerto no sea el que tenga
--la menor pendiente.
SELECT P.NOMBRE_P, C.NOMBRE_C 
FROM PUERTO P, CICLISTA C
WHERE P.DORSAL = C.DORSAL AND
P.pendiente > ANY (SELECT P1.pendiente FROM Puerto)
GO
--Obtener el nombre de aquellos ciclistas que han 
--llevado un maillot de un premio menor de 2000000. 
SELECT*FROM MAILLOT
SELECT*FROM LLEVAR

SELECT C.NOMBRE_C, L.CODIGO
FROM CICLISTA C, LLEVAR L
WHERE C.DORSAL = L.DORSAL
AND
EXISTS
(
SELECT *
FROM MAILLOT M
WHERE M.PREMIO < 8000000
AND  M.CODIGO = L.CODIGO
)
GO

SELECT C.NOMBRE_C 
FROM Ciclista C, Llevar L
WHERE C.dorsal = L.dorsal 
AND L.codigo 
IN 
(
SELECT M.codigo
FROM Maillot M
WHERE M.premio < 8000000 
)