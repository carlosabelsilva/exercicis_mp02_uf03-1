/* Exercici 2
** Crea la funció sp08_llistaActorsSexe(cadena) que torni
** tots els actors o actrius de la base de dades videoclub
** depenent d'un paràmetre d'entrada, que serà una cadena
** amb dos possibles valors (home,dona).

mysql> desc ACTORS;
+---------------+----------------------+------+-----+---------+-------+
| Field         | Type                 | Null | Key | Default | Extra |
| id_actor      | smallint(5) unsigned | NO   | PRI | NULL    |       |
| nom_actor     | varchar(30)          | YES  | MUL | NULL    |       |
| nacio_actor   | varchar(20)          | YES  |     | NULL    |       |
| anynaix_actor | smallint(5) unsigned | YES  |     | NULL    |       |
| sexe_actor    | varchar(6)           | YES  |     | NULL    |       |

*/

DELIMITER //

/* Canviem a la base de dades videoclub per
*  assegurar-nos que és la base de dades seleccionada. */
USE videoclub//

/* Procedim a esborrar el procediment que volem
*  crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp08_llistaActorsSexe//

/* Procedim a crear el nou procediment amb la 
** clàusula CREATE PROCEDURE seguida del nom del procediment
** i la definició de paràmetres si cal. En aquest cas
** creem un paràmetre d'entrada (IN) que anomenem
** pi_cad_sexe que és el tipus varchar(4) 
** i només podrà ser "home" o "dona".
*/

CREATE PROCEDURE sp08_llistaActorsSexe(
      IN  pi_cad_sexe varchar(4))
      
  BEGIN
    IF pi_cad_sexe!="home" && pi_cad_sexe!="dona" THEN
      SELECT concat("ERROR! Només pots entrar home o dona.") Error;
    ELSE
      SELECT *
      FROM ACTORS
      WHERE sexe_actor=pi_cad_sexe;
    END IF;
  END//

DELIMITER ;

-- mysql> call sp08_llistaActorsSexe("home");
-- mysql> call sp08_llistaActorsSexe("do");

