CREATE OR ALTER TRIGGER trg_DeleteStudentLog
ON Academics.Student
AFTER DELETE
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'DELETE',
        'Student',
        CONCAT('Deleted student: ', first_name, ' ', last_name),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Get user role
    FROM DELETED;
END;
