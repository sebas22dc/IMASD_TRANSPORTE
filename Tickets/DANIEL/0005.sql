


--Acompletar la info de la recarga que no llego a monedero --1000000000564476






--pasos para solucion



--- ACTUALIZAR CON UN +1 AL icontadorrecarga PARA QUE SEPA QUE FALTA UNO AL MOMENTO DE QUE SE HAGA EL PASAR POR EL VALIDADOR
select icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =&numBusqueda;


-- INSERTAR EL REGISTRO PARA QUE HAGA MATCH  A LA TABLA SINCRONIZADOR.cambiosmonedero
select * FROM SINCRONIZADOR.cambiosmonedero where starjeta=&numBusqueda order by icontadorrecarga asc;


---aplicar el update y agregar el monto que se debio sumar a la tabla monederoconsultas.estadodecuenta
select * from monederoconsultas.estadodecuenta where inumtarjeta =&numBusqueda;


--



--- se actualiza el numero de recargas por medio del contador
define NumTarjetaCorregir = '';
define UidOperacion = ''
--PRIMERO INSERTAR EL MOVIMIENTO DE RECARGA QUE FALTABA A monederoconsultas.movimientos y A monederocomandos.movimientosestadosdecuenta

    insert into  monederoconsultas.movimientos(UIDMOVIMIENTOS,UIDOPERACION, UIDTIPOOPERACION, UIDTIPOMOVIMIENTO, UIDESTATUSTRANSACCION, UIDMONEDERO, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO, SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION, IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE, SRUTA, SAUTOBUS) values('3546df8e-accf-da7a-e063-0c15000a5122','a67b4522-8d30-4b84-b2b3-4693af59852b','4eb81264-3844-4196-bffb-a9e82d0adfc8','ef008eb7-ea41-46bb-814e-f94979913ceb','5773658c-a461-4429-91ac-2b58083cb881','3de2ec36-4f97-40af-baed-ca725c0cfa62',1000000000564476,	50,	'ABONO',	'Recarga de saldo',null,		'16/05/2025',0,null,1235238,'APP',0,62,12,null,null,null);

    --ahora se inserta en el segundo tabla

        insert into monederocomandos.movimientosestadosdecuenta(UIDMOVIMIENTOESTADODECUENTA,UIDOPERACION, UIDTIPOSMONEDERO, UIDTIPOMOVIMIENTO, UIDTIPOTRANSACCION, DMONTO, SOBSERVACIONES, UIDESTATUS, DTFECHAOPERACION, DTFECHACREACION, DTFECHAMODIFICACION, DTFECHABAJA, BACTIVO, BBAJA, UIDUSUARIOCREACION, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, UIDMONEDERO, IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, BRECARGADO, BCANCELADO, UIDTIPOOPERACION) values('3546eb27-9925-805a-e063-0c15000a8257','a67b4522-8d30-4b84-b2b3-4693af59852b','e7f21096-73e4-4fe9-aed6-ee29947304b0','ef008eb7-ea41-46bb-814e-f94979913ceb','e350f3d3-c742-4a13-9674-edeafc171893',50,null,'5773658c-a461-4429-91ac-2b58083cb881','16/05/2025','16/05/2025',null,null,1,0,'592e0b33-0cd3-469f-9f4a-ff5b43eb8b9a',null,null,'3de2ec36-4f97-40af-baed-ca725c0cfa62',1235238,'APP',0,1,0,'4eb81264-3844-4196-bffb-a9e82d0adfc8');

---Ahora se actualizan los montos de las diferentes tablas

    update  monederoconsultas.estadodecuenta set dsaldo = dsaldo + 50 where inummonedero =1000000000564476;COMMIT;
    update APPMONEDEROQUERY.estadodecuenta set dsaldo = dsaldo + 50 where inummonedero = 1000000000564476;COMMIT;
    update APPTICKETS.estadodecuenta set dsaldo = dsaldo + 50 where inummonedero =1000000000564476;COMMIT;
    update app.estadodecuenta set dsaldo = dsaldo+50 where inummonedero =1000000000564476;COMMIT;
    update pagos.estadodecuenta set dsaldo = dsaldo + 50 where inummonedero =1000000000564476;COMMIT;


update SINCRONIZADOR.cambiosmonedero set  DSALDOACTUAL = DSALDOACTUAL + 50 where UIDCAMBIOSMONEDERO='95677e1d-b70f-4b0b-be1e-8163d1589c56';COMMIT;



-- update sincronizador.monedero icontadorrecarga = icontadorrecarga+1 set where inumerotarjeta =&NumTarjetaCorregir;
-- -- inserta el registro para actualizar el validador cuando se pase la tarjeta de nuevo
-- insert into SINCRONIZADOR.cambiosmonedero(UIDCAMBIOSMONEDERO, UIDLISTACUENTAS, STARJETA, SESTATUSMONEDERO, ICONTADORTRANSACIONES, DSALDOACTUAL, SCRIPTOGRAMARECARGA, ICONTADORRECARGA, DTFECHACREACION, DTFECHAMODIFICACION, DTFECHABAJA, BACTIVO, BBAJA, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, UIDUSUARIOCREACION, ITIPOBLOQUEADO, IDOPERACION, SPANHASH, BAPLICADA, IFOLIOMOVIMIENTO, UIDGRUPORECARGA, BCABECERAGRUPO)
-- values('','',&NumTarjetaCorregir,'I',56,50,'',19,SYSDATE,SYSDATE,'01/01/01',1,0,'592e0b33-0cd3-469f-9f4a-ff5b43eb8b9a','00000000-0000-0000-0000-000000000000','00000000-0000-0000-0000-000000000000',0,'asdasd','dasdasd',0,0,'00000000-0000-0000-0000-000000000000',0);


