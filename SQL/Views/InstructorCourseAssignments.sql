CREATE VIEW Academics.InstructorCourseAssignments AS
SELECT 
    i.instructor_id, 
    i.first_name, 
    i.last_name, 
    c.course_name, 
    c.schedule
FROM Academics.Instructor i
JOIN Academics.Course c ON i.instructor_id = c.instructor_id;
