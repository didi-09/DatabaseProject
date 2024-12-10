CREATE VIEW Academics.CoursesWithoutEnrollment AS
SELECT 
    c.course_id, 
    c.course_name
FROM Academics.Course c
LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;
