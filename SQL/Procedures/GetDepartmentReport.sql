CREATE PROCEDURE GetDepartmentReport
    @department_id INT
AS
BEGIN
    SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) AS total_enrollments
    FROM Academics.Course c
    LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
    WHERE c.department_id = @department_id
    GROUP BY c.course_id, c.course_name;

    PRINT 'Department report generated successfully';
END;
