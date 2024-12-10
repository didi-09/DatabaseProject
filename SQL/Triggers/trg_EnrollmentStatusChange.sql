CREATE TRIGGER trg_EnrollmentStatusChange
ON Academics.Enrollment
AFTER UPDATE
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, record_id, details, timestamp)
    SELECT SYSTEM_USER, 'STATUS CHANGE', 'Enrollment', INSERTED.enrollment_id,
           CONCAT('Old status: ', DELETED.status, ', New status: ', INSERTED.status),
           GETDATE()
    FROM INSERTED
    INNER JOIN DELETED ON INSERTED.enrollment_id = DELETED.enrollment_id;
END;
