USE msdb;
GO

SELECT
    mailitem_id,
    sent_status,
    recipients,
    copy_recipients,
    blind_copy_recipients,
    subject,
    body,
    send_request_date,
    sent_date,
    sent_account_id,
    last_mod_date
FROM dbo.sysmail_allitems
ORDER BY send_request_date DESC;
