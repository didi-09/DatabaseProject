CREATE VIEW Academics.ExamSchedule AS
SELECT 
    c.course_name, 
    e.exam_date, 
    e.start_time, 
    cl.room_number,
	cl.building_name
FROM Exams.Exam e
JOIN Academics.Course c ON e.course_id = c.course_id
JOIN Clubs.Classroom cl ON e.classroom_id = cl.classroom_id;
