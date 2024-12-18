USE [master]
GO
/****** Object:  Database [UMS]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE DATABASE [UMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UMS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [UMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UMS] SET  MULTI_USER 
GO
ALTER DATABASE [UMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [UMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UMS]
GO
/****** Object:  DatabaseRole [STUDENT]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE ROLE [STUDENT]
GO
/****** Object:  DatabaseRole [INSTRUCTOR]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE ROLE [INSTRUCTOR]
GO
/****** Object:  DatabaseRole [ADVISOR]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE ROLE [ADVISOR]
GO
/****** Object:  DatabaseRole [ADMIN]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE ROLE [ADMIN]
GO
/****** Object:  Schema [AcademicRecords]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [AcademicRecords]
GO
/****** Object:  Schema [Academics]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Academics]
GO
/****** Object:  Schema [Accounts]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Accounts]
GO
/****** Object:  Schema [Clubs]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Clubs]
GO
/****** Object:  Schema [Exams]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Exams]
GO
/****** Object:  Schema [ExtraCurricular]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [ExtraCurricular]
GO
/****** Object:  Schema [Finances]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Finances]
GO
/****** Object:  Schema [Library]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Library]
GO
/****** Object:  Schema [Resources]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [Resources]
GO
/****** Object:  Schema [StudentManagement]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE SCHEMA [StudentManagement]
GO
/****** Object:  Table [Academics].[Department]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Academics].[Instructor]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Instructor](
	[instructor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Academics].[Student]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Student](
	[student_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[department_id] [int] NOT NULL,
	[advisor_id] [int] NULL,
	[GPA] [decimal](3, 2) NULL,
	[status] [varchar](10) NULL,
	[address] [varchar](500) NULL,
 CONSTRAINT [PK__Student__2A33069A5E48EA69] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Student__AB6E6164ACEF983A] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Academics].[DepartmentOverview]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[DepartmentOverview] AS
SELECT 
    d.department_id, 
    d.department_name, 
    (SELECT COUNT(*) FROM Academics.Student s WHERE s.department_id = d.department_id) AS total_students, 
    (SELECT COUNT(*) FROM Academics.Instructor i WHERE i.department_id = d.department_id) AS total_instructors
FROM Academics.Department d;

GO
/****** Object:  Table [Academics].[Advisor]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Advisor](
	[advisor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[advisor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Academics].[AdvisorAssignments]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[AdvisorAssignments] AS
SELECT 
    s.student_id, 
    s.first_name AS student_first_name, 
    s.last_name AS student_last_name, 
    a.advisor_id, 
    a.first_name AS advisor_first_name, 
    a.last_name AS advisor_last_name
FROM Academics.Student s
JOIN Academics.Advisor a ON s.advisor_id = a.advisor_id;

GO
/****** Object:  Table [Academics].[Course]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [varchar](100) NOT NULL,
	[department_id] [int] NOT NULL,
	[instructor_id] [int] NOT NULL,
	[course_code] [varchar](20) NOT NULL,
	[semester] [varchar](20) NULL,
	[year] [int] NULL,
	[schedule] [varchar](100) NULL,
	[classroom] [varchar](50) NULL,
	[capacity] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[credit_hours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Exams].[Exam]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exams].[Exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[exam_location] [varchar](100) NOT NULL,
	[classroom_id] [int] NULL,
	[schedule_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clubs].[Classroom]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clubs].[Classroom](
	[classroom_id] [int] IDENTITY(1,1) NOT NULL,
	[building_name] [varchar](100) NOT NULL,
	[room_number] [decimal](3, 0) NOT NULL,
	[capacity] [int] NOT NULL,
	[resources] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[classroom_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Exams].[Schedule]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exams].[Schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[instructor_id] [int] NULL,
	[classroom_id] [int] NULL,
	[day_of_week] [varchar](10) NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[exam_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Academics].[ExamSchedule]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[ExamSchedule]
AS
SELECT c.course_name, e.start_time, cl.room_number, cl.building_name, s.exam_date
FROM     Exams.Exam AS e INNER JOIN
                  Academics.Course AS c ON e.course_id = c.course_id INNER JOIN
                  Clubs.Classroom AS cl ON e.classroom_id = cl.classroom_id INNER JOIN
                  Exams.Schedule AS s ON e.schedule_id = s.schedule_id
GO
/****** Object:  Table [dbo].[Audit_Log]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Log](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[action_performed] [varchar](255) NOT NULL,
	[performed_by] [nvarchar](100) NULL,
	[timestamp] [datetime] NULL,
	[affected_table] [varchar](50) NOT NULL,
	[record_id] [int] NOT NULL,
	[details] [nvarchar](max) NULL,
	[action_timestamp] [datetime] NULL,
	[user_role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[DetailedAuditLog]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetailedAuditLog] AS
SELECT 
    al.log_id, 
    al.performed_by, 
    al.action_performed, 
    al.affected_table, 
    al.details, 
    al.timestamp
FROM dbo.Audit_Log al;

GO
/****** Object:  Table [Academics].[Enrollment]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Enrollment](
	[enrollment_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[enrollment_date] [date] NULL,
	[grade] [varchar](2) NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Academics].[StudentEnrollmentHistory]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[StudentEnrollmentHistory] AS
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.enrollment_date, 
    s.status
FROM Academics.Student s
JOIN Academics.Enrollment e ON s.student_id = e.student_id
JOIN Academics.Course c ON e.course_id = c.course_id;
GO
/****** Object:  View [Academics].[OverbookedCourses]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[OverbookedCourses] AS
SELECT 
    c.course_id, 
    c.course_name, 
    COUNT(e.enrollment_id) AS total_enrollments, 
    c.capacity
FROM Academics.Course c
JOIN Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.capacity
HAVING COUNT(e.enrollment_id) > c.capacity;

GO
/****** Object:  View [Academics].[InstructorsByDepartment]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[InstructorsByDepartment] AS
SELECT 
    d.department_name, 
    i.instructor_id, 
    i.first_name, 
    i.last_name
FROM Academics.Instructor i
JOIN Academics.Department d ON i.department_id = d.department_id;

GO
/****** Object:  Table [Academics].[Grades]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Grades](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[course_id] [int] NULL,
	[grade] [decimal](3, 2) NULL,
	[grade_date] [datetime] NULL,
 CONSTRAINT [PK__Grades__3A8F732C0CE21501] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GPA_View]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GPA_View] AS
SELECT student_id, AVG(grade) AS GPA
FROM Academics.Grades
GROUP BY student_id;

GO
/****** Object:  View [Academics].[StudentEnrollments]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Create a view to show the courses the student is enrolled in
 Adjust this based on how the current student ID is handled*/
