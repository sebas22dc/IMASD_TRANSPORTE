



-----BAJA LOGICA A USUARIO jesusfaber660@gmail.com - 9993820033
SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';COMMIT;

--SELECTS DE POSTERIOR

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='9cdc5f1f-0adc-4c2a-8aed-7b4f7d2129a5';



----CAMBIO DE CORREO A CUENTA DE USUARIO SOLICITADO jesusfaber660@gmai.com -> jesusfaber660@gmail.com

SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'jesusfaber660@gmail.com' WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'jesusfaber660@gmail.com' WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'jesusfaber660@gmail.com' WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'jesusfaber660@gmail.com' WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5';COMMIT;


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '6e93acdc-ef8c-436c-8c7b-c64c624719f5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
