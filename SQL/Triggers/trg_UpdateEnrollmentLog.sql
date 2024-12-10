CREATE OR ALTER TRIGGER trg_UpdateEnrollmentLog
ON Academics.Enrollment
AFTER UPDATE
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'UPDATE',
        'Enrollment',
        CONCAT(
            'Updated enrollment for student: ', 
            INSERTED.student_id,  -- Specify INSERTED table
            ' - Old status: ', 
            DELETED.status,  -- Specify DELETED table
            ', New status: ', 
            INSERTED.status  -- Specify INSERTED table
        ),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Get user role
    FROM INSERTED
    INNER JOIN DELETED ON INSERTED.enrollment_id = DELETED.enrollment_id;
END;
