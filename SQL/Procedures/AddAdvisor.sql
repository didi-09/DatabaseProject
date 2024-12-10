CREATE PROCEDURE AddAdvisor
    @first_name VARCHAR(100),
	@last_name VARCHAR(100),
    @department_id INT,
    @email VARCHAR(200)
AS
BEGIN
    INSERT INTO Academics.Advisor (first_name,last_name, department_id, email)
    VALUES (@first_name,@last_name, @department_id, @email);

    PRINT 'Advisor added successfully';
END;
