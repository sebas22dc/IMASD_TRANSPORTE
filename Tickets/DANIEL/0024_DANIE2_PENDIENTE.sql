

---Activar tarjeta y monedero
--5000000000127502


UPDATE APP.ESTADODECUENTA SET UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637' WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
update APPMONEDEROQUERY.ESTADODECUENTA set UIDESTATUSMONEDERO='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVOMONEDERO=null, BACTIVOMONEDERO=1,BBAJAMONEDERO=0  WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
update APPTICKETS.ESTADODECUENTA set UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',SESTATUS='ACTIVO',BACTIVO=1,BBAJA=0 WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
--SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';,
update PAGOS.ESTADODECUENTA set UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVO=null, BACTIVO=1,BBAJA=0 WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
update SINCRONIZADOR.ESTATUSMONEDERO SET ESTATUS='ACTIVO', UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVO='d6dba116-b264-4ca1-86c3-b87d16d2fd07',BACTIVO=1,BBAJA=0 WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
UPDATE MONEDEROCONSULTAS.ESTADODECUENTA SET SESTATUS='ACTIVO', BACTIVO=1,BBAJA=0, UIDESTATUS='5e879806-6e1d-4d5b-9610-25f2a681b637',UIDMOTIVO = 'd6dba116-b264-4ca1-86c3-b87d16d2fd07' WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
update monederocomandos.monedero  set BACTIVO=1,BBAJA=0 where uidmonedero = '4b6e6f76-c220-407b-82eb-ac2e8277b005';COMMIT;
update  credencializacion.tarjetas set UIDESTATUSTARJETA='1f752e96-0ecc-4765-b163-259865bfabf0' where inumerotarjeta = 5000000000127502;



SELECT * FROM credencializacion.tarjetas where inumerotarjeta = 5000000000127502

-- SELECT * FROM  APP.ESTADODECUENTA WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';
-- SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA  WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';
-- SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';
-- --SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';,
-- SELECT * FROM PAGOS.ESTADODECUENTA WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';
-- SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO WHERE UIDMONEDERO = '4b6e6f76-c220-407b-82eb-ac2e8277b005';