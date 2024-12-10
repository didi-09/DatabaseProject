CREATE TRIGGER trg_UpdateAdvisorLog
ON Academics.Advisor -- Table to monitor
AFTER UPDATE -- Trigger activates after an UPDATE
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'UPDATE', 
           'Instructor', 
           advisor_id, 
           CONCAT('Updated instructor: ', first_name, ' ', last_name)
    FROM INSERTED;
END;
