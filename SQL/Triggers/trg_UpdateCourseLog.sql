CREATE OR ALTER TRIGGER trg_UpdateCourseLog
ON Academics.Course
AFTER UPDATE
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'UPDATE',
        'Course',
        CONCAT(
            'Updated course: ', 
            INSERTED.course_id,  -- Specify INSERTED table for course_id
            ' - Old course name: ', 
            DELETED.course_name,  -- Specify DELETED table for course_name
            ', New course name: ', 
            INSERTED.course_name  -- Specify INSERTED table for course_name
        ),
        GETDATE(),  -- Add timestamp
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Get user role
    FROM INSERTED
    INNER JOIN DELETED ON INSERTED.course_id = DELETED.course_id;
END;
