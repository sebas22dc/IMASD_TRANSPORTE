-- 11805
-- 9983311611
-- 9999913160
-- "Se vaída en el sistema y se observa que el número telefónico 9983311611 pertenece a la cuenta con correo albertotellog@gmail.com del usuario Alberto Tello G
-- "	"El usuario reporta que quiere cambiar de numero del 9983311611 al 9999913160
-- Fecha: 12/mayo/2025
-- Hora :11:47am
--
-- Alberto Tello G
-- davidomarfm96@gmail.com
-- 9999913160"	"Cambio de numero telefónico 9983311611 por el número telefónico 9999913160
-- "	Proceso	Pedro





select * from MONEDEROCOMANDOS.MONEDERO where stelefono = '9983311611';
select * from MONEDEROCONSULTAS.ESTADODECUENTA where stelefono = '9983311611';
select * from APP.USUARIO where stelefono = '9983311611';
select * from APP.ESTADODECUENTA where stelefono = '9983311611';
select * from NOTIFICACIONES.FIREBASETOKEN where stelefono = '9983311611';
select * from APPMONEDEROCOMMAND.USUARIO where stelefono = '9983311611';
select * from PAGOS.USUARIO where stelefono = '9983311611';
select * from NOTIFICACIONES.USUARIO where stelefono = '9983311611';

-- NUEVO --- 9999913160 - ANTES --- 9983311611
UPDATE MONEDEROCOMANDOS.MONEDERO SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
UPDATE MONEDEROCONSULTAS.ESTADODECUENTA SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
---ESTOS DOS ES NECESARIO PEDIR AYUDA POR FALTA DE ACCESO

UPDATE APP.USUARIO SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
UPDATE APP.ESTADODECUENTA SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
UPDATE NOTIFICACIONES.FIREBASETOKEN SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
UPDATE PAGOS.USUARIO SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET  STELEFONO = '9999913160' where stelefono = '9983311611';COMMIT;

