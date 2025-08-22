-- **Queries de comprobación de replicas**
-- **Cambiar prefios segun el ambiente
-- //////////////Comercio Orquestador
/*Comercios */
SELECT *
FROM Prep_Catalogos.Comercios
WHERE uidComercio NOT IN (
    SELECT uidComercio
    FROM Prep_Comercio.Comercios
);
SELECT count(1)
FROM Prep_Catalogos.Comercios
WHERE uidComercio NOT IN (
    SELECT uidComercio
    FROM Prep_Comercio.Comercios
);
-----------



SELECT *
FROM Prep_Catalogos.Paquetes,Prep_Catalogos.Productos
WHERE Paquetes.uidProducto=Productos.uidProducto
AND Paquetes.uidPaquete NOT IN (
    SELECT Paquetes.uidPaquete
    FROM Prep_Comercio.Paquetes
)
AND Paquetes.bActivo=1
AND Paquetes.bBaja=0
AND Productos.bApp=0;

/*Productos*/
SELECT *
FROM Prep_Catalogos.Productos
WHERE uidProducto NOT IN (
    SELECT uidProducto
    FROM Prep_Comercio.Productos    
)
AND bActivo=1
AND bBaja=0
AND bApp=0;



------------------



/*Motivos*/
SELECT *
FROM Prep_Catalogos.Motivos
WHERE uidMotivo NOT IN (
    SELECT uidMotivo
    FROM Prep_Comercio.Motivos
);

/*Paquetes*/
SELECT *
FROM Prep_Catalogos.Paquetes
WHERE uidPaquete NOT IN (
    SELECT uidPaquete
    FROM Prep_Comercio.Paquetes
);
/*Productos*/
SELECT *
FROM Prep_Catalogos.Productos
WHERE uidProducto NOT IN (
    SELECT uidProducto
    FROM Prep_Comercio.Productos
);
/*TipoOperaciones*/
SELECT *
FROM Prep_Catalogos.TipoOperaciones
WHERE uidTipoOperacion NOT IN (
    SELECT uidTipoOperacion
    FROM Prep_Comercio.TipoOperaciones
);
/*Tipotarifas*/
SELECT *
FROM Prep_Catalogos.TipoTarifas
WHERE uidTipoTarifa NOT IN (
    SELECT uidTipoTarifa
    FROM Prep_Comercio.TipoTarifa
);
/*ConfiguracionPaquetes*/
SELECT *
FROM Prep_Catalogos.ConfiguracionPaquetes
WHERE uidConfiguracionPaquete NOT IN (
    SELECT uidConfiguracionPaquete
    FROM Prep_Comercio.ConfiguracionPaquetes
);
/*ConfiguracionProductos*/
SELECT *
FROM Prep_Catalogos.ConfiguracionProductos
WHERE uidConfiguracionProducto NOT IN (
    SELECT uidConfiguracionProducto
    FROM Prep_Comercio.ConfiguracionProductos
);


---COMERCIO ORQUESTADOR UIDESTATUSTARJETA DISPARADOR DE CREDENCIALIZAICION
  select t2.UIDestatusTarjeta,t1.UIDESTATUSTARJETA,t1.dtfechamodificacion,t1.inumerotarjeta
  from prep_credencializacion.tarjetas t1 
  left join prep_COMERCIO.monederostarjetas t2 on t1.inumerotarjeta  =t2.inumtarjeta 
  where  t2.UIDestatusTarjeta is null  or t2.UIDESTATUSTARJETA <> t1.UIDESTATUSTARJETA  
  order by t1.dtfechamodificacion desc











//////////////////////////////////////////////////////
//////////////Comercio Command
/*TipoOperaciones*/
SELECT *
FROM Prep_Catalogos.TipoMovimientos
WHERE uidTipoMovimiento NOT IN (
    SELECT uidTipoMovimiento
    FROM Prep_ComercioComandos.TipoMovimientoReplica
);
/*TipoTransaccion*/
SELECT *
FROM Prep_Catalogos.TipoTransacciones
WHERE uidTipoTransaccion NOT IN (
    SELECT uidTipoTransaccion
    FROM Prep_ComercioComandos.TipoTransaccionReplica
);

/*ConfiguracionPaquetes*/
SELECT *
FROM Prep_Catalogos.ConfiguracionPaquetes
WHERE uidConfiguracionPaquete NOT IN (
    SELECT UIIDCOMERCIOPAQUETECOMISIONES
    FROM Prep_ComercioComandos.COMISIONESPAQUETESREPLICA
);
/*ConfiguracionProductos*/
SELECT *
FROM Prep_Catalogos.ConfiguracionProductos
WHERE uidConfiguracionProducto NOT IN (
    SELECT UIIDCOMERCIOPRODUCTOCOMISIONES
    FROM Prep_Comercio.COMISIONESPRODUCTOSREPLICA
);


