CREATE VIEW Academics.StudentByDepartment AS
SELECT 
    d.department_name, 
    s.student_id, 
    s.first_name, 
    s.last_name,
	e.enrollment_date
FROM Academics.Student s
JOIN Academics.Department d ON s.department_id = d.department_id
JOIN Academics.Enrollment e ON e.student_id = s.student_id;
