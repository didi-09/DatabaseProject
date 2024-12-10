CREATE VIEW Academics.DepartmentOverview AS
SELECT 
    d.department_id, 
    d.department_name, 
    (SELECT COUNT(*) FROM Academics.Student s WHERE s.department_id = d.department_id) AS total_students, 
    (SELECT COUNT(*) FROM Academics.Instructor i WHERE i.department_id = d.department_id) AS total_instructors
FROM Academics.Department d;
