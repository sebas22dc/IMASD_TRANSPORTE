
select o.soperacion as "OPERACION", co.inumcomercio "CLIENTE", co.scomercio "COMERCIO" , o.sfolioventa "FOLIO", TO_CHAR(trunc(o.dtfechaoperacion), 'dd/MM/yyyy HH24:MI:SS')  "FECHA", to_char(o.dtfechaoperacion, 'HH24:MI') "HORA"
,o.sestatustransaccion "ESTATUS", o.dmontoventa "MONTO DE VENTA",
--o.dmontocobrado "MONTO COBRADO",
o.dmontoventa-(o.dmontoventa*case
    --when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then 0 --OXXO
    when op.uidcomercio='926527d5-bf3a-45eb-95ac-0b458aadaf35' then 2.5 --AKI
    when op.uidcomercio='8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then 2.9 --DUNOSUSA
    when op.uidcomercio='5c1656c3-fe1d-4a63-8bed-68528510434c' then 3.132 --SIX
    when op.uidcomercio='3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then 2.5 --WILLYS
    when co.snombregrupocomercial='COMISARIAS' then 6.38
    else 0
end/100) "MONTO COBRADO",
o.stipomovimiento "TIPO", NVL(o.smotivo,' ') "MOTIVO", o.icantidad "CANTIDAD", o.dsaldoanterior "SALDO ANTERIOR", o.dsaldoactual "SALDO ACTUAL",e.sestatus, co.snombregrupocomercial "GRUPO COMERCIAL",
case
    when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then ltrim(regexp_substr(regexp_substr(op.sdatosadicionales,'[^|]+',1,7),'[^:]+',1,2))--OXXO
    when op.uidcomercio='926527d5-bf3a-45eb-95ac-0b458aadaf35' then regexp_substr(regexp_substr(op.sdatosadicionales,'[^|]+',1,1),'\S+',1,2) --AKI
    when op.uidcomercio='8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then ltrim(regexp_substr(regexp_substr(op.sdatosadicionales,'[^|]+',1,1),'[^:]+',1,2))--DUNOSUSA
    when op.uidcomercio='5c1656c3-fe1d-4a63-8bed-68528510434c' then regexp_substr(regexp_substr(op.sdatosadicionales,'[^|]+',1,2),'\S+',1,2) --SIX
    when op.uidcomercio='3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then regexp_substr(regexp_substr(op.sdatosadicionales,'[^|]+',1,1),'[^:]+',1,2)--WILLYS
    else ltrim(regexp_substr(op.sdatosadicionales,'[^|]+',1,2)) --CIFO
end "SUCURSAL",
case
    --when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then 0 --OXXO
    when op.uidcomercio='926527d5-bf3a-45eb-95ac-0b458aadaf35' then 2.5 --AKI
    when op.uidcomercio='8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then 2.9 --DUNOSUSA
    when op.uidcomercio='5c1656c3-fe1d-4a63-8bed-68528510434c' then 3.132 --SIX
    when op.uidcomercio='3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then 2.5 --WILLYS
    when co.snombregrupocomercial='COMISARIAS' then 6.38
    else 0
end "COMISION"
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
inner join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones op on op.uidoperacion=o.uidoperacion
where o.DTFECHAOPERACION >= TRUNC(SYSDATE - [DESDE_MAS])
AND o.DTFECHAOPERACION < TRUNC(SYSDATE - [HASTA])
order by o.DTFECHAOPERACION desc
;