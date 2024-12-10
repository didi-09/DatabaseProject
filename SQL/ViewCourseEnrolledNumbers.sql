SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM 
    Academics.Course c
LEFT JOIN 
    Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY 
    c.course_id, c.course_name;