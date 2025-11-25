-- propios de sebastian
-- 5000000000945726
-- 5000000000222661
-- 5000000000613852
----------------------------
-- 5000000000280777
-- 5000000000280697
-- 5000000000190880

-- 5000000000712175
-- 5000000000962406
-- 5000000000449873Z

-- 5000000000352460
-- 5000000000241855

select *
from (select *
      from SINCRONIZADOR.DENEGADOS
      union all
      select *
      from SINCRONIZADOR.DENEGADOS_OLD)
where SPANHASH = (select SPANHASH from credencializacion.tarjetas where inumerotarjeta = :numBusqueda);
select TO_CHAR(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS') DTFECHAOPERACION,
       UIDSINCRONIZACION,
       UIDDETALLESINCRONIZADOR,
       uidvalidador,
       INUMEROTARJETA,
       DMONTOCOBRADO,
       BPROCESADO,
       ICONTADORTRANSACCIONES,
       DTFECHACREACION,
       DTFECHAULTMOD,
       DTFECHABAJA,
       ITRANSBORDO,
       DSALDO,
       DSALDOANTERIOR,
       SINCIDENCIA,
       IDVALIDADOR,
       TOKENTRANSACCION,
       LOADTRANSCOUNTER,
       IERROR,
       BDEBITADO,
       BFIRMADO,
       CERTIFICADO,
       DATEHSM,
       TRANSVALUE,
       PANHASH
FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
where inumerotarjeta = :numBusqueda
order by to_date(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS') desc;
----
select INUMTARJETA,
       INUMMONEDERO,
       DSALDO,
       STIPOTARIFA,
       STELEFONO,
       SESTATUS,
       BACTIVO,
       BBAJA,
       DTFECHAULTIMAOPERACION,
       DTFECHAULTIMOABONO,
       DTFECHACREACION,
       DTFECHABAJA,
       SNOMBRE,
       SAPELLIDOPATERNO,
       SAPELLIDOMATERNO,
       SCORREO,
       SFECHAVIGENCIA,
       DTFECHANACIMIENTO,
       UIDTIPOMONEDERO,
       STIPOMONEDERO,
       UIDMOTIVO,
       SPANHASH,
       UIDTARJETA,
       UIDESTATUSTARJETA,
       UIDESTATUS,
       UIDMOTIVOTARJETA
from monederoconsultas.estadodecuenta
where inumtarjeta = :numBusqueda;
select uidmonedero, icontadorrecarga, icontadorrecargaaplicada
FROM SINCRONIZADOR.monedero
where inumerotarjeta = :numBusqueda;
select UIDCAMBIOSMONEDERO,
       UIDLISTACUENTAS,
       STARJETA,
       SESTATUSMONEDERO,
       ICONTADORTRANSACIONES,
       DSALDOACTUAL,
       SCRIPTOGRAMARECARGA,
       ICONTADORRECARGA,
       TO_CHAR(DTFECHACREACION, 'dd/MM/yyyy HH24:MI:SS')     DTFECHACREACION,
       TO_CHAR(DTFECHAMODIFICACION, 'dd/MM/yyyy HH24:MI:SS') DTFECHAMODIFICACION,
       DTFECHABAJA,
       BACTIVO,
       BBAJA,
       UIDUSUARIOMODIFICACION,
       UIDUSUARIOBAJA,
       UIDUSUARIOCREACION,
       ITIPOBLOQUEADO,
       IDOPERACION,
       SPANHASH,
       BAPLICADA,
       IFOLIOMOVIMIENTO,
       UIDGRUPORECARGA,
       BCABECERAGRUPO
FROM SINCRONIZADOR.cambiosmonedero
where starjeta = :numBusqueda
order by icontadorrecarga DESC;
select *
from monederoconsultas.movimientos
where dmonto > 0
  and inummonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda)
order by dtfechaoperacion asc;
select *
from MONEDEROCOMANDOS.movimientosestadosdecuenta
where uidmonedero = (select uidmonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda)
order by dtfechaoperacion asc;
-----
select *
from monederoconsultas.movimientos
where inummonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda)
order by dtfechaoperacion desc;
select ID,
       SPANHASH,
       SCRIPTOGRAMA,
       ICONTADORRECARGA,
       SESTATUS,
       TO_CHAR(dtFechaCreacion, 'dd/MM/yy HH:mm:ss'),
       DTFECHAMODIFICACION,
       DTFECHABAJA,
       BACTIVO,
       BBAJA,
       UIDUSUARIOMODIFICACION,
       UIDUSUARIOBAJA,
       UIDUSUARIOCREACION,
       IMONTORECARGA,
       INUMEROMONEDERO,
       INUMEROTARJETA,
       UIDCAMBIOSMONEDERO
