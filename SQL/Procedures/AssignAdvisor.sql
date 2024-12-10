CREATE PROCEDURE AssignAdvisor (@student_id INT)
AS
BEGIN
    DECLARE @department_id INT, @advisor_id INT;
    SELECT @department_id = department_id FROM Academics.Student WHERE student_id = @student_id;
    SELECT @advisor_id = advisor_id FROM Academics.Advisor WHERE department_id = @department_id;
    UPDATE Academics.Student SET advisor_id = @advisor_id WHERE student_id = @student_id;
END;