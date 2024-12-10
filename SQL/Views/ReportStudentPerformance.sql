CREATE VIEW StudentPerformance AS
SELECT 
    s.student_id,
    s.first_name,
	s.last_name,
    s.email,
    AVG(g.grade) AS gpa,
    STRING_AGG(CONCAT(c.course_name, ': ', g.grade), ', ') AS courses_with_grades
FROM 
    Academics.Student s
LEFT JOIN 
    Academics.Enrollment e ON s.student_id = e.student_id
LEFT JOIN 
    Academics.Course c ON e.course_id = c.course_id
LEFT JOIN 
    Academics.Grades g ON e.student_id = g.student_id
GROUP BY 
    s.student_id, s.first_name,s.last_name, s.email;
