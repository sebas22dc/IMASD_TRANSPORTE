----REPORTE DE TARJETAS CON ERROR DENTRO DE UN PERIODO DE TIEMPO.

WITH BASE_NFC AS (select INUMEROTARJETA
                       , STIPOTARIFA
                       , IERROR
                       , UIDVALIDADOR
                       , TO_CHAR(DTFECHAOPERACION, 'dd/MM/yyyy') as dia
                       , TO_CHAR(DTFECHAOPERACION, 'HH24:MI:SS') as hora
                       , DTFECHAOPERACION                        as diahora
                       , DSALDO                                  AS SaldoTarjeta
                       , LOADTRANSCOUNTER
                       , DMONTOCOBRADO
                  from sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC
                  where 1 = 1
                    AND DTFECHAOPERACION between trunc(sysdate - 7) AND TRUNC(SYSDATE-1)
--AND IERROR <> 0
                    AND INUMEROTARJETA <> 0
                    AND STIPOTARIFA != 'Persona con Discapacidad'
                  order by dtfechaoperacion desc)
   , Dia_Contador as (select B.*,
                             ROW_NUMBER() OVER (PARTITION BY B.InumeroTarjeta,B.dia ORDER BY B.hora desc) as ID_DIA
                      from BASE_NFC B)
   , Reporte as (select t1.*
--,t3.dsaldo as SaldoMonedero
                      , t3.uidmonedero
                 from Dia_Contador t1
                          join credencializacion.tarjetas t2 on t1.inumerotarjeta = t2.inumerotarjeta
                          join monederoconsultas.estadodecuenta t3 on t2.uidmonedero = t3.uidmonedero
                 where t1.ID_DIA = 1)
   , TarjetasConError as (select inumerotarjeta, sum(ierror) as error_semana
                          from Reporte
                          group by inumerotarjeta)
   , ReporteUltimaTransaccion as (select t1.*
                                  from Reporte t1
                                           join TarjetasConError t2 on t1.inumerotarjeta = t2.inumerotarjeta
                                  where t2.error_semana > 0)
   , SaldosMovimiento as (select r.*
                               , (select Sum(t1.Dmonto)
                                  from MONEDEROCOMANDOS.movimientosestadosdecuenta t1
                                  where 1 = 1
                                    --and t1.dmonto > 0
                                    and t1.uidmonedero = r.uidmonedero
                                    and t1.dtfechaoperacion < r.diahora
                                  group by r.inumerotarjeta) as SaldoMonederoMovimiento
                          --  ,(select max(ScM.ICONTADORRECARGA) from sincronizador.cambiosmonedero ScM where ScM.DTFECHACREACION < r.diahora and r.inumerotarjeta = ScM.sTarjeta) as MaxConterMovimiento
                          from ReporteUltimaTransaccion r
                          where r.ierror = 2)

select case when (SaldoMonederoMovimiento - DMONTOCOBRADO) > 0 then 'RECHAZADA' else 'SIN SALDO' end
           as estadoError,
       r.*
from SaldosMovimiento r
order by r.inumerotarjeta desc, r.dia, r.hora;

--
--,RecargasMovimiento as (
--select Sum(t1.Dmonto) 
--        from MONEDEROCOMANDOS.movimientosestadosdecuenta t1 
--        join ReporteUltimaTransaccion t2 on t1.uidmonedero = t2.uidmonedero
--        where t1.dmonto > 0 
--          and t1.dtfechaoperacion > t2.diahora
--)
--select * from recargasMovimiento;




