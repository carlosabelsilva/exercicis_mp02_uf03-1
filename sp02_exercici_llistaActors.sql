/* Canviem a la base de dades videoclub per
*  assegurar-nos que és la base de dades seleccionada. */
USE videoclub;

-- Modifiquem el delimitador de sentències a //
DELIMITER //

/* Procedim a esborrar el procediment que volem
*  crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS exercici_1_llistaActors//

/* Procedim a crear el nou procediment amb la 
*  clàusula CREATE PROCEDURE seguida del nom del procediment
*  i la definició de paràmetres si cal. En aquest cas no cal. */
CREATE PROCEDURE exercici_1_llistaActors()

-- La clàusula BEGIN indica l'inici del procediment.
  BEGIN

-- A partir d'aquí desenvolupem el procediment en si.

    SELECT nom_actor Nom, anynaix_actor "Any naix."
    FROM   ACTORS
    WHERE  sexe_actor="home";
    
-- La clàusula END indica el final del procediment.
  END//

-- Modifiquem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;