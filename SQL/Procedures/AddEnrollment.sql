CREATE PROCEDURE dbo.AddEnrollment
(
    @student_id INT,
    @course_id INT,
    @enrollment_date DATETIME
)
AS
BEGIN
    -- Insert a new record into the Enrollment table
    INSERT INTO Academics.Enrollment (student_id, course_id, enrollment_date)
    VALUES (@student_id, @course_id, @enrollment_date);
END;