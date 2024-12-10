CREATE TRIGGER trg_UniqueEnrollment
ON Academics.Enrollment
AFTER INSERT
AS
BEGIN
   IF EXISTS (
        SELECT 1 
        FROM Academics.Enrollment e
        JOIN INSERTED i ON e.student_id = i.student_id AND e.course_id = i.course_id
    )
    BEGIN
        RAISERROR('Student is already enrolled in this course.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
