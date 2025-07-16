-- CONSULTA MONITOR TRANSACCIONES NOMBRE DEL ARCHIVO: TRANSACCIONES_YYYYMMDD
-- RUTA SFTP DE SUBIDA: /sftp/recaudo_admin
SELECT
to_char(DTFECHAOPERACION,'yyyy-mm-dd HH24:MI:SS') "FECHA VALIDADOR", to_char(dtfechacreacion,'yyyy-mm-dd HH24:MI:SS') "FECHA RECIBIDO",sclaveruta "CLAVE DE RUTA", '"' || REPLACE(sruta, '"', '""') || '"' "RUTA", stipotarifa "TIPO TARIFA", to_char(inumeromonedero) "MONEDERO",
to_char(inumerotarjeta) "NO. TARJETA", tipotransaccion "ESTADO OPERACION",estadotransaccion "ESTADO TRANSACCION", IERROR "CODIGO ERROR", dsaldoanterior "SALDO ANTERIOR",
dmonto "MONTO", dsaldo "SALDO DESPUES", inumerotransbordo "NUM. TRANSBORDO", snumeroserie "NUMERO SERIE", snumeroeconomico "AUTOBUS", 
case 
    when slatitud='0' then '+20.98155'
    when length(slatitud)=9 and substr(slatitud,1,3)='+21' then substr(slatitud,1,4)||'0'||substr(slatitud,5,5)
    when length(slatitud)=8 and substr(slatitud,1,3)='+21' then substr(slatitud,1,4)||'00'||substr(slatitud,5,4)
    when length(slatitud)=7 and substr(slatitud,1,3)='+21' then substr(slatitud,1,4)||'000'||substr(slatitud,5,3)
    when length(slatitud)=6 and substr(slatitud,1,3)='+21' then substr(slatitud,1,4)||'0000'||substr(slatitud,5,2)
    when length(slatitud)=5 and substr(slatitud,1,3)='+21' then substr(slatitud,1,4)||'00000'||substr(slatitud,5,1)
    
    when length(slatitud)=8 and substr(slatitud,1,2)='21' then '+'||substr(slatitud,1,3)||'0'||substr(slatitud,4,5)
    when length(slatitud)=7 and substr(slatitud,1,2)='21' then '+'||substr(slatitud,1,3)||'00'||substr(slatitud,4,4)
    when length(slatitud)=6 and substr(slatitud,1,2)='21' then '+'||substr(slatitud,1,3)||'000'||substr(slatitud,4,3)
    when length(slatitud)=5 and substr(slatitud,1,2)='21' then '+'||substr(slatitud,1,3)||'0000'||substr(slatitud,4,2)
    when length(slatitud)=4 and substr(slatitud,1,2)='21' then '+'||substr(slatitud,1,3)||'00000'||substr(slatitud,4,1)
    
    when substr(slatitud,1,2)='20' then '+'||slatitud
    else slatitud
end "LATITUD",

case when slongitud='0' then '-89.62573'
else replace(slongitud,'+','-') end "LONGITUD"

FROM SINCRONIZADOR.viewtransacciones vt where 
DTFECHACREACION >= TO_DATE('06-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS') --LA FECHA INICIAL ES DE DIA ANTERIOR
AND DTFECHACREACION < TO_DATE('07-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS') 
and tipotransaccion <> 'MIFARE DESFire'
and dsaldo >= -12 and inumeromonedero is not null
order by DTFECHAOPERACION asc








-----------------SEBAS





-----------------SEBAS


-- CONSULTA MONITOR TRANSACCIONES NOMBRE DEL ARCHIVO: TRANSACCIONES_YYYYMMDD
-- RUTA SFTP DE SUBIDA: /sftp/recaudo_admin
SELECT
to_char(DTFECHAOPERACION,''yyyy-mm-dd HH24:MI:SS'') "FECHA VALIDADOR", to_char(dtfechacreacion,''yyyy-mm-dd HH24:MI:SS'') "FECHA RECIBIDO",sclaveruta "CLAVE DE RUTA", ''"'' || REPLACE(sruta, ''"'', ''""'') || ''"'' "RUTA", stipotarifa "TIPO TARIFA", to_char(inumeromonedero) "MONEDERO",
to_char(inumerotarjeta) "NO. TARJETA", tipotransaccion "ESTADO OPERACION",estadotransaccion "ESTADO TRANSACCION", IERROR "CODIGO ERROR", dsaldoanterior "SALDO ANTERIOR",
dmonto "MONTO", dsaldo "SALDO DESPUES", inumerotransbordo "NUM. TRANSBORDO", snumeroserie "NUMERO SERIE", snumeroeconomico "AUTOBUS", 
case 
    when slatitud=''0'' then ''+20.98155''
    when length(slatitud)=9 and substr(slatitud,1,3)=''+21'' then substr(slatitud,1,4)||''0''||substr(slatitud,5,5)
    when length(slatitud)=8 and substr(slatitud,1,3)=''+21'' then substr(slatitud,1,4)||''00''||substr(slatitud,5,4)
    when length(slatitud)=7 and substr(slatitud,1,3)=''+21'' then substr(slatitud,1,4)||''000''||substr(slatitud,5,3)
    when length(slatitud)=6 and substr(slatitud,1,3)=''+21'' then substr(slatitud,1,4)||''0000''||substr(slatitud,5,2)
    when length(slatitud)=5 and substr(slatitud,1,3)=''+21'' then substr(slatitud,1,4)||''00000''||substr(slatitud,5,1)
    
    when length(slatitud)=8 and substr(slatitud,1,2)=''21'' then ''+''||substr(slatitud,1,3)||''0''||substr(slatitud,4,5)
    when length(slatitud)=7 and substr(slatitud,1,2)=''21'' then ''+''||substr(slatitud,1,3)||''00''||substr(slatitud,4,4)
    when length(slatitud)=6 and substr(slatitud,1,2)=''21'' then ''+''||substr(slatitud,1,3)||''000''||substr(slatitud,4,3)
    when length(slatitud)=5 and substr(slatitud,1,2)=''21'' then ''+''||substr(slatitud,1,3)||''0000''||substr(slatitud,4,2)
    when length(slatitud)=4 and substr(slatitud,1,2)=''21'' then ''+''||substr(slatitud,1,3)||''00000''||substr(slatitud,4,1)
    
    when substr(slatitud,1,2)=''20'' then ''+''||slatitud
    else slatitud
end "LATITUD",

case when slongitud=''0'' then ''-89.62573''
else replace(slongitud,''+'',''-'') end "LONGITUD"

FROM SINCRONIZADOR.viewtransacciones vt where 
DTFECHACREACION >= TRUNC(SYSDATE - 1)
AND DTFECHACREACION < TRUNC(SYSDATE) 
and tipotransaccion <> ''MIFARE DESFire''
and dsaldo >= -12 and inumeromonedero is not null
order by DTFECHAOPERACION asc
;