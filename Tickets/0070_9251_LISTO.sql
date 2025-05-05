9251
5000000000565252
"Se valida en la consulta de BD, que el número de tarjeta 5000000000565252 esta
en BAJA_APPQ y BAJA_APPC, pero ACTIVA en los correos yazglezmed05@gmail.com y aleyaz.gm@gmail.com
dba- en revision se detecta que el correo aleyaz.gm@gmail.com, se encuentra dado de baja,
este proceso tuvo que ser por parte del uusario, la tarjeta se encuentra parcialmente
asociada a la cuenta de correo yazglezmed05@gmail.com, al revisar los
esquemas se detecta un problema parcial donde no esta correcto los datos al no estar homologados
por lo que se avanza para realizar desvinculacion y que el usuario nuevamente pueda vincular
."	"Usuario reporta que intentó vincular su tarjeta a la aplicación y
le aparece un mensaje que ya está vinculada por lo que no la puede vincular con su cuenta actual.
Número de tarjeta: 5000000000565252
Correo: aleyaz.gm@gmail.com
Número telefónico: 9993632242
Nombre: Yazmin Gonzalez"	Desvincular y liberar el número de tarjeta 5000000000565252
    Proceso



UPDATE APPMONEDEROQUERY.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROQUERY.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000565252'
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
AND AM.BACTIVO = 1
AND am.snumerotarjeta = '5000000000565252' --and am.snumerotarjeta = 5000000000593414
);
commit;