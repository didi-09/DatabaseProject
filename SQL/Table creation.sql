CREATE TABLE Exam(
exam_id INT PRIMARY KEY IDENTITY(1,1),
course_id INT FOREIGN KEY REFERENCES Course(course_id),
exam_date DATE NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL,
exam_location VARCHAR(100) NOT NULL
);

CREATE TABLE Exam_Result(
result_id INT PRIMARY KEY IDENTITY(1,1),
student_id INT FOREIGN KEY REFERENCES Student(student_id),
exam_id INT FOREIGN KEY REFERENCES Exam(exam_id),
score DECIMAL NOT NULL CHECK (score BETWEEN 0 AND 100),
exam_status VARCHAR(10) NOT NULL CHECK (exam_status IN ('PASSED', 'FAILED'))
);

CREATE TABLE Classroom(
classroom_id INT PRIMARY KEY IDENTITY(1,1),
building_name	VARCHAR(100) NOT NULL,
room_number DECIMAL(3,0) NOT NULL,
capacity INT NOT NULL,
resources VARCHAR(500)
);

CREATE TABLE Prerequisitie(
prerequisite_id INT PRIMARY KEY IDENTITY(1,1),
course_id INT FOREIGN KEY REFERENCES Course(course_id),
prerequisite_course_id INT FOREIGN KEY REFERENCES Course(course_id)
);

CREATE TABLE Schedule(
schedule_id INT PRIMARY KEY IDENTITY(1,1),
course_id INT FOREIGN KEY REFERENCES Course(course_id),
instructor_id INT FOREIGN KEY REFERENCES Instructor(instructor_id),
classroom_id INT FOREIGN KEY REFERENCES Classroom(classroom_id),
day_of_week VARCHAR(10) NOT NULL CHECK(day_of_week IN('SUNDAY','MONDAY','TUESDAY','WEDNESDAY','THURSDAY')),
start_time TIME NOT NULL,
end_time TIME NOT NULL
);

CREATE TABLE Users(
user_id INT PRIMARY KEY IDENTITY(1,1),
username VARCHAR(100) UNIQUE NOT NULL,
user_password VARCHAR(100) NOT NULL,
email VARCHAR(200) NOT NULL,
user_role VARCHAR(15) NOT NULL CHECK(user_role IN('STUDENT','INSTRUCTOR','ADVISOR','ADMIN')),
created_at DATE DEFAULT GETDATE()
);

CREATE TABLE Academics.Attendance (
    attendance_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Present', 'Absent')),
    FOREIGN KEY (student_id) REFERENCES Academics.Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Academics.Course(course_id)
);

CREATE TABLE Scholarship (
    scholarship_id INT PRIMARY KEY IDENTITY(1,1),
    scholarship_name NVARCHAR(100) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    eligibility_criteria NVARCHAR(500),
    start_date DATE NOT NULL,
    end_date DATE
);

CREATE TABLE StudentScholarship (
    student_id INT NOT NULL,
    scholarship_id INT NOT NULL,
    awarded_date DATE NOT NULL,
    PRIMARY KEY (student_id, scholarship_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (scholarship_id) REFERENCES Scholarship(scholarship_id)
);

CREATE TABLE LibraryBook (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200) NOT NULL,
    author NVARCHAR(100) NOT NULL,
    isbn NVARCHAR(13) UNIQUE NOT NULL,
    published_year INT NOT NULL,
    copies_available INT NOT NULL CHECK (copies_available >= 0)
);

CREATE TABLE BorrowHistory (
    borrow_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (book_id) REFERENCES LibraryBook(book_id)
);

CREATE TABLE Club (
    club_id INT PRIMARY KEY IDENTITY(1,1),
    club_name NVARCHAR(100) NOT NULL,
    advisor_id INT,
    FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id)
);

CREATE TABLE ClubMembership (
    student_id INT NOT NULL,
    club_id INT NOT NULL,
    join_date DATE NOT NULL,
    role NVARCHAR(50) DEFAULT 'Member',
    PRIMARY KEY (student_id, club_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE DepartmentHeadHistory (
    history_id INT PRIMARY KEY IDENTITY(1,1),
    department_id INT NOT NULL,
    instructor_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Academics.EnrollmentHistory (
    history_id INT IDENTITY PRIMARY KEY,
    enrollment_id INT FOREIGN KEY REFERENCES Academics.Enrollment(enrollment_id),
    student_id INT FOREIGN KEY REFERENCES Academics.Student(student_id),
    course_id INT FOREIGN KEY REFERENCES Academics.Course(course_id),
    status VARCHAR(20),
    enrollment_date DATE,
    archived_at DATE DEFAULT GETDATE()
);
CREATE TABLE Academics.Grades (
    grade_id INT PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES Academics.Student(student_id),
    course_id INT FOREIGN KEY REFERENCES Academics.Course(course_id),
    grade DECIMAL(3, 2),
    grade_date DATETIME DEFAULT GETDATE()
);
CREATE TABLE Exams.Exam_Log (
    audit_log_id INT IDENTITY(1,1) PRIMARY KEY,      -- Unique identifier for each log entry
    action_timestamp DATETIME DEFAULT GETDATE(),     -- Timestamp when the action occurred
    action VARCHAR(50) NOT NULL,                      -- Type of action (INSERT, UPDATE, DELETE)
    student_id INT,                                   -- Student ID (if relevant)
    exam_id INT,                                      -- Exam ID (if relevant)
    score DECIMAL(5,2),                               -- Exam score (if relevant)
    performed_by VARCHAR(255) NOT NULL,               -- Who performed the action (e.g., username)
    description VARCHAR(255)                         -- Additional details or comments (optional)
);