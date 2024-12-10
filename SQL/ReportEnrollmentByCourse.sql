SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS total_enrollment,
    c.status AS course_status
FROM 
    Academics.Course c
LEFT JOIN 
    Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY 
    c.course_id, c.course_name, c.status
ORDER BY 
    total_enrollment DESC;
