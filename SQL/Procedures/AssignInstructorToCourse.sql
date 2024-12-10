CREATE PROCEDURE AssignInstructorToCourse
    @instructor_id INT,
    @course_id INT
AS
BEGIN
    UPDATE Academics.Course
    SET instructor_id = @instructor_id
    WHERE course_id = @course_id;

    PRINT 'Instructor assigned successfully';
END;