from sincronizador.recargas
where inumerotarjeta = :numBusqueda
order by dtFechaCreacion;
-----------------------------------------
-- --
select t2.SNOMBRE,t1.*
from COMERCIO.OPERACIONES t1
         join comercio.ESTATUSTRANSACCION t2 on t2.UIDESTATUSTRANSACCION = t1.UIDESTATUSOPERACION
where t1.IFOLIOVENTA = '15668136';
-- -- select * from SINCRONIZADOR.CAMBIOSMONEDERO where IDOPERACION  ='4f19f95f-81f2-4db0-b201-baa446db7124';
-- --
-- select * from SINCRONIZADOR.CAMBIOSMONEDERO where IDOPERACION = '121626e7-1079-4af2-b53f-99ed9aabb4d3';
--
-- select * from MONEDEROCONSULTAS.ESTADODECUENTA where INUMMONEDERO in (1000000000455987);
--
-- select * from COMERCIO.MONEDEROSTARJETAS where INUMTARJETA in (5000000000203312,5000000001146888);
-- select UIDMONEDERO,INUMMONEDERO,INUMTARJETA from MONEDEROCONSULTAS.ESTADODECUENTA where INUMTARJETA in (5000000000203312,5000000001146888);
-- -- -- select * from MONEDEROCONSULTAS.ESTADODECUENTA where INUMTARJETA = '5000000000183990';
-- -- -- select * from CATALOGOS.ESTATUS;
-- -- --
-- -- select * from SINCRONIZADOR.CAMBIOSMONEDERO where STARJETA = '5000000000183990' order by ICONTADORRECARGA desc
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- --
-- -- WITH corte AS (
-- --   SELECT TO_DATE('19/09/2025 15:00:00','DD/MM/YYYY HH24:MI:SS') ts FROM dual
-- -- )
-- -- SELECT t1.INUMEROTARJETA,
-- --        MAX(LOADTRANSCOUNTER) AS LOADTRANSCOUNTER,
-- --        t2.ICONTADORRECARGA,
-- --        t2.ICONTADORRECARGAAPLICADA
-- -- FROM   SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
-- --  join sincronizador.MONEDERO t2 on t1.INUMEROTARJETA = t2.INUMEROTARJETA
-- -- WHERE  DTFECHAOPERACION < (SELECT ts FROM corte)
-- -- and     t1.LOADTRANSCOUNTER <> ICONTADORRECARGA
-- -- GROUP  BY t1.INUMEROTARJETA, t2.ICONTADORRECARGA, t2.ICONTADORRECARGAAPLICADA;
-- --
-- --
-- --
-- -- select INUMEROTARJETA,INUMEROMONEDERO,ICONTADORRECARGA, ICONTADORRECARGAAPLICADA from SINCRONIZADOR.MONEDERO
-- -- where INUMEROTARJETA = 'poner tarjeta aqui';
-- -- select * from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
-- -- where  INUMEROTARJETA= 'poner tarjeta aqui'
-- -- order by DTFECHAOPERACION desc;
-- --
-- --
-- --
-- -- SELECT COUNT(1) as trx_sin_saldo
-- -- FROM   SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
-- -- WHERE  t1.DTFECHAOPERACION BETWEEN ((SYSDATE-6/24) - (20/1440)) AND (SYSDATE -6/24)
-- -- AND    t1.IERROR = 2;
-- --
-- --
-- -- select * from SINCRONIZADOR.TARIFAS_BKUP
-- -- ;
--
--
-- select *
-- from COMERCIO.OPERACIONES
-- where IFOLIOVENTA = '13455000'





