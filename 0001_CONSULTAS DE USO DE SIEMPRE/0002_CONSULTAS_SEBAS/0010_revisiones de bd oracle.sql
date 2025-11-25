    SELECT
        s.sql_id,
        s.sql_text,
        b.name,
        b.value_string,
        b.value_anydata,
        TO_CHAR(s.last_active_time, 'YYYY-MM-DD HH24:MI:SS') AS last_time,
        s.executions,
        s.parsing_schema_name,
        s.module
    FROM
        v$sql s
    JOIN
        v$sql_bind_capture b
    ON
        s.sql_id = b.sql_id
    WHERE
        b.name = ':UIDVALIDADOR'
        AND s.last_active_time BETWEEN
               TRUNC(SYSDATE) + 16/24      -- hoy 08:00
           AND TRUNC(SYSDATE) + 17/24      -- hoy 09:00
    ORDER BY
        s.last_active_time DESC;













