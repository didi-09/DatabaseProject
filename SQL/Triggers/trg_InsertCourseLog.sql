CREATE OR ALTER TRIGGER trg_InsertCourseLog
ON Academics.Course
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'INSERT',
        'Course',
        CONCAT('Inserted course: ', course_name),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Get user role
    FROM INSERTED;
END;
