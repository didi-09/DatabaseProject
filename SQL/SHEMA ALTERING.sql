
-- Move BorrowHistory and LibraryBook to Library schema
ALTER SCHEMA Library TRANSFER dbo.BorrowHistory;
ALTER SCHEMA Library TRANSFER dbo.LibraryBook;

-- Move Classroom, Club, and ClubMembership to Clubs schema
ALTER SCHEMA Clubs TRANSFER dbo.Classroom;
ALTER SCHEMA Clubs TRANSFER dbo.Club;
ALTER SCHEMA Clubs TRANSFER dbo.ClubMembership;

-- Move Course, Department, DepartmentHeadHistory, and Instructor to Academics schema
ALTER SCHEMA Academics TRANSFER dbo.Course;
ALTER SCHEMA Academics TRANSFER dbo.Department;
ALTER SCHEMA Academics TRANSFER dbo.DepartmentHeadHistory;
ALTER SCHEMA Academics TRANSFER dbo.Instructor;
ALTER SCHEMA Academics TRANSFER dbo.Advisor;
-- Move Exam, Exam_Result, and Schedule to Exams schema
ALTER SCHEMA Exams TRANSFER dbo.Exam;
ALTER SCHEMA Exams TRANSFER dbo.Exam_Result;
ALTER SCHEMA Exams TRANSFER dbo.Schedule;

-- Move Enrollment and Student to Academics schema
ALTER SCHEMA Academics TRANSFER dbo.Enrollment;
ALTER SCHEMA Academics TRANSFER dbo.Student;

-- Move Prerequisite to Academics schema
ALTER SCHEMA Academics TRANSFER dbo.Prerequisitie;

-- Move Scholarship and StudentScholarship to Finance schema
ALTER SCHEMA Finances TRANSFER dbo.Scholarship;
ALTER SCHEMA Finances TRANSFER dbo.StudentScholarship;

-- Move Users to Accounts schema
ALTER SCHEMA Accounts TRANSFER dbo.Users;


