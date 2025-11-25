select ME.INUMTARJETA
     , ME.UIDESTATUS
     , ME.UIDESTATUSTARJETA
     , ME.DTFECHAULTIMOABONO
     , ME.DTFECHAULTIMAOPERACION
     , ME.DSALDO                                                                  saldoMonedero
     , XW.SALDO                                                                   SaldoTarjeta
     , SM.ICONTADORRECARGA
     , SM.ICONTADORRECARGAAPLICADA
     , nvl((select SUM(DSALDOACTUAL)
            FROM SINCRONIZADOR.cambiosmonedero
            where 1 = 1
              AND ICONTADORRECARGA > SM.ICONTADORRECARGAAPLICADA
              AND ICONTADORRECARGA <= SM.ICONTADORRECARGA
              and STARJETA = SM.INUMEROTARJETA), 0)                               abonoPendiente
     , nvl((select SUM(DSALDOACTUAL)
            FROM SINCRONIZADOR.cambiosmonedero
            where 1 = 1
              AND ICONTADORRECARGA > SM.ICONTADORRECARGAAPLICADA
              AND ICONTADORRECARGA <= SM.ICONTADORRECARGA
              and STARJETA = SM.INUMEROTARJETA), 0) + (ME.DSALDO * -1) + XW.SALDO montoFinalAbonar
from monederoconsultas.estadodecuenta ME
         JOIN SINCRONIZADOR.MONEDERO SM on ME.INUMTARJETA = SM.INUMEROTARJETA
         INNER JOIN (select inumerotarjeta
                          , MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
                          , MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION)           AS SALDO
                          , MAX(IERROR) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION)           AS IERROR
                          , MAX(loadtranscounter)                                                  AS loadtranscounter2
                     FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
                     where 1 = 1
                       AND SINCIDENCIA not like 'DEB. PEND.%'
                       AND SINCIDENCIA not like 'SIM. DEB. PEND.%'-->CONDICION PARA EVITAR AGARRAR LOS QUE SEAN REPROCESOS

                     GROUP BY inumerotarjeta) XW ON XW.inumerotarjeta = ME.INUMTARJETA
where dsaldo < - 12
  and dsaldo > -400
  and sestatus = 'ACTIVO'
  and uidestatustarjeta = '1f752e96-0ecc-4765-b163-259865bfabf0';