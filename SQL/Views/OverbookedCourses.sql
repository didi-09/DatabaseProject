CREATE VIEW Academics.OverbookedCourses AS
SELECT 
    c.course_id, 
    c.course_name, 
    COUNT(e.enrollment_id) AS total_enrollments, 
    c.capacity
FROM Academics.Course c
JOIN Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.capacity
HAVING COUNT(e.enrollment_id) > c.capacity;
