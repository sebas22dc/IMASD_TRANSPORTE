SELECT
    s.sid,
    s.serial#,
    s.username,
    s.status,
    s.osuser,
    s.machine,
    s.program,
    s.module,
    s.type,
    s.logon_time,
    s.last_call_et AS segundos_inactivos,
    s.schemaname,
    s.event
FROM v$session s
WHERE s.username IS NOT NULL
ORDER BY s.status DESC, s.logon_time DESC;

SELECT name, value
FROM v$parameter
WHERE name = 'sessions';



SELECT
    server AS tipo_conexion,         -- DEDICATED / POOLED / SHARED
    status,                          -- ACTIVO / INACTIVO
    COUNT(*) AS total_sesiones
FROM v$session
WHERE username IS NOT NULL
GROUP BY server, status
ORDER BY server, status;


SELECT name, value
FROM   v$parameter
WHERE  name IN ('drcp_connection_limit','enable_drcp');