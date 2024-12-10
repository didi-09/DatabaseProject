CREATE TRIGGER trg_UpdateExamLog
ON Exams.Exam -- Table to monitor
AFTER UPDATE -- Trigger activates after an UPDATE
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'UPDATE', 
           'Exam', 
           exam_id, 
           CONCAT('Updated exam for course: ', course_id, 
                  ' scheduled for: ', exam_date)
    FROM INSERTED;
END;
