-- Create a view to show the academic performance or course history of the student
CREATE VIEW Academics.StudentAcademicHistory AS
SELECT 
    s.student_id, 
    c.course_name, 
    e.enrollment_date, 
    er.exam_status,
	er.score
FROM Academics.Student s
JOIN Academics.Enrollment e ON s.student_id = e.student_id
JOIN Academics.Course c ON e.course_id = c.course_id
JOIN Exams.Exam ex ON c.course_id = ex.course_id
JOIN Exams.Exam_Result er ON ex.exam_id = er.exam_id
WHERE s.student_id = SYSTEM_USER;  -- Adjust this based on how the current student ID is handled
