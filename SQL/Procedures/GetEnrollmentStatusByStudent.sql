CREATE PROCEDURE GetEnrollmentStatusByStudent
    @student_id INT
AS
BEGIN
    SELECT e.enrollment_id, c.course_name, e.status, e.enrollment_date
    FROM Academics.Enrollment e
    INNER JOIN Academics.Course c ON e.course_id = c.course_id
    WHERE e.student_id = @student_id;

    PRINT 'Enrollment statuses retrieved successfully';
END;
