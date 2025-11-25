with BaseTraspasosDobles as (select t1.STARJETA, t1.ICONTADORRECARGA, t1.SCRIPTOGRAMARECARGA, count(1)
                             from SINCRONIZADOR.CAMBIOSMONEDERO t1
                             where t1.UIDGRUPORECARGA = '00000000-0000-0000-0000-000000000000'
                             and trunc(t1.DTFECHACREACION) >= trunc(to_date('01/01/2025'))
                             group by t1.STARJETA, t1.ICONTADORRECARGA, t1.SCRIPTOGRAMARECARGA
                             having count(1) > 1
                             order by STARJETA)
   , detalle as (select t3.INUMEROTARJETA,
                        t3.INUMEROMONEDERO,
                        t2.ICONTADORRECARGA,
                        t2.DSALDOACTUAL,
                        t2.SCRIPTOGRAMARECARGA,
                        t2.IDOPERACION,
                        t4.DTFECHAOPERACION
                 from BaseTraspasosDobles t1
                          join SINCRONIZADOR.CAMBIOSMONEDERO t2
                               on t1.STARJETA = t2.STARJETA and t1.ICONTADORRECARGA = t2.ICONTADORRECARGA and
                                  t1.SCRIPTOGRAMARECARGA = t2.SCRIPTOGRAMARECARGA
                          join SINCRONIZADOR.MONEDERO t3 on t2.STARJETA = t3.INUMEROTARJETA
                          left join MONEDEROCONSULTAS.MOVIMIENTOS t4
                                    on t2.IDOPERACION = t4.UIDOPERACION and t3.INUMEROMONEDERO = t4.INUMMONEDERO
                 where t4.SOPERACION = 'Traspaso')
select ROW_NUMBER() OVER (PARTITION BY t1.INUMEROTARJETA,t1.ICONTADORRECARGA,t1.SCRIPTOGRAMARECARGA ORDER BY t1.DTFECHAOPERACION DESC) as id_repeticion
        ,
       t1.*
from detalle t1
join MONEDEROCONSULTAS.ESTADODECUENTA MOE on t1.INUMEROTARJETA = MOE.INUMTARJETA
where
    1=1
AND    t1.DTFECHAOPERACION >= trunc(to_date('01-10-2025'))
and moe.UIDESTATUSTARJETA = '1f752e96-0ecc-4765-b163-259865bfabf0'
and moe.UIDESTATUS = '5e879806-6e1d-4d5b-9610-25f2a681b637'
and MOE.sEstatus = 'ACTIVO'
-- AND DTFECHAOPERACION > trunc(to_date('01-04-2025'))
order by t1.DTFECHAOPERACION desc;
--
-- select * from APPMONEDEROQUERY.TRASPASOS where IFOLIOOPERACION in (403123,403122,403121,403120);
--
-- select *
-- from MONEDEROCONSULTAS.MOVIMIENTOS
-- where INUMMONEDERO = (select INUMEROMONEDERO from SINCRONIZADOR.MONEDERO where INUMEROTARJETA = '5000000000652329')
--   and SOPERACION = 'Traspaso';
--
-- select IFOLIOMOVIMIENTO,
--        INUMMONEDERO,
--        SOPERACION,
--        STIPOMOVIMIENTO,
--        DTFECHAOPERACION,
--        DMONTO,
--        DSALDOACTUAL,
--        DSALDOANTERIOR
-- from MONEDEROCONSULTAS.MOVIMIENTOS
-- where IFOLIOMOVIMIENTO in (403123,403122,403121,403120)
--   and SOPERACION = 'Traspaso'
-- order by IFOLIOMOVIMIENTO;
--
-- select *
-- from SINCRONIZADOR.CAMBIOSMONEDERO t1
-- where STARJETA = '5000000000652329'
-- order by ICONTADORRECARGA;
-- -- 5000000000652329
-- -- 5000000000266245
--
--
-- with Base as (SELECT IN  UMEROTARJETA        as tarjeta,
--                      COUNT(*)              as DebitacionesAplicadas,
--                      sum(NVODMONTOCOBRADO) as totalCobrado
--               FROM SINCRONIZADOR.AJUSTEDEB t1
--               WHERE bProcesado = 1
--                 and (FECHAPROCESADO - (6 / 24)) >= '18/08/2025'
--               GROUP BY INUMEROTARJETA)
--    , BaseMasLtc as (select t1.tarjeta, t2.ICONTADORRECARGA as totalRecargas
--                     from Base t1
--                              join SINCRONIZADOR.MONEDERO t2 on t1.tarjeta = t2.INUMEROTARJETA)
--    , ToTalRecargasListas as (select t1.STARJETA, count(1) as cantidad_recargasListas
--                              from SINCRONIZADOR.CAMBIOSMONEDERO t1
--                                       join base t2 on t1.STARJETA = t2.tarjeta
--                              where t1.BCABECERAGRUPO = 0
--                              --and trunc(t1.DTFECHACREACION) > to_date('20/08/2025')
--                              group by t1.STARJETA)
--    , TotalCriptogramasRepetidos as (select t1.STARJETA, SCRIPTOGRAMARECARGA, ICONTADORRECARGA, count(1)
--                                     from SINCRONIZADOR.CAMBIOSMONEDERO t1
--                                              join base t2 on t1.STARJETA = t2.tarjeta
--                                     where t1.BCABECERAGRUPO = 0
--                                     -- and trunc(t1.DTFECHACREACION) > to_date('20/08/2025')
--                                     group by t1.STARJETA, SCRIPTOGRAMARECARGA, ICONTADORRECARGA)
--    , OperacionesTraspaso as (select t1.IDOPERACION
--                              from SINCRONIZADOR.CAMBIOSMONEDERO t1
--                                       join TotalCriptogramasRepetidos t2 on t1.STARJETA = t2.STARJETA and
--                                                                             t1.SCRIPTOGRAMARECARGA =
--                                                                             t2.SCRIPTOGRAMARECARGA)
-- select t1.tarjeta
-- from BaseMasLtc t1
--          join TotalCriptogramasRepetidos t3 on t1.tarjeta = t3.STARJETA
-- group by t1.tarjeta
