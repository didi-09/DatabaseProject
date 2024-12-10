CREATE TRIGGER trg_InsertStudentLog
ON Academics.Student
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    SELECT 
        SYSTEM_USER,
        'INSERT',
        'Student',
        CONCAT('Inserted student: ', first_name, ' ', last_name),
        GETDATE(),
        (SELECT user_role FROM Accounts.Users WHERE username = SYSTEM_USER) -- Add role dynamically
    FROM INSERTED;
END;
