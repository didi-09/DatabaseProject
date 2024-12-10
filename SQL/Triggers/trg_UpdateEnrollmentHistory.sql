CREATE TRIGGER trg_UpdateEnrollmentHistory
ON Academics.Enrollment
AFTER UPDATE
AS
BEGIN
    -- Check if the status is changing from 'Enrolled' to 'Withdrawn'
    IF EXISTS (SELECT 1 FROM INSERTED i JOIN DELETED d ON i.enrollment_id = d.enrollment_id WHERE d.status = 'Enrolled' AND i.status = 'Withdrawn')
    BEGIN
        -- Insert a withdrawal record into the EnrollmentHistory table
        INSERT INTO Academics.EnrollmentHistory (student_id, course_id, enrollment_date, status, action_date, action_type)
        SELECT i.student_id, i.course_id, i.enrollment_date, 'Withdrawn', GETDATE(), 'Withdrawal'
        FROM INSERTED i;
    END;
END;
