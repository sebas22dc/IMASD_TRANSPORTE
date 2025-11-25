with ltcsTarjeta as (select TO_CHAR(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS')                                          DTFECHAOPERACION,
                            UIDSINCRONIZACION,
                            UIDDETALLESINCRONIZADOR,
                            ROW_NUMBER() OVER (PARTITION BY nfc.LOADTRANSCOUNTER ORDER BY nfc.DTFECHAOPERACION) AS RN,
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
                     where inumerotarjeta = '5000000000457060')


select ((cte.DSALDOANTERIOR) - cte.DMONTOCOBRADO) - cte.DSALDO as montoAbonado,
       cte.DSALDO,
       cte.DSALDOANTERIOR,
       cte.LOADTRANSCOUNTER
from ltcsTarjeta CTE
         join sincronizador.CAMBIOSMONEDERO SCM on CTE.LOADTRANSCOUNTER = scm.ICONTADORRECARGA and cte.INUMEROTARJETA = scm.STARJETA
where RN = 1
order by LOADTRANSCOUNTER desc