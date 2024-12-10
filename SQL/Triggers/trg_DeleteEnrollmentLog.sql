CREATE OR ALTER TRIGGER trg_DeleteEnrollmentLog
ON Academics.Enrollment
AFTER DELETE
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'DELETE',
        'Enrollment',
        CONCAT('Deleted enrollment for student: ', student_id),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Get user role
    FROM DELETED;
END;
