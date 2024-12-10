CREATE TRIGGER trg_DeleteInstructorLog
ON Academics.Instructor -- Table to monitor
AFTER DELETE -- Trigger activates after a DELETE
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'DELETE', 
           'Instructor', 
           instructor_id, 
           CONCAT('Deleted instructor: ', first_name, ' ', last_name)
    FROM DELETED;
END;
