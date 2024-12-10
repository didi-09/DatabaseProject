CREATE PROCEDURE ScheduleExam (
    @course_id INT,
    @exam_date DATETIME,
    @start_time TIME,
	@end_time TIME,
    @location VARCHAR(255)
)
AS
BEGIN
    -- Insert the exam schedule into the Exam table
    INSERT INTO Exams.Exam (course_id, exam_date, start_time,end_time, exam_location)
    VALUES (@course_id, @exam_date, @start_time,@end_time, @location);
    
    PRINT 'Exam scheduled successfully';
END;
