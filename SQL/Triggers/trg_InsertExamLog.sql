CREATE TRIGGER trg_InsertExamLog
ON Exams.Exam -- Table to monitor
AFTER INSERT -- Trigger activates after an INSERT
AS
BEGIN
    INSERT INTO dbo.Audit_Log (performed_by, action_performed, affected_table, record_id, details)
    SELECT SYSTEM_USER, 
           'INSERT', 
           'Exam', 
           exam_id, 
           CONCAT('Inserted exam for course: ', course_id, 
                  ' on date: ', exam_date)
    FROM INSERTED;
END;
