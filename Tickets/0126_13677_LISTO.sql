-- 13677
-- 5000000000135698
-- ingluisordaz@gmil.com
-- luisone44@gmail.com
-- 9999659503
-- "Cambio de correo
-- "	"Usuario reporta que no puede acceder a su cuenta por lo siguiente:
-- Lo que sucede es que me registre en la aplicación con mi número de celular, pero al momento de actualizarse se salió de mi sesión y cuando intente entrar de nuevo me pedía un correo que no di porque eme registre con mi número; intente hacer otra cuenta, pero no me dejaba usar el mismo número porque ya estaba asociado a otra cuenta"		Proceso	Italo


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'luisone44@gmail.com' WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'luisone44@gmail.com' WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'luisone44@gmail.com' WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'luisone44@gmail.com' WHERE UIDUSUARIO = '60bdc369-2082-411d-aff4-7cb87a00d0c3';COMMIT;

