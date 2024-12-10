-- Create a view for detailed enrollment history with grade status
CREATE VIEW dbo.StudentEnrollmentHistory AS
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.enrollment_date, 
    er.exam_status,  -- The status of the enrollment, such as 'active', 'completed', etc.
    er.score  -- Assuming you have a 'Grade' table, showing the grade received by the student
FROM Academics.Student s
JOIN Academics.Enrollment e ON s.student_id = e.student_id
JOIN Academics.Course c ON e.course_id = c.course_id
LEFT JOIN Exams.Exam_Result er ON e.student_id = s.student_id  -- Assuming Grade table has 'enrollment_id'
WHERE s.student_id = SYSTEM_USER;  -- Filter to show only the current student's enrollment details
