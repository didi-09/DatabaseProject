CREATE VIEW Academics.InstructorsByDepartment AS
SELECT 
    d.department_name, 
    i.instructor_id, 
    i.first_name, 
    i.last_name
FROM Academics.Instructor i
JOIN Academics.Department d ON i.department_id = d.department_id;
