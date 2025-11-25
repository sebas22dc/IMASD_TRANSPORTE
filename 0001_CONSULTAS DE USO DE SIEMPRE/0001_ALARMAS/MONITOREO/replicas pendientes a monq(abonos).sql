--VALIDA REPLICA MONC A MONQ
select count(0) ALERTA
FROM (select me.uidoperacion,
             me.dtfechaOperacion,
             (select inummonedero from monederocomandos.monedero where uidmonedero = me.uidmonedero)        as iNumMonedero,
             dmonto,
             (select snombre
              from catalogos.tipomovimientos
              where uidtipomovimiento = me.uidtipomovimiento)                                               as sTipoMovimiento
      from monederocomandos.movimientosestadosdecuenta me
      where me.uidoperacion not in (SELECT uidoperacion FROM monederoconsultas.MOVIMIENTOS))
where
--DTFECHAOPERACION > '17/02/25 14:00:00.000000000' and
    DTFECHAOPERACION > sysdate - 1
  and STIPOMOVIMIENTO = 'Abono'
---------------------
--VALIDA REPLICA MONC A MONQ

select uidoperacion, dtfechaoperacion, dmonto
FROM (select me.uidoperacion,
             me.dtfechaOperacion,
             (select inummonedero from monederocomandos.monedero where uidmonedero = me.uidmonedero)        as iNumMonedero,
             dmonto,
             (select snombre
              from catalogos.tipomovimientos
              where uidtipomovimiento = me.uidtipomovimiento)                                               as sTipoMovimiento
      from monederocomandos.movimientosestadosdecuenta me
      where me.uidoperacion not in (SELECT uidoperacion FROM monederoconsultas.MOVIMIENTOS))
where
--DTFECHAOPERACION > '17/02/25 14:00:00.000000000' and
    DTFECHAOPERACION > sysdate - 1
  and STIPOMOVIMIENTO = 'Abono'
