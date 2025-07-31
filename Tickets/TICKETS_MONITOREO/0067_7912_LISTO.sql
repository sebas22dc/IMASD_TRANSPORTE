7912
9995730356
"Se debe eliminar la cuenta:
felipe02_12@hotmail.com

Debe permanecer la cuenta:
felipe020202_21@hotmail.com
Dba- confirmar la baja de la cuenta indicada pues tiene
18 de saldo el monedero virtual asociado
Respondió usuario que si quiere la eliminación aunque cuente con saldo
dba- se procede con eliminacion de acuerdo a solicitud de usuario"
    "Usuario solicitia eliminar la cuenta que tiene asociado a su numero 9995730356, la cuenta que desea

Eliminar es felipe02_12@hotmail.com

Felipe Edilberto Silveira Chuc
9995730356
felipe020202_21@hotmail.com"
    "Eliminar cuenta con correo:
felipe02_12@hotmail.com

NOTA: Confirmo el usuario que se realice la eliminación de la cuenta aunque tenga saldo su monedero.

"	Proceso







SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='cf8508a7-1514-4813-a74e-9d1dd0a2e157';COMMIT;

----DESVINCULAR LAS TARJETAS DE LA SEGUNDA CUENTA, SOLO ESA CUENTA TIENE TARJETAS ASOCIADAS