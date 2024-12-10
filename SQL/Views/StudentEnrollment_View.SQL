-- Create a view to show the courses the student is enrolled in
CREATE VIEW Academics.StudentEnrollments AS
SELECT 
    e.enrollment_id, 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    c.course_name
FROM Academics.Enrollment e
JOIN Academics.Student s ON e.student_id = s.student_id
JOIN Academics.Course c ON e.course_id = c.course_id
WHERE s.student_id = SYSTEM_USER;  -- Adjust this based on how the current student ID is handled