CREATE VIEW [Academics].[StudentEnrollments]
AS
SELECT e.enrollment_id, s.student_id, s.first_name, s.last_name, c.course_name
FROM     Academics.Enrollment AS e INNER JOIN
                  Academics.Student AS s ON e.student_id = s.student_id INNER JOIN
                  Academics.Course AS c ON e.course_id = c.course_id
GO
/****** Object:  View [Academics].[CourseEnrollmentStats]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[CourseEnrollmentStats] AS
SELECT 
    c.course_id, 
    c.course_name, 
    COUNT(e.enrollment_id) AS total_enrollments
FROM Academics.Course c
LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

GO
/****** Object:  View [Academics].[StudentByDepartment]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[StudentByDepartment] AS
SELECT 
    d.department_name, 
    s.student_id, 
    s.first_name, 
    s.last_name,
	e.enrollment_date
FROM Academics.Student s
JOIN Academics.Department d ON s.department_id = d.department_id
JOIN Academics.Enrollment e ON e.student_id = s.student_id;

GO
/****** Object:  View [Academics].[InstructorCourseAssignments]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Academics].[InstructorCourseAssignments] AS
SELECT 
    i.instructor_id, 
    i.first_name, 
    i.last_name, 
    c.course_name, 
    c.schedule
FROM Academics.Instructor i
JOIN Academics.Course c ON i.instructor_id = c.instructor_id;

GO
/****** Object:  View [dbo].[ActiveEnrollments]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ActiveEnrollments] AS
SELECT c.course_name, COUNT(e.enrollment_id) AS active_students
FROM Academics.Course c
LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
WHERE e.status = 'ACTIVE'
GROUP BY c.course_name;

GO
/****** Object:  View [dbo].[StudentProgress]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentProgress] AS
SELECT s.student_id, s.first_name, s.last_name, c.course_name, e.status
FROM Academics.Student s
INNER JOIN Academics.Enrollment e ON s.student_id = e.student_id
INNER JOIN Academics.Course c ON e.course_id = c.course_id;

GO
/****** Object:  View [dbo].[StudentPerformance]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentPerformance] AS
SELECT 
    s.student_id,
    s.first_name,
	s.last_name,
    s.email,
    AVG(g.grade) AS gpa,
    STRING_AGG(CONCAT(c.course_name, ': ', g.grade), ', ') AS courses_with_grades
FROM 
    Academics.Student s
LEFT JOIN 
    Academics.Enrollment e ON s.student_id = e.student_id
LEFT JOIN 
    Academics.Course c ON e.course_id = c.course_id
LEFT JOIN 
    Academics.Grades g ON e.student_id = g.student_id
GROUP BY 
    s.student_id, s.first_name,s.last_name, s.email;

GO
/****** Object:  Table [Academics].[Attendance]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Attendance](
	[attendance_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[attendance_date] [date] NOT NULL,
	[status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Academics].[DepartmentHeadHistory]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[DepartmentHeadHistory](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[instructor_id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Academics].[EnrollmentHistory]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[EnrollmentHistory](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[enrollment_id] [int] NULL,
	[student_id] [int] NULL,
	[course_id] [int] NULL,
	[status] [varchar](20) NULL,
	[enrollment_date] [date] NULL,
	[archived_at] [date] NULL,
	[action_date] [date] NULL,
	[action_type] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Academics].[Prerequisitie]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Academics].[Prerequisitie](
	[prerequisite_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[prerequisite_course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[prerequisite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Accounts].[Users]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[user_password] [varchar](100) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[user_role] [varchar](15) NOT NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clubs].[Club]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clubs].[Club](
	[club_id] [int] IDENTITY(1,1) NOT NULL,
	[club_name] [nvarchar](100) NOT NULL,
	[advisor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[club_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clubs].[ClubMembership]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clubs].[ClubMembership](
	[student_id] [int] NOT NULL,
	[club_id] [int] NOT NULL,
	[join_date] [date] NOT NULL,
	[role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[club_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Exams].[Exam_Log]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exams].[Exam_Log](
	[audit_log_id] [int] IDENTITY(1,1) NOT NULL,
	[action_timestamp] [datetime] NULL,
	[action] [varchar](50) NOT NULL,
	[student_id] [int] NULL,
	[exam_id] [int] NULL,
	[score] [decimal](5, 2) NULL,
	[performed_by] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[audit_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Exams].[Exam_Result]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exams].[Exam_Result](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[exam_id] [int] NULL,
	[score] [decimal](18, 0) NOT NULL,
	[exam_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Finances].[Scholarship]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finances].[Scholarship](
	[scholarship_id] [int] IDENTITY(1,1) NOT NULL,
	[scholarship_name] [nvarchar](100) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[eligibility_criteria] [nvarchar](500) NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[scholarship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Finances].[StudentScholarship]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finances].[StudentScholarship](
	[student_id] [int] NOT NULL,
	[scholarship_id] [int] NOT NULL,
	[awarded_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[scholarship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Library].[BorrowHistory]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Library].[BorrowHistory](
	[borrow_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[borrow_date] [date] NOT NULL,
	[return_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[borrow_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Library].[LibraryBook]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Library].[LibraryBook](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[isbn] [nvarchar](13) NOT NULL,
	[published_year] [int] NOT NULL,
	[copies_available] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_course_name]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_course_name] ON [Academics].[Course]
(
	[course_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_department_id]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_department_id] ON [Academics].[Course]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_department_name]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_department_name] ON [Academics].[Department]
(
	[department_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_enrollment_status]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_enrollment_status] ON [Academics].[Enrollment]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_student_course]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_student_course] ON [Academics].[Enrollment]
(
	[student_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_department_id]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_department_id] ON [Academics].[Instructor]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_instructor_name]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_instructor_name] ON [Academics].[Instructor]
(
	[first_name] ASC,
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_course_prerequisite]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_course_prerequisite] ON [Academics].[Prerequisitie]
(
	[course_id] ASC,
	[prerequisite_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_department_id]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_department_id] ON [Academics].[Student]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_student_name]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_student_name] ON [Academics].[Student]
(
	[first_name] ASC,
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_action_timestamp]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_action_timestamp] ON [dbo].[Audit_Log]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_affected_table]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_affected_table] ON [dbo].[Audit_Log]
(
	[affected_table] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_performed_by]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_performed_by] ON [dbo].[Audit_Log]
(
	[performed_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_course_schedule]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_course_schedule] ON [Exams].[Schedule]
(
	[course_id] ASC,
	[start_time] ASC,
	[end_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_scholarship_name]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_scholarship_name] ON [Finances].[Scholarship]
(
	[scholarship_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_student_scholarship]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_student_scholarship] ON [Finances].[StudentScholarship]
(
	[student_id] ASC,
	[scholarship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_author_name]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_author_name] ON [Library].[LibraryBook]
(
	[author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_book_title]    Script Date: 12/19/2024 3:55:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_book_title] ON [Library].[LibraryBook]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Academics].[Course] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [Academics].[EnrollmentHistory] ADD  DEFAULT (getdate()) FOR [archived_at]
GO
ALTER TABLE [Academics].[Grades] ADD  CONSTRAINT [DF__Grades__grade_da__3AD6B8E2]  DEFAULT (getdate()) FOR [grade_date]
GO
ALTER TABLE [Academics].[Student] ADD  CONSTRAINT [DF__Student__status__534D60F1]  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [Accounts].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [Clubs].[ClubMembership] ADD  DEFAULT ('Member') FOR [role]
GO
ALTER TABLE [dbo].[Audit_Log] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[Audit_Log] ADD  DEFAULT (getdate()) FOR [action_timestamp]
GO
ALTER TABLE [Exams].[Exam_Log] ADD  DEFAULT (getdate()) FOR [action_timestamp]
GO
ALTER TABLE [Academics].[Advisor]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [Academics].[Department] ([department_id])
GO
ALTER TABLE [Academics].[Attendance]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Academics].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK__Attendanc__stude__3EA749C6] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Academics].[Attendance] CHECK CONSTRAINT [FK__Attendanc__stude__3EA749C6]
GO
ALTER TABLE [Academics].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([department_id])
REFERENCES [Academics].[Department] ([department_id])
GO
ALTER TABLE [Academics].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [Academics].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor] FOREIGN KEY([instructor_id])
REFERENCES [Academics].[Instructor] ([instructor_id])
GO
ALTER TABLE [Academics].[Course] CHECK CONSTRAINT [FK_Course_Instructor]
GO
ALTER TABLE [Academics].[DepartmentHeadHistory]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [Academics].[Department] ([department_id])
GO
ALTER TABLE [Academics].[DepartmentHeadHistory]  WITH CHECK ADD FOREIGN KEY([instructor_id])
REFERENCES [Academics].[Instructor] ([instructor_id])
GO
ALTER TABLE [Academics].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Academics].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO
ALTER TABLE [Academics].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Academics].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [Academics].[EnrollmentHistory]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Academics].[EnrollmentHistory]  WITH CHECK ADD  CONSTRAINT [FK__Enrollmen__enrol__6BAEFA67] FOREIGN KEY([enrollment_id])
REFERENCES [Academics].[Enrollment] ([enrollment_id])
ON DELETE CASCADE
GO
ALTER TABLE [Academics].[EnrollmentHistory] CHECK CONSTRAINT [FK__Enrollmen__enrol__6BAEFA67]
GO
ALTER TABLE [Academics].[EnrollmentHistory]  WITH CHECK ADD  CONSTRAINT [FK__Enrollmen__stude__6CA31EA0] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Academics].[EnrollmentHistory] CHECK CONSTRAINT [FK__Enrollmen__stude__6CA31EA0]
GO
ALTER TABLE [Academics].[Grades]  WITH CHECK ADD  CONSTRAINT [FK__Grades__course_i__39E294A9] FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Academics].[Grades] CHECK CONSTRAINT [FK__Grades__course_i__39E294A9]
GO
ALTER TABLE [Academics].[Grades]  WITH CHECK ADD  CONSTRAINT [FK__Grades__student___38EE7070] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Academics].[Grades] CHECK CONSTRAINT [FK__Grades__student___38EE7070]
GO
ALTER TABLE [Academics].[Instructor]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [Academics].[Department] ([department_id])
GO
ALTER TABLE [Academics].[Prerequisitie]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Academics].[Prerequisitie]  WITH CHECK ADD FOREIGN KEY([prerequisite_course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Academics].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Advisor] FOREIGN KEY([advisor_id])
REFERENCES [Academics].[Advisor] ([advisor_id])
GO
ALTER TABLE [Academics].[Student] CHECK CONSTRAINT [FK_Student_Advisor]
GO
ALTER TABLE [Academics].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([department_id])
REFERENCES [Academics].[Department] ([department_id])
GO
ALTER TABLE [Academics].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [Clubs].[Club]  WITH CHECK ADD FOREIGN KEY([advisor_id])
REFERENCES [Academics].[Advisor] ([advisor_id])
GO
ALTER TABLE [Clubs].[ClubMembership]  WITH CHECK ADD FOREIGN KEY([club_id])
REFERENCES [Clubs].[Club] ([club_id])
GO
ALTER TABLE [Clubs].[ClubMembership]  WITH CHECK ADD  CONSTRAINT [FK__ClubMembe__stude__1AD3FDA4] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Clubs].[ClubMembership] CHECK CONSTRAINT [FK__ClubMembe__stude__1AD3FDA4]
GO
ALTER TABLE [Exams].[Exam]  WITH CHECK ADD FOREIGN KEY([classroom_id])
REFERENCES [Clubs].[Classroom] ([classroom_id])
GO
ALTER TABLE [Exams].[Exam]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Exams].[Exam]  WITH CHECK ADD FOREIGN KEY([schedule_id])
REFERENCES [Exams].[Schedule] ([schedule_id])
GO
ALTER TABLE [Exams].[Exam_Result]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [Exams].[Exam] ([exam_id])
GO
ALTER TABLE [Exams].[Exam_Result]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Resu__stude__72C60C4A] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Exams].[Exam_Result] CHECK CONSTRAINT [FK__Exam_Resu__stude__72C60C4A]
GO
ALTER TABLE [Exams].[Schedule]  WITH CHECK ADD FOREIGN KEY([classroom_id])
REFERENCES [Clubs].[Classroom] ([classroom_id])
GO
ALTER TABLE [Exams].[Schedule]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [Academics].[Course] ([course_id])
GO
ALTER TABLE [Exams].[Schedule]  WITH CHECK ADD FOREIGN KEY([instructor_id])
REFERENCES [Academics].[Instructor] ([instructor_id])
GO
ALTER TABLE [Finances].[StudentScholarship]  WITH CHECK ADD FOREIGN KEY([scholarship_id])
REFERENCES [Finances].[Scholarship] ([scholarship_id])
GO
ALTER TABLE [Finances].[StudentScholarship]  WITH CHECK ADD  CONSTRAINT [FK__StudentSc__stude__0B91BA14] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Finances].[StudentScholarship] CHECK CONSTRAINT [FK__StudentSc__stude__0B91BA14]
GO
ALTER TABLE [Library].[BorrowHistory]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [Library].[LibraryBook] ([book_id])
GO
ALTER TABLE [Library].[BorrowHistory]  WITH CHECK ADD  CONSTRAINT [FK__BorrowHis__stude__1332DBDC] FOREIGN KEY([student_id])
REFERENCES [Academics].[Student] ([student_id])
GO
ALTER TABLE [Library].[BorrowHistory] CHECK CONSTRAINT [FK__BorrowHis__stude__1332DBDC]
GO
ALTER TABLE [Academics].[Attendance]  WITH CHECK ADD CHECK  (([status]='Absent' OR [status]='Present'))
GO
ALTER TABLE [Academics].[Enrollment]  WITH CHECK ADD  CONSTRAINT [CK__Enrollmen__statu__44952D46] CHECK  (([status]='CANCELED' OR [status]='DISABLED' OR [status]='ACTIVE' OR [status]='DROPPED' OR [status]='COMPLETED' OR [status]='FAILED'))
GO
ALTER TABLE [Academics].[Enrollment] CHECK CONSTRAINT [CK__Enrollmen__statu__44952D46]
GO
ALTER TABLE [Academics].[Student]  WITH CHECK ADD  CONSTRAINT [CK__Student__status__52593CB8] CHECK  (([status]='Inactive' OR [status]='Active'))
GO
ALTER TABLE [Academics].[Student] CHECK CONSTRAINT [CK__Student__status__52593CB8]
GO
ALTER TABLE [Accounts].[Users]  WITH CHECK ADD CHECK  (([user_role]='ADMIN' OR [user_role]='ADVISOR' OR [user_role]='INSTRUCTOR' OR [user_role]='STUDENT'))
GO
ALTER TABLE [dbo].[Audit_Log]  WITH CHECK ADD  CONSTRAINT [CK_AuditLog_Action] CHECK  (([action_performed]='LOGOUT' OR [action_performed]='LOGIN' OR [action_performed]='DELETE' OR [action_performed]='UPDATE' OR [action_performed]='INSERT' OR [action_performed]='STATUS CHANGE'))
GO
ALTER TABLE [dbo].[Audit_Log] CHECK CONSTRAINT [CK_AuditLog_Action]
GO
ALTER TABLE [Exams].[Exam_Result]  WITH CHECK ADD CHECK  (([exam_status]='FAILED' OR [exam_status]='PASSED'))
GO
ALTER TABLE [Exams].[Exam_Result]  WITH CHECK ADD CHECK  (([score]>=(0) AND [score]<=(100)))
GO
ALTER TABLE [Exams].[Schedule]  WITH CHECK ADD CHECK  (([day_of_week]='THURSDAY' OR [day_of_week]='WEDNESDAY' OR [day_of_week]='TUESDAY' OR [day_of_week]='MONDAY' OR [day_of_week]='SUNDAY'))
GO
ALTER TABLE [Library].[LibraryBook]  WITH CHECK ADD CHECK  (([copies_available]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[AddAdvisor]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddAdvisor]
    @first_name VARCHAR(100),
	@last_name VARCHAR(100),
    @department_id INT,
    @email VARCHAR(200),
	@phone INT
AS
BEGIN
    INSERT INTO Academics.Advisor (first_name,last_name, department_id, email,phone)
    VALUES (@first_name,@last_name, @department_id, @email,@phone);

    PRINT 'Advisor added successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[AddEnrollment]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEnrollment]
(
    @student_id INT,
    @course_id INT
    --@enrollment_date DATETIME
)
AS
BEGIN
    -- Check if the student exists in the Student table
    IF NOT EXISTS (SELECT 1 FROM Academics.Student WHERE student_id = @student_id)
    BEGIN
        PRINT 'Error: Student ID does not exist.';
        RETURN; -- Exit the procedure if the student doesn't exist
    END

    -- Check if the course exists in the Course table (optional but good practice)
    IF NOT EXISTS (SELECT 1 FROM Academics.Course WHERE course_id = @course_id)
    BEGIN
        PRINT 'Error: Course ID does not exist.';
        RETURN; -- Exit the procedure if the course doesn't exist
    END

    -- Insert the new enrollment record into the Enrollment table
    INSERT INTO Academics.Enrollment (student_id, course_id)
    VALUES (@student_id, @course_id);

    PRINT 'Enrollment added successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[Admin_AddUser]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Admin_AddUser]
@username NVARCHAR(100),
@user_password NVARCHAR(100),
@email NVARCHAR(200),
@user_role NVARCHAR(15)
AS
BEGIN
    INSERT INTO Accounts.Users (username, user_password, email, user_role, created_at)
    VALUES (@username, HASHBYTES('SHA2_256', @user_password), @email, @user_role, GETDATE());
END;

GO
/****** Object:  StoredProcedure [dbo].[ArchiveEnrollmentRecords]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ArchiveEnrollmentRecords]
AS
BEGIN
    INSERT INTO Academics.EnrollmentHistory(enrollment_id, student_id, course_id, status, enrollment_date)
    SELECT enrollment_id, student_id, course_id, status, enrollment_date
    FROM Academics.Enrollment
    WHERE status IN ('COMPLETED', 'DROPPED','FAILED');

    DELETE FROM Academics.Enrollment
    WHERE status IN ('COMPLETED', 'DROPPED','FAILED');

    PRINT 'Enrollment records archived successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[AssignAdvisor]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignAdvisor] (@student_id INT)
AS
BEGIN
    DECLARE @department_id INT, @advisor_id INT;
    SELECT @department_id = department_id FROM Academics.Student WHERE student_id = @student_id;
    SELECT @advisor_id = advisor_id FROM Academics.Advisor WHERE department_id = @department_id;
    UPDATE Academics.Student SET advisor_id = @advisor_id WHERE student_id = @student_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[AssignInstructorToCourse]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignInstructorToCourse]
    @instructor_id INT,
    @course_id INT
AS
BEGIN
    UPDATE Academics.Course
    SET instructor_id = @instructor_id
    WHERE course_id = @course_id;

    PRINT 'Instructor assigned successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[BatchEnrollment]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BatchEnrollment] (@course_id INT)
AS
BEGIN
    DECLARE @student_id INT;
	DECLARE @enrollment_date DATE
	SET @enrollment_date = GETDATE();
    DECLARE enrollment_cursor CURSOR FOR
        SELECT student_id FROM Academics.Student WHERE department_id = (SELECT department_id FROM Academics.Course WHERE course_id = @course_id);
    
    OPEN enrollment_cursor;
    FETCH NEXT FROM enrollment_cursor INTO @student_id;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC EnrollStudentInCourse @student_id, @course_id, @enrollment_date;
        FETCH NEXT FROM enrollment_cursor INTO @student_id;
    END;
    
    CLOSE enrollment_cursor;
    DEALLOCATE enrollment_cursor;
END;

GO
/****** Object:  StoredProcedure [dbo].[EnrollStudentInCourse]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EnrollStudentInCourse]
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
		DECLARE @Status NVARCHAR(10);
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
			UPDATE Academics.Enrollment SET status ='CANCELED' WHERE course_id = @course_id;
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
        INSERT INTO Academics.Enrollment (student_id, course_id, enrollment_date,status)
        VALUES (@student_id, @course_id, @enrollment_date,'ACTIVE');

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
GO
/****** Object:  StoredProcedure [dbo].[GetCompletedCourses]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompletedCourses]
    @student_id INT = NULL -- Optional: Pass NULL to get all completed courses
AS
BEGIN
    SELECT e.enrollment_id, s.student_id, s.first_name, s.last_name, c.course_name, g.grade,e.enrollment_date
    FROM Academics.Enrollment e
    INNER JOIN Academics.Student s ON e.student_id = s.student_id
    INNER JOIN Academics.Course c ON e.course_id = c.course_id
	INNER JOIN Academics.Grades g on g.student_id = s.student_id 
    WHERE e.status = 'COMPLETED'
      AND (@student_id IS NULL OR e.student_id = @student_id);

    PRINT 'Completed courses retrieved successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentReport]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartmentReport]
    @department_id INT
AS
BEGIN
    SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) AS total_enrollments
    FROM Academics.Course c
    LEFT JOIN Academics.Enrollment e ON c.course_id = e.course_id
    WHERE c.department_id = @department_id
    GROUP BY c.course_id, c.course_name;

    PRINT 'Department report generated successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[GetEnrollmentReportByStatus]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEnrollmentReportByStatus]
    @status VARCHAR(20)
AS
BEGIN
    SELECT e.enrollment_id, s.student_id, s.first_name, s.last_name, c.course_name, e.enrollment_date
    FROM Academics.Enrollment e
    INNER JOIN Academics.Student s ON e.student_id = s.student_id
    INNER JOIN Academics.Course c ON e.course_id = c.course_id
    WHERE e.status = @status;

    PRINT 'Enrollment report generated successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[GetEnrollmentStatusByStudent]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEnrollmentStatusByStudent]
    @student_id INT
AS
BEGIN
    SELECT e.enrollment_id, c.course_name, e.status, e.enrollment_date
    FROM Academics.Enrollment e
    INNER JOIN Academics.Course c ON e.course_id = c.course_id
    WHERE e.student_id = @student_id;

    PRINT 'Enrollment statuses retrieved successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[GetStudentEnrollmentDetails]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentEnrollmentDetails]
    @StudentID INT
AS
BEGIN
    SELECT s.student_id, 
           c.course_name, 
           e.enrollment_date, 
           er.exam_status, 
           er.score
    FROM Academics.Student AS s
    INNER JOIN Academics.Enrollment AS e ON s.student_id = e.student_id
    INNER JOIN Academics.Course AS c ON e.course_id = c.course_id
    INNER JOIN Exams.Exam AS ex ON c.course_id = ex.course_id
    INNER JOIN Exams.Exam_Result AS er ON ex.exam_id = er.exam_id
    WHERE s.student_id = @StudentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentsByAdvisor]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentsByAdvisor]
    @advisor_id INT
AS
BEGIN
    SELECT s.student_id, s.first_name, s.last_name, d.department_name
    FROM Academics.Student s
    INNER JOIN Academics.Advisor a ON s.advisor_id = a.advisor_id
    INNER JOIN Academics.Department d ON s.department_id = d.department_id
    WHERE a.advisor_id = @advisor_id;

    PRINT 'Students retrieved successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertStudentWithAutoID]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudentWithAutoID]
    @DepartmentID INT,
    @FName NVARCHAR(100),
	@LName NVARCHAR(100),
	@Email NVARCHAR(500),
	@Phone NVARCHAR(15),
	@Status NVARCHAR(10),
	@Address NVARCHAR(500) ,
    @RegistrationYear INT -- The year the student is registering
AS
BEGIN
    DECLARE @WaveNumber INT;
    DECLARE @IncrementalNumber INT;
    DECLARE @StudentID INT;
    
    -- Calculate Wave Number
    IF @RegistrationYear = 2022
        SET @WaveNumber = 220;
    ELSE IF @RegistrationYear = 2023
        SET @WaveNumber = 230;
    ELSE IF @RegistrationYear = 2024
        SET @WaveNumber = 240;
    ELSE IF @RegistrationYear = 2025
        SET @WaveNumber = 250;
	ELSE IF @RegistrationYear = 2026
        SET @WaveNumber = 260;
	ELSE IF @RegistrationYear = 2027
        SET @WaveNumber = 270;
	ELSE IF @RegistrationYear = 2028
        SET @WaveNumber = 280;
	ELSE IF @RegistrationYear = 2029
        SET @WaveNumber = 290;
    -- If wave reaches 290, it will roll over to 201 for the next year
    IF @WaveNumber = 290
        SET @WaveNumber = 201;
    
    -- Calculate the Incremental Number for the student within the department and wave
    SELECT @IncrementalNumber = COUNT(*) + 1
    FROM Academics.Student
    WHERE department_id = @DepartmentID AND student_id LIKE CAST(@DepartmentID AS VARCHAR) + '20' + CAST(@WaveNumber AS VARCHAR) + '%';
    
    -- Generate the student_id
    SET @StudentID = @DepartmentID * 1000000 + 20 * 10000 + @WaveNumber * 100 + @IncrementalNumber;

    -- Insert the new student record with the generated student_id
    INSERT INTO Academics.Student(student_id, department_id, first_name,last_name,email,phone,status,address)
    VALUES (@StudentID, @DepartmentID, @FName,@LName,@Email,@Phone,@Status,@Address);
END;
GO
/****** Object:  StoredProcedure [dbo].[LogUserAction]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LogUserAction]
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

GO
/****** Object:  StoredProcedure [dbo].[RecordExamResult]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecordExamResult] (
    @exam_id INT,
    @student_id INT,
    @score DECIMAL(5,2)
)
AS
BEGIN
    -- Insert the exam result into the ExamResult table
    INSERT INTO Exams.Exam_Result(exam_id, student_id, score)
    VALUES (@exam_id, @student_id, @score);
    
    PRINT 'Exam result recorded successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[RecordGrade]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecordGrade] (@student_id INT, @course_id INT, @grade DECIMAL(3, 2))
AS
BEGIN
    INSERT INTO Academics.Grades(student_id, course_id, grade)
    VALUES (@student_id, @course_id, @grade);
    IF @grade < 1.00
		UPDATE Academics.Enrollment SET status ='FAILED' WHERE student_id = @student_id;
	ELSE 
		UPDATE Academics.Enrollment SET status = 'COMPLETED' WHERE student_id = @student_id;
    -- Update GPA based on grades
    DECLARE @gpa DECIMAL(3, 2);
    SELECT @gpa = AVG(grade) FROM Academics.Grades WHERE student_id = @student_id;
    UPDATE Academics.Student SET gpa = @gpa WHERE student_id = @student_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[ScheduleExam]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ScheduleExam] (
    @course_id INT,
    @exam_date DATETIME,
    @start_time TIME,
	@end_time TIME,
    @location VARCHAR(255)
)
AS
BEGIN
    -- Insert the exam schedule into the Exam table
    INSERT INTO Exams.Exam (course_id, exam_date, start_time,end_time, exam_location)
    VALUES (@course_id, @exam_date, @start_time,@end_time, @location);
    
    PRINT 'Exam scheduled successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[Student_EnrollCourse]    Script Date: 12/19/2024 3:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Student_EnrollCourse]
@student_id INT,
@course_id INT
AS
BEGIN
    INSERT INTO Academics.Enrollment(student_id, course_id, enrollment_date)
    VALUES (@student_id, @course_id, GETDATE());
END;

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 607
               Left = 48
               Bottom = 770
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Academics', @level1type=N'VIEW',@level1name=N'ExamSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Academics', @level1type=N'VIEW',@level1name=N'ExamSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -240
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Academics', @level1type=N'VIEW',@level1name=N'StudentEnrollments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Academics', @level1type=N'VIEW',@level1name=N'StudentEnrollments'
GO
USE [master]
GO
ALTER DATABASE [UMS] SET  READ_WRITE 
GO
