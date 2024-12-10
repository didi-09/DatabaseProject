CREATE TRIGGER trg_DeleteScholarshipLog
ON Finances.Scholarship -- Table to monitor
AFTER DELETE -- Trigger activates after a DELETE
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'DELETE', 
           'Scholarship', 
           scholarship_id, 
           CONCAT('Deleted scholarship: ', scholarship_name)
    FROM DELETED;
END;
