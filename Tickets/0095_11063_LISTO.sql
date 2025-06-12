-- 11063
-- "Se valida en el sistema que el número de teléfono 9341144886 esta vinculada en la cuenta con correo myt9jrhts9@privaterelay.appleid.com
--
--
--
-- dba- se valida en sistema que el numero 9341144886 efectivamente  esta asociada a la cuenta myt9jrhts9@privaterelay.appleid.com,
-- sin embargo no es posible realizar solamente el numero de telefono, para este tipo de casos se tienen las siguientes dos opciones.
--
-- Que la cuenta sea dada de baja para poder liberar el numero como se pide, o indicar un correo al que se tenga acceso para poder realizar el cambio
--
-- Indicar opciones a usuario y esperar respesta para proceder con base a la decision tomada.
--
--
-- NOTA: Agente / Se realiza la petición del cliente con las dos opciones, folio en espera de respuesta del cliente.
-- NOTA: Agente / El usuario indica un correo para poder realizar el cambio.
-- "	"El usuario reporta que quiere desvincular su número 934-114-4886 del correo myt9jrhts9@privaterelay.appleid.com para que pueda vincular su número a otro correo que si tenga acceso
-- Fecha: 02/mayo/2025
-- Hora: 10:18 am
--
-- Ezequiel Cortez Rosales
-- 934-114-4886
-- Atendió: GBM
-- Quedamos al pendiente de su pronta respuesta, gracias."
-- "El usuario indica un correo para poder realizar el cambio.
-- Correo: cheecorosales10@gmail.com
-- "	Proceso	Pedro




SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'cheecorosales10@gmail.com' WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'cheecorosales10@gmail.com' WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'cheecorosales10@gmail.com' WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'cheecorosales10@gmail.com' WHERE UIDUSUARIO = '354e195a-f336-4aca-a06c-f40a22b98c3e';COMMIT;

