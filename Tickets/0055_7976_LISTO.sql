-- 7976
-- 1000000001122026
-- canche250784@gmail.com
-- 9994233236
-- Usuario pide eliminar su cuenta: canche250784@gmail.com	Usuario informa que no tiene acceso al
--     correo con que registro su aplicación y vinculo su tarjeta, lo cual pide eliminar su cuenta
--     para hacer una cuenta nueva dado que no puede iniciar sesión por que no tiene acceso al correo.
--     Eliminar la cuenta: canche250784@gmail.com
--
--



-----------------------------PRIMERA CUENTA A DAR DE BAJA

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='51c4544e-b250-40d9-977f-ba8b82f195cc';COMMIT;
