CREATE PROCEDURE RecordGrade (@student_id INT, @course_id INT, @grade DECIMAL(3, 2))
AS
BEGIN
    INSERT INTO Academics.Grades(student_id, course_id, grade)
    VALUES (@student_id, @course_id, @grade);
    
    -- Update GPA based on grades
    DECLARE @gpa DECIMAL(3, 2);
    SELECT @gpa = AVG(grade) FROM Academics.Grades WHERE student_id = @student_id;
    UPDATE Academics.Student SET gpa = @gpa WHERE student_id = @student_id;
END;
