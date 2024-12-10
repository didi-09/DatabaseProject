CREATE OR ALTER TRIGGER trg_InsertEnrollmentLog
ON Academics.Enrollment
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'INSERT',
        'Enrollment',
        CONCAT('Inserted enrollment for student: ', student_id, ' in course: ', course_id),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Get user role
    FROM INSERTED;
END;
