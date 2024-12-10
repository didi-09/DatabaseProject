SELECT 
    d.department_name,
    COUNT(e.student_id) AS total_enrollment
FROM 
    Academics.Department d
JOIN 
    Academics.Course c ON d.department_id = c.department_id
LEFT JOIN 
    Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY 
    d.department_name
ORDER BY 
    total_enrollment DESC;
