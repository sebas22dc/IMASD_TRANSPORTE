



-----BAJA LOGICA A USUARIO silvialleal779@gmail.com - 9995088003
SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';COMMIT;

--SELECTS DE POSTERIOR

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='4d2fe2c9-d6c5-4077-9060-77400d12d3bd';


--DESVINCULACION DE LAS TARJETAS DE LA CUENTA ANTERIOR


--Se actualizan registros dados de baja

UPDATE APPMONEDEROQUERY.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROQUERY.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1 and (usu.BBAJA = 1 OR usu.BACTIVO = 0)
AND t.BACTIVO = 1 AND usu.stelefono = '9995088003'
);commit;

UPDATE APPMONEDEROCOMMAND.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROCOMMAND.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT am.UIDTARJETA
FROM APPMONEDEROCOMMAND.TARJETAUSUARIO AM
INNER JOIN APPMONEDEROCOMMAND.ESTADODECUENTA AE ON AE.UIDMONEDERO = AM.UIDMONEDERO
INNER JOIN APPMONEDEROCOMMAND.USUARIO USU ON USU.UIDUSUARIO = AM.UIDUSUARIO
INNER JOIN APP.USUARIO USU2 ON USU2.UIDUSUARIO = usu.UIDUSUARIO
WHERE
-- am.snumerotarjeta = 5000000000593414
1=1
AND USU2.BBAJA = 1
AND AM.BACTIVO = 1
AND USU2.stelefono = '9995088003' --and am.snumerotarjeta = 5000000000593414
);
commit;





