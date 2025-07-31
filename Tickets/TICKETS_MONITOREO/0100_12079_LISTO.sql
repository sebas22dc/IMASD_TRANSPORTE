-- 12079
-- canchehugo23@gmail.com
-- canchehugo24@gmail.com
-- Usuario desea que se corriga su correo electrónico canchehugo23@gmail.com por canchehugo24@gmail.com
-- "Usuario desea que se corrija un digito en el correo que tiene registrado en su app, el correo que tiene
--
-- Registrado es:
-- canchehugo23@gmail.com y desea cambiarlo al siguiente correo:
-- canchehugo24@gmail.com
-- 5000 0000 00397219
-- hugo armando canche chavez
-- 9991717812"	Cambio de correo canchehugo23@gmail.com por canchehugo24@gmail.com 	Pendiente
-- Mercy



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'canchehugo24@gmail.com' WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'canchehugo24@gmail.com' WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'canchehugo24@gmail.com' WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'canchehugo24@gmail.com' WHERE UIDUSUARIO = '7bef6deb-3b9b-4144-a10a-459572652dbe';COMMIT;




--
--
-- update SINCRONIZADOR.monedero  set icontadorrecarga =icontadorrecarga + 1    where inumerotarjeta =5000000000884213;
-- update SINCRONIZADOR.cambiosmonedero  set DSALDOACTUAL = DSALDOACTUAL + 50,ICONTADORRECARGA = ICONTADORRECARGA+1, DTFECHAMODIFICACION = sysdate where UIDCAMBIOSMONEDERO='388dea4b-7e54-4add-9e9d-84819ee42936'
--
--
--
-- update SINCRONIZADOR.monedero  set icontadorrecarga =icontadorrecarga + 1    where inumerotarjeta =5000000000201483;
-- update SINCRONIZADOR.cambiosmonedero  set DSALDOACTUAL = 100 ,ICONTADORRECARGA = ICONTADORRECARGA+1, DTFECHAMODIFICACION = sysdate where UIDCAMBIOSMONEDERO='8cf0ef03-2915-4a26-b114-3cde226932f6'
--
--
-- update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = '04f93f7d-ca64-4389-ab11-7ad0d0ea581c'; commit;
--
