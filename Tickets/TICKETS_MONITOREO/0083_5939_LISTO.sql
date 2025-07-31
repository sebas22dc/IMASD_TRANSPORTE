-- 5939
-- 5000000000884423
-- wilialeg@gmail.com
-- elringdewwe@gmail.com
-- "se valida la tarjeta y muestra que esta asociada
-- al correo wilialeg@gmail.com, el cual se muestra como eliminado
--
-- dba-  se determina que la tarjeta esta asociada a una cuenta
-- que el usuario marco para eliminar  sin embargo, no se desvinculo previamente la tarjeta.
-- por lo que se realiza el proceso para desvincular la tarjeta de
-- esa cuenta."
-- Usuario reporta que no puede vincular su tarjeta a su app debido a
-- que ésta le arroja el mensaje de que ya se encuentra vinculada.
-- Se valida y se observa que la tarjeta esta vinculada en otra cuenta diferente.
-- Pendiente





SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='6e7a0eaa-03cc-43d6-bee4-68699af1d853';COMMIT;



----DESVINCULAR LAS TARJETAS DE LA SEGUNDA CUENTA, SOLO ESA CUENTA TIENE TARJETAS ASOCIADAS


--Se actualizan registros dados de baja

UPDATE APPMONEDEROQUERY.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROQUERY.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APP.USUARIO usu ON t.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1 and (usu.BBAJA = 1 OR usu.BACTIVO = 0)
AND t.BACTIVO = 1 AND usu.UIDUSUARIO = '6e7a0eaa-03cc-43d6-bee4-68699af1d853'
);commit;