CREATE VIEW StudentProgress AS
SELECT s.student_id, s.first_name, s.last_name, c.course_name, e.status
FROM Academics.Student s
INNER JOIN Academics.Enrollment e ON s.student_id = e.student_id
INNER JOIN Academics.Course c ON e.course_id = c.course_id;
