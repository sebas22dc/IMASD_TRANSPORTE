-- 7582
-- 1000000001198932
--
-- Se valida que el usuario tiene el monedero bloqueado por analisis,
-- revisando que no tiene anomalías de recargas en más de $500 y tampoco de  traspasos y abonos,
-- no se encuentra en la lista negra de monederos.
-- "El usuario informa que no puede utilizar su tarjeta ni su E-Ticket.
-- Al validar la situación, se confirma que su tarjeta está bloqueada por análisis.
-- Se realizó una búsqueda del número de monedero mediante su número de teléfono,
-- ya que no recuerda el número de su tarjeta.
--
-- El usuario ha adjuntado comprobantes de pago correspondientes a sus últimas recargas y
-- solicita el desbloqueo de su cuenta, ya que actualmente no puede agregar su tarjeta ni acceder
-- a la aplicación Va y Ven.
-- Ultimo uso: 12/02/2025 7:26 AM
-- Numero de monedero: 1000000001198932
--
-- Paola Parra
-- paoladmparra@gmail.com
-- 999 553 0153
--
--
-- Atendió IUMC
--
-- Quedo al pendiente de sus comentarios.
-- Saludos."





SELECT * FROM APP.ESTADODECUENTA   WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';
SELECT * FROM PAGOS.ESTADODECUENTA  WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO  WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';
SELECT * FROM MONEDEROCONSULTAS.ESTADODECUENTA WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';
SELECT * FROM monederocomandos.monedero  where uidmonedero = '53f252e8-49d0-4d36-91fa-2bdf9f116084';




UPDATE APP.ESTADODECUENTA SET UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637' WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;
update APPMONEDEROQUERY.ESTADODECUENTA set UIDESTATUSMONEDERO='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVOMONEDERO=null, BACTIVOMONEDERO=1,BBAJAMONEDERO=0  WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;
update APPTICKETS.ESTADODECUENTA set UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',SESTATUS='ACTIVO',BACTIVO=1,BBAJA=0 WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;
--SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';,
update PAGOS.ESTADODECUENTA set UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVO=null, BACTIVO=1,BBAJA=0 WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;
update SINCRONIZADOR.ESTATUSMONEDERO SET ESTATUS='ACTIVO', UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVO='d6dba116-b264-4ca1-86c3-b87d16d2fd07',BACTIVO=1,BBAJA=0 WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;
UPDATE MONEDEROCONSULTAS.ESTADODECUENTA SET SESTATUS='ACTIVO', BACTIVO=1,BBAJA=0, UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVO = 'd6dba116-b264-4ca1-86c3-b87d16d2fd07' WHERE UIDMONEDERO = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;
update monederocomandos.monedero  set BACTIVO=1,BBAJA=0 where uidmonedero = '53f252e8-49d0-4d36-91fa-2bdf9f116084';COMMIT;








