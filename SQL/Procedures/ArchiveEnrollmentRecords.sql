CREATE PROCEDURE ArchiveEnrollmentRecords
AS
BEGIN
    INSERT INTO Academics.EnrollmentHistory(enrollment_id, student_id, course_id, status, enrollment_date)
    SELECT enrollment_id, student_id, course_id, status, enrollment_date
    FROM Academics.Enrollment
    WHERE status IN ('COMPLETED', 'DROPPED');

    DELETE FROM Academics.Enrollment
    WHERE status IN ('COMPLETED', 'DROPPED');

    PRINT 'Enrollment records archived successfully';
END;
