

use STG_TRANSPORTE
   SELECT CONVERT(VARCHAR(10),dtFechaLogueo,103) Fecha, sUserName usuario,
sNombres NombreUsuario, semail Correo,sNombrePerfil as Perfil, min(dtFechaLogueo) PrimerIngreso,
max(dtFechaLogueo) UltimoIngreso
, case when count(*)=1 and CONVERT(VARCHAR(10),dtFechaLogueo,103) is null 
and  min(dtFechaLogueo) is null 
and max(dtFechaLogueo) is null then 0 else  count(*) end TotalIngresos
,UA.sestatus as Estatus
from  dbo.users_aty UA
left join dbo.Logueos_Exitosos LE  on UA.UidUsuario = Le.UidUSuario
where 1=1
and ua.sEstatus = 'ACTIVO' 
AND UA.sNombrePerfil NOT IN ('Superadministrador','Super MRP')
--and dtFechaLogueo >= getdate()-7
group by CONVERT(VARCHAR(10),dtFechaLogueo,103),sUserName,sNombres,semail,sNombrePerfil,UA.sestatus
order by count(*) desc 