CREATE PROCEDURE dbo.EnrollStudentInCourse
    @student_id INT,
    @course_id INT,
    @enrollment_date DATE
AS
BEGIN
    BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

        -- Check course availability and lock the row
        DECLARE @capacity INT;
        DECLARE @enrolled_students INT;

        SELECT @capacity = capacity
        FROM Academics.Course WITH (UPDLOCK, ROWLOCK)
        WHERE course_id = @course_id;

        -- Check the number of enrolled students
        SELECT @enrolled_students = COUNT(*)
        FROM Academics.Enrollment
        WHERE course_id = @course_id;

        -- Verify if there are available seats
        IF @enrolled_students >= @capacity
        BEGIN
            RAISERROR('No available seats for this course.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Ensure the student is not already enrolled
        IF EXISTS (
            SELECT 1 
            FROM Academics.Enrollment WITH (NOLOCK)
            WHERE student_id = @student_id AND course_id = @course_id
        )
        BEGIN
            RAISERROR('Student is already enrolled in this course.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insert the enrollment record
        INSERT INTO Academics.Enrollment (student_id, course_id, enrollment_date)
        VALUES (@student_id, @course_id, @enrollment_date);

        -- Commit the transaction
        COMMIT TRANSACTION;

        PRINT 'Enrollment successful.';
    END TRY
    BEGIN CATCH
        -- Rollback the transaction in case of an error
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Rethrow the error for debugging
        THROW;
    END CATCH
END;
