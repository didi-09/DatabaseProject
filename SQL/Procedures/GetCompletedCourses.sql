CREATE PROCEDURE GetCompletedCourses
    @student_id INT = NULL -- Optional: Pass NULL to get all completed courses
AS
BEGIN
    SELECT e.enrollment_id, s.student_id, s.first_name, s.last_name, c.course_name, g.grade,e.enrollment_date
    FROM Academics.Enrollment e
    INNER JOIN Academics.Student s ON e.student_id = s.student_id
    INNER JOIN Academics.Course c ON e.course_id = c.course_id
	INNER JOIN Academics.Grades g on g.student_id = s.student_id 
    WHERE e.status = 'COMPLETED'
      AND (@student_id IS NULL OR e.student_id = @student_id);

    PRINT 'Completed courses retrieved successfully';
END;