////////////////////////////////////////////////////
//////////////Comercio Query
/*Comercios */
SELECT *
FROM Prep_Catalogos.Comercios
WHERE uidComercio NOT IN (
    SELECT uidComercio
    FROM Prep_Comercioconsultas.EstadoDeCuenta
);
/*Operaciones*/
SELECT *
FROM Prep_Comercio.Operaciones
WHERE uidOperacion NOT IN (
    SELECT uidOperacion
    FROM Prep_Comercioconsultas.Operaciones
);



---------CORRECCIONES DE DIFERENCIAS DATOS 
-------------
/*Comercios */
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.Comercios
WHERE uidComercio NOT IN (
    SELECT uidComercio
    FROM Prep_Comercio.Comercios
)

union ALL
/*Motivos*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.Motivos
WHERE uidMotivo NOT IN (
    SELECT uidMotivo
    FROM Prep_Comercio.Motivos
)
UNION ALL
/*Paquetes*/

SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.Paquetes
WHERE uidPaquete NOT IN (
    SELECT uidPaquete
    FROM Prep_Comercio.Paquetes
)

UNION ALL
/*Productos*/

SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.Productos
WHERE uidProducto NOT IN (
    SELECT uidProducto
    FROM Prep_Comercio.Productos
)
UNION ALL
/*TipoOperaciones*/

SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.TipoOperaciones
WHERE uidTipoOperacion NOT IN (
    SELECT uidTipoOperacion
    FROM Prep_Comercio.TipoOperaciones
)
UNION ALL
/*Tipotarifas*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.TipoTarifas
WHERE uidTipoTarifa NOT IN (
    SELECT uidTipoTarifa
    FROM Prep_Comercio.TipoTarifas
)
UNION ALL
/*ConfiguracionPaquetes*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.ConfiguracionPaquetes
WHERE uidConfiguracionPaquete NOT IN (
    SELECT uidConfiguracionPaquete
    FROM Prep_Comercio.ConfiguracionPaquetes
)

UNION ALL

/*ConfiguracionProductos*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.ConfiguracionProductos
WHERE uidConfiguracionProducto NOT IN (
    SELECT uidConfiguracionProducto
    FROM Prep_Comercio.ConfiguracionProductos
)

UNION ALL
-----------------------------------

----Comercio Command

/*TipoOperaciones*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.TipoMovimientos
WHERE uidTipoMovimiento NOT IN (
    SELECT uidTipoMovimiento
    FROM Prep_ComercioComandos.TipoMovimientoReplica
)
UNION ALL

/*TipoTransaccion*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.TipoTransacciones
WHERE uidTipoTransaccion NOT IN (
    SELECT uidTipoTransaccion
    FROM Prep_ComercioComandos.TipoTransaccionReplica
)
UNION ALL

/*ConfiguracionPaquetes*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.ConfiguracionPaquetes
WHERE uidConfiguracionPaquete NOT IN (
    SELECT UIIDCOMERCIOPAQUETECOMISIONES
    FROM Prep_ComercioComandos.COMISIONESPAQUETESREPLICA
)
UNION ALL

/*ConfiguracionProductos*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.ConfiguracionProductos
WHERE uidConfiguracionProducto NOT IN (
    SELECT UIIDCOMERCIOPRODUCTOCOMISIONES
    FROM Prep_ComercioComandos.COMISIONESPRODUCTOREPLICA
)


UNION ALL
--------------Comercio CONSULTAS


/*Comercios */
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Catalogos.Comercios
WHERE uidComercio NOT IN (
    SELECT uidComercio
    FROM Prep_Comercioconsultas.EstadoDeCuenta
)
UNION ALL
/*Operaciones*/
SELECT 'diferencias' as diferencias ,count(1) total_diferencias
FROM Prep_Comercio.Operaciones
WHERE uidOperacion NOT IN (
    SELECT uidOperacion
    FROM Prep_Comercioconsultas.Operaciones
);





-- -- INSERTS UPDATES 





