SELECT 
    c.course_name,
    COUNT(eh.student_id) AS total_enrollments
FROM 
    Academics.EnrollmentHistory eh
JOIN 
    Academics.Course c ON eh.course_id = c.course_id
WHERE 
    eh.status = 'Enrolled'
GROUP BY 
    c.course_name;
