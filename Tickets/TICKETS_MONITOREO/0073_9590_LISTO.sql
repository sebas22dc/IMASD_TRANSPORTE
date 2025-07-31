-- 9590
-- samgomaster@gmail.com
-- 9993671623
-- 9995530658
-- Usuario desea hacer cambio de número teléfonico para poder acceder a su cuenta
-- "Usuario menciona que cambió de número telefónico y de dispositivo,
-- por lo que no puede acceder a su cuenta de la App. Solicita puedan cambiar
-- el número telefónico para poder tener acceso.
-- Santiago Jesús Gonzalez Hoyos
-- samgomaster@gmail.com
-- Número anterior: 9993671623
-- Número nuevo: 9995530658"
--     "Cambiar el número telefónico: 9993671623
-- por este nuevo: 9995530658"	Proceso	Amely






------------VERSION NUEVA

select * from MONEDEROCOMANDOS.MONEDERO where stelefono = '9993671623';
select * from MONEDEROCONSULTAS.ESTADODECUENTA where stelefono = '9993671623';
select * from APP.USUARIO where stelefono = '9993671623';
select * from APP.ESTADODECUENTA where stelefono = '9993671623';
select * from NOTIFICACIONES.FIREBASETOKEN where stelefono = '9993671623';
select * from APPMONEDEROCOMMAND.USUARIO where stelefono = '9993671623';
select * from PAGOS.USUARIO where stelefono = '9993671623';
select * from NOTIFICACIONES.USUARIO where stelefono = '9993671623';

-- NUEVO --- 9995530658 - ANTES --- 9993671623
UPDATE MONEDEROCOMANDOS.MONEDERO SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
UPDATE MONEDEROCONSULTAS.ESTADODECUENTA SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
---ESTOS DOS ES NECESARIO PEDIR AYUDA POR FALTA DE ACCESO

UPDATE APP.USUARIO SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
UPDATE APP.ESTADODECUENTA SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
UPDATE NOTIFICACIONES.FIREBASETOKEN SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
UPDATE PAGOS.USUARIO SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET  STELEFONO = '9995530658' where stelefono = '9993671623';COMMIT;


