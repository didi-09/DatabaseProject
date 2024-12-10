CREATE VIEW dbo.DetailedAuditLog AS
SELECT 
    al.log_id, 
    al.performed_by, 
    al.action_performed, 
    al.affected_table, 
    al.details, 
    al.timestamp
FROM dbo.Audit_Log al;
