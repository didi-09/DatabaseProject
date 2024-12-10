-- Add Foreign Key for Department in Student Table
ALTER TABLE Student
ADD CONSTRAINT FK_Student_Department
FOREIGN KEY (department_id) REFERENCES Department(department_id);

-- Add Foreign Key for Advisor in Student Table
ALTER TABLE Student
ADD CONSTRAINT FK_Student_Advisor
FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id);

-- Add Foreign Key for Department in Course Table
ALTER TABLE Course
ADD CONSTRAINT FK_Course_Department
FOREIGN KEY (department_id) REFERENCES Department(department_id);

-- Add Foreign Key for Instructor in Course Table
ALTER TABLE Course
ADD CONSTRAINT FK_Course_Instructor
FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id);

-- Add Foreign Key for Student in Enrollment Table
ALTER TABLE Enrollment
ADD CONSTRAINT FK_Enrollment_Student
FOREIGN KEY (student_id) REFERENCES Student(student_id);

-- Add Foreign Key for Course in Enrollment Table
ALTER TABLE Enrollment
ADD CONSTRAINT FK_Enrollment_Course
FOREIGN KEY (course_id) REFERENCES Course(course_id);

-- Add Foreign Key for Student in Grade Table
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (student_id) REFERENCES Student(student_id);

-- Add Foreign Key for Course in Grade Table
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (course_id) REFERENCES Course(course_id);

-- Add Foreign Key for Performed_By in Audit Log Table
ALTER TABLE Audit_Log
ADD CONSTRAINT FK_AuditLog_User
FOREIGN KEY (performed_by) REFERENCES [User](user_id);

-- Add action_timestamp column with default value as current date and time
ALTER TABLE Audit_Log
ADD action_timestamp DATETIME DEFAULT GETDATE();

-- Add user_role column to track roles of the user performing actions
ALTER TABLE Audit_Log
ADD user_role VARCHAR(50);


ALTER TABLE Academics.Course
ADD status VARCHAR(50) NOT NULL DEFAULT 'Active';

ALTER TABLE Academics.Course
ADD credit_hours INT ;

ALTER TABLE Academics.EnrollmentHistory
ADD action_date DATE, action_type VARCHAR(100);