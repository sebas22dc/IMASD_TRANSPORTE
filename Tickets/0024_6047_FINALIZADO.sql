--Usuario menciona que no puede ingresar a su app, se observa que registró mal su correo con .con

--carlos_tun_calderon2@hotmail.con
--carlos_tun_claderon2@hotmail.com




SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'carlos_tun_claderon2@hotmail.com' WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'carlos_tun_claderon2@hotmail.com' WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'carlos_tun_claderon2@hotmail.com' WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'carlos_tun_claderon2@hotmail.com' WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b';COMMIT;


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES



