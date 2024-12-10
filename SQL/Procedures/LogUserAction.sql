CREATE PROCEDURE LogUserAction
    @performed_by VARCHAR(100),
    @action_performed VARCHAR(100),
    @affected_table VARCHAR(100),
    @details VARCHAR(MAX)
AS
BEGIN
    INSERT INTO Audit_Log (performed_by, action_performed, affected_table, details, action_timestamp, user_role)
    VALUES (
        @performed_by,
        @action_performed,
        @affected_table,
        @details,
        GETDATE(),
        (SELECT user_role FROM Accounts.Users WHERE username = @performed_by)
    );
END;
