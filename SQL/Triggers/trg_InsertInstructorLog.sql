CREATE TRIGGER trg_InsertInstructorLog
ON Academics.Instructor -- Table to monitor
AFTER INSERT -- Trigger activates after an INSERT
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'INSERT', 
           'Instructor', 
           instructor_id, 
           CONCAT('Inserted instructor: ', first_name, ' ', last_name)
    FROM INSERTED;
END;
