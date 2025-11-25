
-- ?Está habilitado DRCP?
SELECT name, value
FROM   v$parameter
WHERE  name IN ('enable_drcp','drcp_connection_limit');

-- También útil:
SHOW PARAMETER drcp















