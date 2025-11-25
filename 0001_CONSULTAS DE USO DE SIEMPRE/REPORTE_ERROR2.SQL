
----REPORTE DE TARJETAS CON ERROR DENTRO DE UN PERIODO DE TIEMPO.

WITH BASE_NFC AS (
select
INUMEROTARJETA 
,STIPOTARIFA 
,IERROR
,UIDVALIDADOR
,TO_CHAR(DTFECHAOPERACION, 'dd/MM/yyyy') as dia
,TO_CHAR(DTFECHAOPERACION, 'HH24:MI:SS') as hora
from sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC
where 
1=1
AND DTFECHAOPERACION between trunc (sysdate - 7) AND TRUNC(SYSDATE)
AND IERROR <> 0
AND INUMEROTARJETA <>0
AND STIPOTARIFA != 'Persona con Discapacidad'
order by dtfechaoperacion desc
),
Dia_Contador as (
select 
InumeroTarjeta,
stipotarifa,
dia,
hora,
ierror,
UIDVALIDADOR,
ROW_NUMBER() OVER (PARTITION BY InumeroTarjeta,dia ORDER BY hora desc) as ID_DIA
from BASE_NFC
)
,Reporte as (
select * from Dia_Contador where ID_DIA = 1

),
TarjetasConError as (
select inumerotarjeta, sum(ierror) as error_semana  from Reporte
group by inumerotarjeta
)

select t1.* from Reporte t1
join TarjetasConError t2 on t1.inumerotarjeta = t2.inumerotarjeta 
where t2.error_semana >0
order by t1.inumerotarjeta desc,dia,hora;



