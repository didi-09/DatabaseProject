CREATE PROCEDURE RecordExamResult (
    @exam_id INT,
    @student_id INT,
    @score DECIMAL(5,2)
)
AS
BEGIN
    -- Insert the exam result into the ExamResult table
    INSERT INTO Exams.Exam_Result(exam_id, student_id, score)
    VALUES (@exam_id, @student_id, @score);
    
    PRINT 'Exam result recorded successfully';
END;
