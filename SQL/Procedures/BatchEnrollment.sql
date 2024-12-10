CREATE PROCEDURE BatchEnrollment (@course_id INT)
AS
BEGIN
    DECLARE @student_id INT;
	DECLARE @enrollment_date DATE
	SET @enrollment_date = GETDATE();
    DECLARE enrollment_cursor CURSOR FOR
        SELECT student_id FROM Academics.Student WHERE department_id = (SELECT department_id FROM Academics.Course WHERE course_id = @course_id);
    
    OPEN enrollment_cursor;
    FETCH NEXT FROM enrollment_cursor INTO @student_id;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC EnrollStudentInCourse @student_id, @course_id, @enrollment_date;
        FETCH NEXT FROM enrollment_cursor INTO @student_id;
    END;
    
    CLOSE enrollment_cursor;
    DEALLOCATE enrollment_cursor;
END;
