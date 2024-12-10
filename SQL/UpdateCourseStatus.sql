UPDATE Academics.Course
SET status = 'Canceled'
WHERE course_id IN (
    SELECT c.course_id
    FROM Academics.Course c
    LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
    GROUP BY c.course_id
    HAVING COUNT(e.student_id) < 5
);