-- INSERT INTO Prep_Comercio.Comercios(UIDCOMERCIO, SCOMERCIO, INUMCOMERCIO, 
-- SRAZONSOCIAL, SRFC, DTFECHACREACION, DTFECHABAJA, UIDESTATUS, BBAJA, BACTIVO, UIDGRUPOCOMERCIAL,SNOMBREGRUPOCOMERCIAL,
-- UIDCAJERO, 
-- UIDTIPOCOMERCIO,
-- SNOMBRETIPOCOMERCIO,
-- SSERIALNUMBERCAJERO, 
-- STERMINALIDCAJERO, 
-- SFTPPATH,
-- SFTPUSER,
-- BENVIARCIFO,
-- IFOLIO, 
-- SHORACONCILIACION, 
-- LIMITQR, 
-- DTULTIMACONCILIACION)

-- SELECT 
-- UIDCOMERCIO, SCOMERCIO, INUMEROCOMERCIO, 
-- SRAZONSOCIAL, SRFC, DTFECHACREACION, DTFECHABAJA, UIDESTATUS, BBAJA, BACTIVO, UIDGRUPOCOMERCIAL, 
-- (select snombre from prep_catalogos.gruposcomerciales where uidgrupo = UIDGRUPOCOMERCIAL)SNOMBREGRUPOCOMERCIAL
-- ,UIDCAJERO
-- ,UIDTIPOCOMERCIO
-- ,null
-- ,null
-- ,null
-- ,null
-- ,null
-- ,0
-- ,null
-- ,SHORACONCILIACION
-- ,null
-- ,null
-- FROM Prep_Catalogos.Comercios
-- WHERE uidComercio NOT IN (
--     SELECT uidComercio
--     FROM Prep_Comercio.Comercios
-- )
-- ;

-- ------------------------

-- /*Paquetes*/
-- INSERT INTO Prep_Comercio.Paquetes(UIDPAQUETE, SNOMBRE, UIDPRODUCTO, IUNIDAD, BACTIVO, BBAJA)
-- SELECT UIDPAQUETE, SNOMBRE, UIDPRODUCTO, IUNIDAD,    BACTIVO, BBAJA
-- FROM Prep_Catalogos.Paquetes
-- WHERE uidPaquete NOT IN (
--     SELECT uidPaquete
--     FROM Prep_Comercio.Paquetes
-- );


-- -- PRODUCTOS


-- INSERT INTO Prep_Comercio.Productos(UIDPRODUCTO, SNOMBRE, SDESCRIPCION, FPRECIOUNITARIO, BAPP, BACTIVO, SLEYENDA1, SLEYENDA2)
-- SELECT UIDPRODUCTO, SNOMBRE, SDESCRIPCION, FPRECIOUNITARIO, BAPP, 
-- BACTIVO, SLEYENDA1, SLEYENDA2
-- FROM Prep_Catalogos.Productos
-- WHERE uidProducto NOT IN (
--     SELECT uidProducto
--     FROM Prep_Comercio.Productos
-- )


-- /*TipoOperaciones*/

-- INSERT INTO Prep_Comercio.TipoOperaciones(UIDTIPOOPERACION, SNOMBRE, BACTIVO, BBAJA, SCLAVE)
-- SELECT UIDTIPOOPERACION, SNOMBRE, BACTIVO, BBAJA,SCLAVE
-- FROM Prep_Catalogos.TipoOperaciones
-- WHERE uidTipoOperacion NOT IN (
--     SELECT uidTipoOperacion
--     FROM Prep_Comercio.TipoOperaciones
-- )



-- -----TipoTarifas

-- INSERT INTO Prep_Comercio.TipoTarifas(UIDTIPOTARIFA, STIPOTARIFA, BACTIVO, BBAJA, SCLAVETIPOTARIFA, ITIPOTARJETA, INUMEROTIPOTARIFA, IMES)
-- SELECT UIDTIPOTARIFA, STIPOTARIFA, BACTIVO, BBAJA, SCLAVETIPOTARIFA, ITIPOTARJETA, INUMEROTIPOTARIFA, IMES
-- FROM Prep_Catalogos.TipoTarifas
-- WHERE uidTipoTarifa NOT IN (
--     SELECT uidTipoTarifa
--     FROM Prep_Comercio.TipoTarifas
-- );




-- /*ConfiguracionPaquetes*/

