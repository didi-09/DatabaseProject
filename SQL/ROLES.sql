-- Create roles
CREATE ROLE ADMIN;
CREATE ROLE INSTRUCTOR;
CREATE ROLE STUDENT;
CREATE ROLE ADVISOR;

-- Granting full permissions to the Admin role
GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::UMS TO ADMIN;

-- Granting permissions to the Instructor role
-- Allow instructors to view, update, and delete courses they are teaching
GRANT SELECT, UPDATE, DELETE ON Academics.Course TO INSTRUCTOR;  -- Modify as needed for your course structure

-- Allow instructors to view student enrollments in their courses
GRANT SELECT ON Academics.Enrollment TO INSTRUCTOR;


-- Grant permissions to view students' academic information
GRANT SELECT ON Academics.Student TO ADVISOR;  -- Allows advisors to view student details
GRANT SELECT ON Academics.Enrollment TO ADVISOR;  -- Allows advisors to view course enrollments
GRANT SELECT ON Academics.Course TO ADVISOR;  -- Allows advisors to view available courses

-- Allow advisors to update student-advisor relationships
GRANT UPDATE ON Academics.Student TO ADVISOR;  -- Allows advisors to update their assigned students


-- Allow students to view available courses
GRANT SELECT ON Academics.Course TO STUDENT;

-- Allow students to enroll in courses (this assumes there is an Enrollment table)
GRANT INSERT ON Academics.Enrollment TO STUDENT;

-- Allow students to view their own personal data
GRANT SELECT ON Academics.Student TO STUDENT;
-- Assuming Student table holds personal information such as name, email, etc.

GRANT SELECT ON Academics.StudentEnrollments TO STUDENT;
GRANT SELECT ON Academics.StudentAcademicHistory TO STUDENT;

GRANT EXECUTE ON GetEnrollmentStatusByStudent TO STUDENT;
GRANT EXECUTE ON EnrollStudentInCourse TO STUDENT;

GRANT SELECT ON Academics.AdvisorAssignments TO ADVISOR;
GRANT EXECUTE ON GetStudentsByAdvisor TO ADVISOR;
GRANT EXECUTE ON AddAdvisor TO ADVISOR;

GRANT SELECT ON Academics.InstructorCourseAssignments TO INSTRUCTOR;
GRANT SELECT ON Academics.InstructorsByDepartment TO INSTRUCTOR;
GRANT EXECUTE ON AssignInstructorToCourse TO INSTRUCTOR;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO ADMIN;
GRANT EXECUTE ON SCHEMA::dbo TO ADMIN;


GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Academics TO ADMIN;
GRANT EXECUTE ON SCHEMA::Academics TO ADMIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Clubs TO ADMIN;
GRANT EXECUTE ON SCHEMA::Clubs TO ADMIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Exams TO ADMIN;
GRANT EXECUTE ON SCHEMA::Exams TO ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Finances TO ADMIN;
GRANT EXECUTE ON SCHEMA::Finances TO ADMIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Library TO ADMIN;
GRANT EXECUTE ON SCHEMA::Library TO ADMIN;


-- Grant EXECUTE permissions on stored procedures to Admin
-- Grant EXECUTE permissions on stored procedures
GRANT EXECUTE ON OBJECT::dbo.EnrollStudentInCourse TO ADMIN;
GRANT EXECUTE ON OBJECT::dbo.RecordGrade TO ADMIN;
GRANT EXECUTE ON OBJECT::dbo.RecordGrade TO ADMIN;


-- Grant SELECT permissions on views to Admin
-- Grant necessary table permissions for triggers to work
GRANT INSERT, UPDATE, DELETE ON OBJECT::Academics.Enrollment TO ADMIN;
GRANT INSERT, UPDATE, DELETE ON OBJECT::Academics.Student TO ADMIN;
GRANT INSERT, UPDATE, DELETE ON OBJECT::Academics.Course TO ADMIN;

-- Grant necessary table permissions for triggers to work
GRANT INSERT, UPDATE, DELETE ON OBJECT::Academics.Enrollment TO ADMIN;
GRANT INSERT, UPDATE, DELETE ON OBJECT::Academics.Student TO ADMIN;
GRANT INSERT, UPDATE, DELETE ON OBJECT::Academics.Course TO ADMIN;

-- Grant SELECT permissions on views to Student
GRANT SELECT ON Academics.StudentEnrollmentHistory TO STUDENT;

-- Grant SELECT permissions on views relevant to students
GRANT SELECT ON OBJECT::Aca.StudentEnrollmentHistory TO STUDENT;
GRANT SELECT ON OBJECT::Academics.AvailableCourses TO STUDENT;

-- Grant EXECUTE permission on procedures for enrolling in courses
GRANT EXECUTE ON OBJECT::dbo.EnrollStudentInCourse TO STUDENT;

-- Table permissions for triggers and related actions
GRANT SELECT ON OBJECT::Academics.Enrollment TO STUDENT;
GRANT SELECT ON OBJECT::Academics.Course TO STUDENT;
GRANT SELECT ON OBJECT::Academics.Student TO STUDENT;

-- Grant SELECT permissions on views relevant to instructors
GRANT SELECT ON OBJECT::Academics.InstructorCourseAssignments TO INSTRUCTOR;
GRANT SELECT ON OBJECT::Academics.CourseEnrollmentStats TO INSTRUCTOR;

-- Grant EXECUTE permission on procedures for grading
GRANT EXECUTE ON OBJECT::dbo.RecordGrade TO INSTRUCTOR;

-- Table permissions for triggers and related actions
GRANT SELECT, INSERT ON OBJECT::Academics.Enrollment TO INSTRUCTOR;
GRANT SELECT ON OBJECT::Academics.Student TO INSTRUCTOR;
GRANT SELECT, UPDATE ON OBJECT::Academics.Course TO INSTRUCTOR;

-- Grant SELECT permissions on views relevant to advisors
GRANT SELECT ON OBJECT::Academics.AdvisorAssignments TO ADVISOR;
GRANT SELECT ON OBJECT::Academics.CourseEnrollmentStats TO ADVISOR;

-- Grant EXECUTE permission on procedures for managing enrollments
GRANT EXECUTE ON OBJECT::dbo.EnrollStudentInCourse TO ADVISOR;

-- Table permissions for triggers and related actions
GRANT SELECT, UPDATE ON OBJECT::Academics.Enrollment TO ADVISOR;
GRANT SELECT, UPDATE ON OBJECT::Academics.Student TO ADVISOR;
GRANT SELECT ON OBJECT::Academics.Course TO ADVISOR;
