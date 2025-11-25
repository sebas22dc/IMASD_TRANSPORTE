--VALIDA REPLICA MONQ A CAMBIOSMONEDERO
select count(0) ALERTA
FROM (select me.uidoperacion,
             me.dtfechaOperacion,
             iNumMonedero,
             dmonto,
             (select snombre
              from catalogos.tipomovimientos
              where uidtipomovimiento = me.uidtipomovimiento) as sTipoMovimiento
      from monederocomandos.movimientosestadosdecuenta me
               inner join monederoconsultas.estadodecuenta e on e.uidmonedero = me.uidmonedero
      where e.stipomonedero = 'NFC'
        and me.uidoperacion not in (SELECT idoperacion FROM SINCRONIZADOR.CAMBIOSMONEDERO))
where
--DTFECHAOPERACION > '17/02/25 14:00:00.000000000' and
    DTFECHAOPERACION > sysdate - 1
  and STIPOMOVIMIENTO = 'Abono'
--------------------------------


--VALIDA REPLICA MONQ A CAMBIOSMONEDERO
select UIDOPERACION, DTFECHAOPERACION, INUMMONEDERO, DMONTO
FROM (select me.uidoperacion,
             me.dtfechaOperacion,
             iNumMonedero,
             dmonto,
             (select snombre
              from catalogos.tipomovimientos
              where uidtipomovimiento = me.uidtipomovimiento) as sTipoMovimiento
      from monederocomandos.movimientosestadosdecuenta me
               inner join monederoconsultas.estadodecuenta e on e.uidmonedero = me.uidmonedero
      where e.stipomonedero = 'NFC'
        and me.uidoperacion not in (SELECT idoperacion FROM SINCRONIZADOR.CAMBIOSMONEDERO))
where
--DTFECHAOPERACION > '17/02/25 14:00:00.000000000' and
    DTFECHAOPERACION > sysdate - 1
  and STIPOMOVIMIENTO = 'Abono'
;