-- INSERT INTO Prep_Comercio.ConfiguracionPaquetes(UIDCONFIGURACIONPAQUETE, UIDCOMERCIO, UIDPRODUCTO, UIDPAQUETE, DCARGOPORCENTAJE, DPROMOSIONPORCENTAJE, 
-- DCOMISIONPORCENTAJE, DCARGOFIJO, DCOMISIONFIJO, DPROMOCIONFIJO, BAPLICAESQUEMAFIJO, BACTIVO)
-- SELECT UIDCONFIGURACIONPAQUETE, UIDCOMERCIO, UIDPRODUCTO, UIDPAQUETE, DCARGOPORCENTAJE, DPROMOSIONPORCENTAJE, DCOMISIONPORCENTAJE, DCARGOFIJO, DCOMISIONFIJO,
-- DPROMOCIONFIJO, BAPLICAESQUEMAFIJO, BACTIVO
-- FROM Prep_Catalogos.ConfiguracionPaquetes
-- WHERE uidConfiguracionPaquete NOT IN (
--     SELECT uidConfiguracionPaquete
--     FROM Prep_Comercio.ConfiguracionPaquetes
-- )









-- -- ESQUEMA COMERCIOCOMMAND
-- --------------------------
-- /*ConfiguracionPaquetes*/

-- INSERT INTO  Prep_ComercioComandos.COMISIONESPAQUETESREPLICA(UIIDCOMERCIOPAQUETECOMISIONES, UIIDCOMERCIO, UIIDPRODUCTO, UIIDPAQUETE, DCARGOPORCENTAJE, 
-- DPROMOCIONPORCENTAJE, DCARGOFIJO, DCOMISIONFIJO, DPROMOCIONFIJO, DCOMISIONPORCENTAJE, BAPLICAESQUEMAFIJO, BACTIVO, BBAJA)
-- SELECT
-- UIDCONFIGURACIONPAQUETE, UIDCOMERCIO, UIDPRODUCTO, UIDPAQUETE, DCARGOPORCENTAJE, DPROMOSIONPORCENTAJE, 
-- DCARGOFIJO,
-- DCOMISIONFIJO,
-- DPROMOCIONFIJO,
-- DCOMISIONPORCENTAJE,
-- BAPLICAESQUEMAFIJO,
-- BACTIVO, BBAJA
-- FROM Prep_Catalogos.ConfiguracionPaquetes
-- WHERE uidConfiguracionPaquete NOT IN (
--     SELECT UIIDCOMERCIOPAQUETECOMISIONES
--     FROM Prep_ComercioComandos.COMISIONESPAQUETESREPLICA
-- )

-- /*ConfiguracionProductos*/


-- INSERT INTO PREP_COMERCIOCOMANDOS.COMISIONESPRODUCTOREPLICA (UIIDCOMERCIOPRODUCTOCOMISIONES, UIIDCOMERCIO
-- , UIIDPRODUCTO, DCARGOPORCENTAJE, DPROMOCIONPORCENTAJE, DCARGOFIJO, DCOMISIONFIJO, DPROMOCIONFIJO, BAPLICAESQUEMAFIJO, BACTIVO, BBAJA, DCOMISIONPORCENTAJE)
-- SELECT  UIDCONFIGURACIONPRODUCTO, UIDCOMERCIO, UIDPRODUCTO, DCARGOPORCENTAJE, DPROMOSIONPORCENTAJE,
-- DCARGOFIJO,
-- DCOMISIONFIJO,
-- DPROMOCIONFIJO,
-- BAPLICAESQUEMAFIJO,
--  BACTIVO, 
--  BBAJA,
-- DCOMISIONPORCENTAJE
-- FROM Prep_Catalogos.ConfiguracionProductos
-- WHERE UIDCONFIGURACIONPRODUCTO NOT IN (
--     SELECT UIIDCOMERCIOPRODUCTOCOMISIONES
--     FROM Prep_ComercioComandos.COMISIONESPRODUCTOREPLICA
-- )
-- GROUP BY UIDCONFIGURACIONPRODUCTO, UIDCOMERCIO, UIDPRODUCTO, DCARGOPORCENTAJE, DPROMOSIONPORCENTAJE,
-- DCARGOFIJO,
-- DCOMISIONFIJO,
-- DPROMOCIONFIJO,
-- BAPLICAESQUEMAFIJO,
--  BACTIVO, 
--  BBAJA,
-- DCOMISIONPORCENTAJE;

-- /*Comercios */



