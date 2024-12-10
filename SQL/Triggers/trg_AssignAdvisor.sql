CREATE TRIGGER trg_AssignAdvisor
ON Academics.Student
AFTER INSERT
AS
BEGIN
    DECLARE @student_id INT, @department_id INT, @advisor_id INT;
    SELECT @student_id = student_id, @department_id = department_id FROM INSERTED;
    SELECT @advisor_id = advisor_id FROM Academics.Advisor WHERE department_id = @department_id;
    UPDATE Academics.Student SET advisor_id = @advisor_id WHERE student_id = @student_id;
END;
