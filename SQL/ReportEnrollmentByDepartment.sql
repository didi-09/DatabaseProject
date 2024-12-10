SELECT 
    d.department_name,
    c.course_name,
    COUNT(e.student_id) AS total_enrollment
FROM 
    Academics.Course c
JOIN 
    Academics.Department d ON c.department_id = d.department_id
LEFT JOIN 
    Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY 
    d.department_name, c.course_name
ORDER BY 
    total_enrollment DESC;
