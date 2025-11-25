with MonederosBloqueadosPanhash
    as (select ROW_NUMBER() OVER (PARTITION BY t1.SPANHASH ORDER BY t1.DTFECHACREACION DESC) AS RN,
               t1.ID,
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
                           , utm.ID
                           , ME.INUMMONEDERO
                           , me.STIPOTARIFA
                           , ME.UIDESTATUS
                           , ME.UIDESTATUSTARJETA
                           , ME.SPANHASH
                           , UTM.SESTATUS
                           , utm.DTFECHACREACION
                           , DTFECHAINICIOVIGENCIA
                           , sysdate - 6 / 24 as dia_hoy
                           , DTFECHAFINVIGENCIA
                           , ME.UIDMOTIVO
                           , cmm.SMOTIVO
                      FROM MONEDEROCONSULTAS.ESTADODECUENTA ME
                               join catalogos.TIPOSMONEDERO CTM on ctm.UIDTIPOMONEDERO = ME.UIDTIPOMONEDERO
                               left join ultimoRegistroDenegado UTM on UTM.SPANHASH = ME.SPANHASH
                               join credencializacion.USUARIOSTARJETAS CUT on CUT.UIDTARJETA = ME.UIDTARJETA
                               left join catalogos.MOTIVOS CMM on ME.UIDMOTIVO = CMM.UIDMOTIVO
                      where 1 = 1
                        and ctm.STIPOMONEDERO = 'NFC')
   , SocialesSinVigencia as (select inumtarjeta,
                                    UIDMOTIVO,
                                    inummonedero,
                                    stipotarifa,
                                    uidestatus,
                                    uidestatustarjeta,
                                    spanhash,
                                    sestatus,
                                    dtfechacreacion,
                                    dtfechainiciovigencia,
                                    dia_hoy,
                                    dtfechafinvigencia
                                     ,
                                    'Denegado por vigencia' as TipoBloqueo
                                     ,
                                    SMOTIVO
                             from DatosFinales t1
                             where 1 = 1
                               and dia_hoy > t1.DTFECHAFINVIGENCIA --> se valida que la tarjeta nfc ya termino su vigencia  social y  ya no deberia estar en el
                               and SESTATUS != 'I')
   , SocialesPorEstatusMotivo as (select t4.ID
                                       , t4.SESTATUS
                                       , t2.SMOTIVO
                                       , t2.BPERMITIROPERACIONES
                                       , t1.INUMEROTARJETA
                                       , ME.INUMMONEDERO
                                       , t1.UIDESTATUSTARJETA
                                       , ME.UIDESTATUS
                                       , t1.UIDMOTIVO
                                       , cta.STIPOTARIFA
                                       , 'Denegado por estatus y motivo' as TipoBloqueo
                                       , DTFECHAINICIOVIGENCIA
                                       , sysdate - 6 / 24                as dia_hoy
                                       , DTFECHAFINVIGENCIA
                                  from CREDENCIALIZACION.TARJETAS t1

                                           join catalogos.TIPOTARIFAS CTA on t1.UIDTIPOTARIFA = cta.UIDTIPOTARIFA
                                           left join catalogos.MOTIVOS t2 on t1.UIDMOTIVO = t2.UIDMOTIVO
                                           join MONEDEROCONSULTAS.ESTADODECUENTA ME on ME.UIDTARJETA = t1.UIDTARJETA
                                           left join ultimoRegistroDenegado t4 on t4.SPANHASH = t1.SPANHASH
                                           join credencializacion.USUARIOSTARJETAS CUT on CUT.UIDTARJETA = ME.UIDTARJETA

                                  where 1 = 1
                                    and t1.UIDESTATUSTARJETA != '1f752e96-0ecc-4765-b163-259865bfabf0'
                                    and ME.UIDESTATUS = '5e879806-6e1d-4d5b-9610-25f2a681b637'
                                    and t1.UIDMOTIVO is not null
--   and t1.INUMEROTARJETA = 5000000000016782
                                    and t2.BPERMITIROPERACIONES = 0
                                    and ITIPOTARJETA != 0
                                    and t4.SESTATUS != 'I')
select *
from (
/**/
         select TipoBloqueo,
                INUMTARJETA,
                INUMMONEDERO,
                STIPOTARIFA,
                UIDESTATUS,
                UIDESTATUSTARJETA,
                UIDMOTIVO,
                smotivo,
                DTFECHAINICIOVIGENCIA,
                dia_hoy,
                DTFECHAFINVIGENCIA
         from SocialesSinVigencia
         union
         select TipoBloqueo,
                INUMEROTARJETA,
                INUMMONEDERO,
                STIPOTARIFA,
                UIDESTATUS,
                UIDESTATUSTARJETA,
                UIDMOTIVO,
                SMOTIVO,
                DTFECHAINICIOVIGENCIA,
                dia_hoy,
                DTFECHAFINVIGENCIA
         from SocialesPorEstatusMotivo
         /**/
     )
;