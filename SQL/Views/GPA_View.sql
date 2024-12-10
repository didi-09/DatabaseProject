CREATE VIEW GPA_View AS
SELECT student_id, AVG(grade) AS GPA
FROM Academics.Grades
GROUP BY student_id;
