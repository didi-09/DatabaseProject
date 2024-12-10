CREATE TRIGGER trg_DeleteExamLog
ON Exams.Exam -- Table to monitor
AFTER DELETE -- Trigger activates after a DELETE
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'DELETE', 
           'Exam', 
           exam_id, 
           CONCAT('Deleted exam for course: ', course_id)
    FROM DELETED;
END;
