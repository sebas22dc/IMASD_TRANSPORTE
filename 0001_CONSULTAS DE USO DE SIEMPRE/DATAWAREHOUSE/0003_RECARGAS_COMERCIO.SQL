select distinct CCO.UIDOPERACION as                    UIDOPERACION,
                'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION,
                CCO.UIDCOMERCIO                        UIDCOMERCIO,
                CCO.DTFECHAOPERACION                   FECHAKEY,
                CCO.DTFECHAOPERACION                   TIEMPOKEY,
                MCE.UIDTIPOMONEDERO                    UIDTIPOMON,
                'Cargo'                                TIPOMOVIMIENTO,
                CCo.SFOLIOVENTA                        FOLIO,
                to_char(CCDO.SNUMEROMONEDERO)          INUMMONEDERO,
                MCE.UIDTIPOTARIFA                      UIDTIPOTARIFA,
                (CCO.DMONTOVENTA * -1)                 MONTO,
                1                                      NUMTRX
from COMERCIOCONSULTAS.operaciones CCO
         join COMERCIOCONSULTAS.DETALLEOPERACIONES CCDO on CCDO.UIDOPERACION = CCO.UIDOPERACION
    and CCDO.STIPOMOVIMIENTO =
        'Cargo' --> se agrega condicion porque aparecen unos abonos en detalles, posible tema con cancelados
         inner join comercio.comercios co on co.uidcomercio = CCO.uidcomercio
         inner join catalogos.estatus e on e.uidestatus = co.uidestatus
         left join comercio.operaciones op on op.uidoperacion = CCO.uidoperacion

         left join MONEDEROCONSULTAS.ESTADODECUENTA MCE on MCE.inummonedero = CCDO.snumeromonedero
where trunc(CCO.DTFECHAOPERACION) >= trunc(TO_DATE('14-08-2025'))
  AND trunc(CCO.DTFECHAOPERACION) < trunc(TO_DATE('15-08-2025'))
  and CCO.SESTATUSTRANSACCION = 'CONFIRMADA'
--   and cco.SFOLIOVENTA = '10909399'
order by CCO.DTFECHAOPERACION desc;


--
-- select *
-- from COMERCIOCONSULTAS.DETALLEOPERACIONES
-- where UIDOPERACION = '63145204-683d-48c2-9ebc-fca2dbd571c3';
-- -----------------
-- WITH BASE AS (select distinct CCO.UIDOPERACION as                    UIDOPERACION,
--                               'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION,
--                               CCO.UIDCOMERCIO                        UIDCOMERCIO,
--                               CCO.DTFECHAOPERACION                   FECHAKEY,
--                               CCO.DTFECHAOPERACION                   TIEMPOKEY,
--                               MCE.UIDTIPOMONEDERO                    UIDTIPOMON,
--                               'Cargo'                                TIPOMOVIMIENTO,
--                               CCo.SFOLIOVENTA                        FOLIO,
--                               to_char(CCDO.SNUMEROMONEDERO)          INUMMONEDERO,
--                               MCE.UIDTIPOTARIFA                      UIDTIPOTARIFA,
--                               (CCO.DMONTOVENTA * -1)                 MONTO,
--                               1                                      NUMTRX
--               from COMERCIOCONSULTAS.operaciones CCO
--                        join COMERCIOCONSULTAS.DETALLEOPERACIONES CCDO on CCDO.UIDOPERACION = CCO.UIDOPERACION
--                   and CCDO.STIPOMOVIMIENTO =
--                       'Cargo' --> se agrega condicion porque aparecen unos abonos en detalles, posible tema con cancelados
--                        inner join comercio.comercios co on co.uidcomercio = CCO.uidcomercio
--                        inner join catalogos.estatus e on e.uidestatus = co.uidestatus
--                        left join comercio.operaciones op on op.uidoperacion = CCO.uidoperacion
--
--                        left join MONEDEROCONSULTAS.ESTADODECUENTA MCE on MCE.inummonedero = CCDO.snumeromonedero
--               where trunc(CCO.DTFECHAOPERACION) >= trunc(TO_DATE('01-08-2025'))
--                 AND trunc(CCO.DTFECHAOPERACION) < trunc(TO_DATE('01-09-2025'))
--                 and CCO.SESTATUSTRANSACCION = 'CONFIRMADA'
-- --   and cco.SFOLIOVENTA = '10909399'
--               order by CCO.DTFECHAOPERACION desc)
-- SELECT 'RED', TRUNC(BD.FECHAKEY) Dia, count(1) trx, sum(bd.MONTO) monto
-- from BASE BD
-- group by trunc(BD.FECHAKEY)
-- order by trunc(BD.FECHAKEY)