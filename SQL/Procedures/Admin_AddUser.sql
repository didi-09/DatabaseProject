CREATE PROCEDURE Admin_AddUser
@username NVARCHAR(100),
@user_password NVARCHAR(100),
@email NVARCHAR(200),
@user_role NVARCHAR(15)
AS
BEGIN
    INSERT INTO Accounts.Users (username, user_password, email, user_role, created_at)
    VALUES (@username, HASHBYTES('SHA2_256', @user_password), @email, @user_role, GETDATE());
END;
