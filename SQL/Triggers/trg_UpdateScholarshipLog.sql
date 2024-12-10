CREATE TRIGGER trg_UpdateScholarshipLog
ON Finances.Scholarship -- Table to monitor
AFTER UPDATE -- Trigger activates after an UPDATE
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'UPDATE', 
           'Scholarship', 
           scholarship_id, 
           CONCAT('Updated scholarship: ', scholarship_name)
    FROM INSERTED;
END;
