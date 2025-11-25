DECLARE @xml NVARCHAR(MAX)
    ,@body NVARCHAR(MAX)
    ,@letra NVARCHAR(100)
    ,@E1 NVARCHAR(200)
    ,@E2 NVARCHAR(200)
    ,@RegProc NVARCHAR(50)
    ,@header NVARCHAR(110)
    ,@Prefijo NVARCHAR(255)
    ,@Query NVARCHAR(MAX)
    ,@archivo VARCHAR(100)
    ,@destinatarios VARCHAR(MAX)
    ,@copyrecipients VARCHAR(MAX)
    ,@urlcorreo VARCHAR(MAX)
    ,@rowCount INT

SET @Prefijo = N'[sep=,' + CHAR(13) + CHAR(10) + 'FECHA_OPERACION]'

declare @intErrorCantidad int = ?;


IF @intErrorCantidad >= 5
    BEGIN
        SET @Query = '
SET NOCOUNT ON
SELECT TOP 1 CONVERT(varchar, FECHA_OPERACION,120) ' + @Prefijo + ',
' + char(39) + char(34) + char(39) + '+CONVERT(VARCHAR, CONFIRMADA)+' + char(39) + char(34) + char(39) + ' AS CONFIRMADA
  FROM [STG_TRANSPORTE].[dbo].[ANALISIS_EDO_TRX]
  ORDER BY FECHA_OPERACION DESC
  '

        SET @letra = 'Fira Sans Medium'
        SET @header = 'ALERTA DE REPLICAS PENDIENTES A OPENLOOP (VALIDADORVSAM)'
--SET @archivo = 'ANALISIS_EDO_TRX.csv'
        SELECT @E1 = 'VALOR', @E2 = 'VALOR 2';
        SELECT @destinatarios = 'sergio.dzul@mrptechnology.mx';
        SELECT @copyrecipients = 'sergio.dzul@mrptechnology.mx';

        SET @body = N'
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="@WebCon/Estilos/css/General.css" rel="stylesheet" />

    <style type="text/css">
        .mail-text-medium {
            color: #0a0a0a75;
            font-family: ' + @letra + ', sans-serif;
            padding: 5px 15px;
            border-radius: 20px;
            border: solid 3px #f2f2f2;
            margin-top: 14px;
            display: inline-block;
            margin-bottom: 0px;
            text-align: justify;
        }
    </style>
</head>
<body>
    <div>
        <table id="m_7632131990378348689emailtable" style="width:calc(60%); min-height:500px; margin:auto; background-color:#f2f2f2; border:1px solid #dddddd;" border="0" cellspacing="0" cellpadding="0" width="650" bgcolor="#13b7cb" align="center">
            <tbody>
                <tr>
                    <td height="48" bgcolor="#20201f" style=" margin-top: 5px;" align="center">
                        <div><img src="https://images.icon-icons.com/1808/PNG/512/warning_115257.png" width="200" height="200" alt="MRP" class="imgMail"></div>
                    </td>
                </tr>
                <tr style="border:5px solid rgba(225,225,225,0.9); background:rgba(225,225,225,0);" align="center">
                    <td style="padding: 10px 0 10px 0;" align="center">
                        <table class="m_7632131990378348689table-load-sku" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" style="width:97%;padding:10px;margin:0 10px;" align="center">
                            <tbody class="m_7632131990378348689load-sku-item">
                                <tr>
                                    <td style="width:80%;"  align="center">
                                        <div id="content" class="mail-text-medium" align="center">
              <p><b>Réplicas pendientes a OPENLOOP (VALIDADORVSAM)</b></p>
				<p style="font-size: 28px;" style="color: red;"  align="center">' +
                    convert(nvarchar(200), @intErrorCantidad) + ' </p>
                                           <p style="color: #dd6f2ccf;">
                                                 </p>
                                       </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
'

        EXEC msdb.dbo.sp_send_dbmail
             @profile_name = 'Notificaciones',
             @body = @body,
             @body_format ='HTML',
             @recipients = @destinatarios,
             @copy_recipients = @copyrecipients,
             @subject = @header,
             @execute_query_database = 'STG_TRANSPORTE'
        --@query =@Query,
--@query_result_header = 1,
--@query_result_separator=',',
--@query_result_no_padding=1,
--@query_result_width=32767,
--@attach_query_result_as_file = 1,
--@exclude_query_output = 1,
--@append_query_error = 1
--@query_attachment_filename = @archivo
    END
ELSE
    BEGIN
        PRINT 'No hay datos para enviar, correo cancelado.'
    END;
