CREATE TRIGGER trg_AuditExamResult
ON Exams.Exam_Result
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @student_id INT, @exam_id INT, @score DECIMAL(5,2), @action VARCHAR(50);
    
    -- Get values from the inserted row
    SELECT @student_id = student_id, @exam_id = exam_id, @score = score
    FROM INSERTED;
    
    -- Determine action (Insert or Update)
    IF EXISTS (SELECT 1 FROM DELETED WHERE result_id = (SELECT result_id FROM INSERTED))
    BEGIN
        SET @action = 'UPDATE';
    END
    ELSE
    BEGIN
        SET @action = 'INSERT';
    END
    
    -- Log the action in the Audit_Log
    INSERT INTO Exams.Exam_Log (action_timestamp, action, student_id, exam_id, score)
    VALUES (GETDATE(), @action, @student_id, @exam_id, @score);
END;
