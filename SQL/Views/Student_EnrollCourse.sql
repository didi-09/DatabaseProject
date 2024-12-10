CREATE PROCEDURE Student_EnrollCourse
@student_id INT,
@course_id INT
AS
BEGIN
    INSERT INTO Academics.Enrollment(student_id, course_id, enrollment_date)
    VALUES (@student_id, @course_id, GETDATE());
END;
