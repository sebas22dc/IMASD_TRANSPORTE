--------------tarjetas sociales que ya estan sin vigencia
with MonederosBloqueadosPanhash
    as (select ROW_NUMBER() OVER (PARTITION BY t1.SPANHASH ORDER BY t1.DTFECHACREACION DESC) AS RN,
               t1.SPANHASH,
               t1.SESTATUS,
               t1.DTFECHACREACION
        from (select *
              from SINCRONIZADOR.DENEGADOS
              union
              select *
              from SINCRONIZADOR.DENEGADOS_OLD) t1)
   , ultimoRegistroDenegado as (select *
                                from MonederosBloqueadosPanhash
                                where RN = 1)
   , DatosFinales as (SELECT me.INUMTARJETA
--      , count(1)
                           , ME.INUMMONEDERO
                           , me.STIPOTARIFA
                           , ME.UIDESTATUS
                           , ME.UIDESTATUSTARJETA
                           , ME.SPANHASH
                           , UTM.SESTATUS
                           , utm.DTFECHACREACION fechaInsercionTablaDenegados
                           , DTFECHAINICIOVIGENCIA
                           , sysdate - 6 / 24 as dia_hoy
                           , DTFECHAFINVIGENCIA
                      FROM MONEDEROCONSULTAS.ESTADODECUENTA ME
                               join catalogos.TIPOSMONEDERO CTM on ctm.UIDTIPOMONEDERO = ME.UIDTIPOMONEDERO
                               left join ultimoRegistroDenegado UTM on UTM.SPANHASH = ME.SPANHASH
                               join credencializacion.USUARIOSTARJETAS CUT on CUT.UIDTARJETA = ME.UIDTARJETA
                      where 1 = 1
                        and ctm.STIPOMONEDERO = 'NFC')
select *
from DatosFinales t1
where 1 = 1
  and dia_hoy > t1.DTFECHAFINVIGENCIA --> se valida que la tarjeta nfc ya termino su vigencia  social y  ya no deberia estar en el
  and SESTATUS != 'I'
--> se valida que el ultimo registro encontrado en denegados y denegados_OLD  no sea I de insertado es decir que si este en bloqueado por validador
-- group by ME.INUMTARJETA

--   and me.UIDESTATUS != '5e879806-6e1d-4d5b-9610-25f2a681b637'
--   and me.UIDESTATUSTARJETA != '1f752e96-0ecc-4765-b163-259865bfabf0'
;



select *
from MONEDEROCONSULTAS.ESTADODECUENTA
where INUMTARJETA = '5000000000945726'