-- INSERT INTO Prep_Comercioconsultas.EstadoDeCuenta(UIDESTADODECUENTA, UIDCOMERCIO, UIDESTATUS,
-- INUMEROCLIENTE, SCOMERCIO, SRFC, SRAZONSOCIAL, SESTATUS, BACTIVO, BBAJA, DTFECHACREACION, DTFECHABAJA, 
-- DTFECHAULTIMAOPERACION, DTFECHAULTIMAVENTA, UIDGRUPOCOMERCIAL, SNOMBREGRUPOCOMERCIAL,
-- UIDCAJERO, UIDTIPOCOMERCIO, SNOMBRETIPOCOMERCIO, SSERIALNUMBERCAJERO, TERMINALIDCAJERO, DSALDO, DSALDOMINIMO, BPERSONALIMDUT, BENVIARCIFO, SDIRECCIONFISCAL)
-- SELECT 
-- LOWER(
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 1, 8) || '-' || 
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 9, 4) || '-' || 
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 13, 4) || '-' ||
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 17, 4) || '-' ||
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 21)
--          )
-- ,
-- UIDCOMERCIO,UIDESTATUS,INUMEROCOMERCIO, SCOMERCIO,SRFC, SRAZONSOCIAL
-- , (SELECT SESTATUS FROM PREP_CATALOGOS.ESTATUS WHERE UIDESTATUS = UIDESTATUS FETCH FIRST 1 ROWS ONLY)
-- ,BACTIVO, BBAJA
-- ,DTFECHACREACION,DTFECHABAJA,NULL,NULL,UIDGRUPOCOMERCIAL
-- ,(SELECT SNOMBRE FROM PREP_CATALOGOS.GRUPOSCOMERCIALES WHERE UIDGRUPO = UIDGRUPOCOMERCIAL),
-- UIDCAJERO,UIDTIPOCOMERCIO
-- ,(SELECT SNOMBRETIPOCOMERCIO FROM PREP_CATALOGOS.TIPOCOMERCIOS WHERE UIDTIPOCOMERCIO = UIDTIPOCOMERCIO FETCH FIRST 1 ROWS ONLY)
-- ,NULL,NULL
-- ,DSALDOASIGNADO,DSALDOMINIMO,BPERSONALIMDUT,0,SDIRECCIONFISCAL
-- FROM Prep_Catalogos.Comercios
-- WHERE uidComercio NOT IN (
--     SELECT uidComercio
--     FROM Prep_Comercioconsultas.EstadoDeCuenta
-- );








-- ---------------AL FINAL
-- /*Operaciones*/


-- INSERT INTO Prep_Comercioconsultas.Operaciones(UIDOPERACIONES, UIDOPERACION, UIDESTATUSTRANSACCION, 
-- UIDTIPOOPERACION, UIDTIPOMOVIMIENTO, STIPOMOVIMIENTO, SMOTIVO, SESTATUSTRANSACCION, SOPERACION, 
-- ICANTIDAD, DTFECHAOPERACION, UIDCOMERCIO, UIDMOTIVO, SFOLIOVENTA, BPERMITEOPERACIONES, DMONTOCOBRADO, 
-- DMONTOVENTA, DSALDOANTERIOR, DSALDOACTUAL, UIDTIPOPAGO, UIDESTATUSCONCILIACION,
-- DTFECHACONCILIADO, DTFECHACONCILIACION, SCAJA, SSUCURSAL, IFOLIOCONTROL, UIDPRODUCTO, SUBICACION, DMONTOVENTACOMERCIO)
-- SELECT 
-- LOWER(
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 1, 8) || '-' || 
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 9, 4) || '-' || 
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 13, 4) || '-' ||
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 17, 4) || '-' ||
--             SUBSTR (RAWTOHEX (SYS_GUID ()), 21)
--          ) UIDOPERACIONES,
         
-- UIDOPERACION
-- ,()
-- ,UIDTIPOOPERACION,
-- ICANTIDAD,
-- DTFECHAOPERACION,
-- UIDCOMERCIO
-- UIDPRODUCTO,UIDESTATUSOPERACION SPRODUCTO, STIPOOPERACION, , 
-- SDATOSADICIONALES, , DTFECHAOPERACION, BCONFIRMADO,
-- DTFECHACREACION, DTFECHAULTMOD, DTFECHABAJA, BACTIVO, BBAJA, UIDUSUARIOCREACION, 
-- UIDUSUARIOULTMOD, UIDUSUARIOBAJA, UIDCOMERCIO, IFOLIOVENTA, JSONMETADATAPRODUCTO, 
-- IFOLIOCOMERCIO, FMONTO, UIDTIPOPAGO, SCAJA, SSUCURSAL, UIDFOLIOCOMERCIO, BMONEDEROCONFIRMADA, IFOLIOCONTROL
-- FROM Prep_Comercio.Operaciones
-- WHERE uidOperacion NOT IN (
--     SELECT uidOperacion
--     FROM Prep_Comercioconsultas.Operaciones
-- );