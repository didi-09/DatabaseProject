CREATE VIEW Academics.AdvisorAssignments AS
SELECT 
    s.student_id, 
    s.first_name AS student_first_name, 
    s.last_name AS student_last_name, 
    a.advisor_id, 
    a.first_name AS advisor_first_name, 
    a.last_name AS advisor_last_name
FROM Academics.Student s
JOIN Academics.Advisor a ON s.advisor_id = a.advisor_id;
