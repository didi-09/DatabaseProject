CREATE VIEW Academics.CourseEnrollmentStats AS
SELECT 
    c.course_id, 
    c.course_name, 
    COUNT(e.enrollment_id) AS total_enrollments
FROM Academics.Course c
LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
