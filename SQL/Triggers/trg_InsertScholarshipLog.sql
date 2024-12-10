CREATE TRIGGER trg_InsertScholarshipLog
ON Finances.Scholarship -- Table to monitor
AFTER INSERT -- Trigger activates after an INSERT
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'INSERT', 
           'Scholarship', 
           scholarship_id, 
           CONCAT('Inserted scholarship: ', scholarship_name)
    FROM INSERTED;
END;
