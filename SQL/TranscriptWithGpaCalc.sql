SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date,
    g.grade,
    CASE 
        WHEN g.grade = 'A' THEN 4.0
        WHEN g.grade = 'B' THEN 3.0
        WHEN g.grade = 'C' THEN 2.0
        WHEN g.grade = 'D' THEN 1.0
        WHEN g.grade = 'F' THEN 0.0
        ELSE NULL
    END AS grade_point,
    c.credit_hours,
    -- Calculate GPA at the end
    (
        SELECT SUM(CASE 
                        WHEN g1.grade = 'A' THEN 4.0
                        WHEN g1.grade = 'B' THEN 3.0
                        WHEN g1.grade = 'C' THEN 2.0
                        WHEN g1.grade = 'D' THEN 1.0
                        WHEN g1.grade = 'F' THEN 0.0
                        ELSE 0.0
                    END * c1.credit_hours) / SUM(c1.credit_hours)
        FROM Academics.Enrollment e1
        JOIN Academics.Grades g1 ON e1.enrollment_id = g1.enrollment_id
        JOIN Academics.Course c1 ON e1.course_id = c1.course_id
        WHERE e1.student_id = s.student_id
    ) AS GPA
FROM 
    Academics.Student s
JOIN 
    Academics.Enrollment e ON s.student_id = e.student_id
JOIN 
    Academics.Course c ON e.course_id = c.course_id
JOIN 
    Academics.Grade g ON e.enrollment_id = g.enrollment_id
WHERE 
    s.student_id = @student_id -- Replace with the student's ID
ORDER BY 
    e.enrollment_date;
