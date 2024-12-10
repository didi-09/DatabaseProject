CREATE PROCEDURE GetStudentsByAdvisor
    @advisor_id INT
AS
BEGIN
    SELECT s.student_id, s.first_name, s.last_name, d.department_name
    FROM Academics.Student s
    INNER JOIN Academics.Advisor a ON s.advisor_id = a.advisor_id
    INNER JOIN Academics.Department d ON s.department_id = d.department_id
    WHERE a.advisor_id = @advisor_id;

    PRINT 'Students retrieved successfully';
END;
