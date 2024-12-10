CREATE TRIGGER trg_InsertEnrollmentHistory
ON Academics.Enrollment
AFTER INSERT
AS
BEGIN
    -- Insert a record into the EnrollmentHistory table when a student enrolls
    INSERT INTO Academics.EnrollmentHistory (student_id, course_id, enrollment_date, status, action_type)
    SELECT student_id, course_id, GETDATE(), 'Enrolled', 'Enrollment'
    FROM INSERTED;
END;
