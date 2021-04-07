/* sp03_problema_001_CognomNom.sql
 *  Una empresa emmagatzema les dades dels seus 
 *  treballadors en una taula anomenada "TREBALLADORS" 
 *  a la base de dades anomenada LLIBRERIA.
 *  Consta de 8 activitats*/

  USE LLIBRERIA;
  
-- mysql> show tables;
-- +---------------------+
-- | Tables_in_LLIBRERIA |
-- +---------------------+
-- | LLIBRES             |
-- +---------------------+
-- 1 row in set (0.00 sec)

  
 --  A  - Eliminem la taula TREBALLADORS, si existeix.
  DROP TABLE IF EXISTS TREBALLADORS;
 --  B - Creem la taula TREBALLADORS amb la següent informació. 

  CREATE TABLE TREBALLADORS (
   dni CHAR (8),
   nom VARCHAR (20),
   cognom VARCHAR (20),
   sou DECIMAL (6,2),
   nombre_fills INT,
   seccio VARCHAR (20),
   PRIMARY KEY (dni)
  );

-- mysql>   CREATE TABLE TREBALLADORS (
    -- ->    dni CHAR (8),
    -- ->    nom VARCHAR (20),
    -- ->    cognom VARCHAR (20),
    -- ->    sou DECIMAL (6,2),
    -- ->    nombre_fills INT,
    -- ->    seccio VARCHAR (20),
    -- ->    PRIMARY KEY (dni)
    -- ->   );
-- Query OK, 0 rows affected (0.11 sec)
-- mysql> desc TREBALLADORS;
-- +--------------+--------------+------+-----+---------+-------+
-- | Field        | Type         | Null | Key | Default | Extra |
-- +--------------+--------------+------+-----+---------+-------+
-- | dni          | char(8)      | NO   | PRI |         |       |
-- | nom          | varchar(20)  | YES  |     | NULL    |       |
-- | cognom       | varchar(20)  | YES  |     | NULL    |       |
-- | sou          | decimal(6,2) | YES  |     | NULL    |       |
-- | nombre_fills | int(11)      | YES  |     | NULL    |       |
-- | seccio       | varchar(20)  | YES  |     | NULL    |       |
-- +--------------+--------------+------+-----+---------+-------+
-- 6 rows in set (0.00 sec)

 -- 1 - Introduïu 6 registres:
 -- INSERT INTO tbl_name (a,b,c) VALUES(1,2,3),(4,5,6),(7,8,9);
    INSERT INTO TREBALLADORS (dni,nom,cognom,sou,nombre_fills,seccio)
    VALUES('12345678', 'Joan', 'Perez', 300, 2, 'Comptabilitat'),
    VALUES('25896314', 'Pere', 'Garcia', 300, 0, 'Vendes');
    
-- mysql>     INSERT INTO TREBALLADORS (dni,nom,cognom,sou,nombre_fills,seccio)
--     ->     VALUES('12345678', 'Joan', 'Perez', 300, 2, 'Comptabilitat');
-- Query OK, 1 row affected (1.74 sec)

 -- 2 - Elimineu el procediment anomenat "sp_treb_sous" si existeix:


 -- 3 - Creeu un procediment emmagatzemat anomenat "sp_treb_sous" que seleccioni el nom, 
 -- cognom i sou de tots els treballadors.

DELIMITER //
CREATE PROCEDURE sp_treb_sous()
  BEGIN
    SELECT ?????
    FROM   ?????
  END //
DELIMITER ;

 -- 4 - Executeu el procediment creat anteriorment.

CALL sp_treb_sous;
-- +------+--------+--------+
-- | Nom  | Cognom | Sou    |
-- +------+--------+--------+
-- | Joan | Perez  | 300.00 |
-- | ???? | ?????  | ???.00 |
-- | ???? | ?????  | ???.00 |
-- | ???? | ?????  | ???.00 |
-- | ???? | ?????  | ???.00 |
-- | ???? | ?????  | ???.00 |
-- +------+--------+--------+

 -- 5 - Elimineu el procediment anomenat "sp_treb_fills" si existeix:
 

 -- 6 - Creeu un procediment emmagatzemat anomenat "sp_treb_fills"
 -- que seleccioni el nom, 
 -- cognom i la quantitat de fills dels treballadors AMB FILLS.

DELIMITER //
CREATE PROCEDURE sp_treb_fills()
  BEGIN
    SELECT ?????
    FROM   ?????
    WHERE  nombre_fills > 0;
  END //
DELIMITER ;

 -- 7 - Executeu el procediment creat anteriorment.

CALL sp_treb_fills;
-- +------+--------+--------------+
-- | Nom  | Cognom | Nombre Fills |
-- +------+--------+--------------+
-- | Joan | Perez  |            2 |
-- +------+--------+--------------+

 -- 8 - Actualitzeu la quantitat de fills d'algun empleat sense fills
 -- executant la comanda UPDATE i torneu a executar el procediment 
 -- per verificar que ara si apareix a la llista.

UPDATE TREBALLADORS
SET    ????
WHERE  ????;   
-- Pere Garcia sumar-li un fill 

CALL sp_treb_fills;
-- +------+--------+--------------+
-- | Nom  | Cognom | Nombre Fills |
-- +------+--------+--------------+
-- | Joan | Perez  |            2 |
-- | Pere | Garcia |            1 |
-- +------+--------+--------------+

