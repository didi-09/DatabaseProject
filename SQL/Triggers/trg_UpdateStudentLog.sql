CREATE OR ALTER TRIGGER trg_UpdateStudentLog
ON Academics.Student
AFTER UPDATE
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'UPDATE',
        'Student',
        CONCAT(
            'Updated student: ', 
            INSERTED.first_name, ' ', INSERTED.last_name, 
            ' - Old first name: ', DELETED.first_name, 
            ', Old last name: ', DELETED.last_name
        ),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER)  -- Get user role
    FROM INSERTED
    INNER JOIN DELETED ON INSERTED.student_id = DELETED.student_id;
END;
