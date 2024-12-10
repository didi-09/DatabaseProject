CREATE VIEW ActiveEnrollments AS
SELECT c.course_name, COUNT(e.enrollment_id) AS active_students
FROM Academics.Course c
LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
WHERE e.status = 'ACTIVE'
GROUP BY c.course_name;
