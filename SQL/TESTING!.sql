INSERT INTO Academics.Student ( first_name, last_name, email,phone,GPA,department_id,advisor_id)
VALUES ('John', 'Doe','mohaed@gmail',01293,4.00,1,1);

DBCC CHECKIDENT ('Academics.Department', RESEED, 0);  -- Resets the identity column to start from the next value after 0 (or another number).

-- Disable Foreign Key Constraints
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all";

EXEC sp_MSforeachtable 'DELETE FROM ?';

-- Re-enable Foreign Key Constraints
EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all";

-- Insert into department
INSERT INTO Academics.Department(department_name)
VALUES ('CSIT'),('FOE'),('FIBH');

INSERT INTO Academics.Advisor(first_name,last_name,email,phone,department_id)
VALUES('ahmad','antar','antar@gmail.com','012345',2);


-- Insert Students
INSERT INTO Academics.Student (first_name, last_name, email,phone,GPA,department_id,advisor_id)
VALUES 
    ( 'John', 'Doe', 'john.doe@example.com', '20000101', 4.00,1,2),
    ( 'Jane', 'Smith', 'jane.smith@example.com', 199904,3.00,3 , 2),
    ( 'Alex', 'Johnson', 'alex.johnson@example.com',19980822,2.00,2,2);


-- Insert Instructors
INSERT INTO Academics.Instructor ( first_name, last_name, email, phone,department_id)
VALUES 
    ('Dr. Alice', 'Brown', 'alicebrown@gmail.com', 12345,1),
    ('Dr. Bob', 'Green', 'bobgreen@gmail.com', 12345,2);
SELECT * FROM Academics.Instructor;

INSERT INTO Accounts.Users(username,user_password,email,user_role)
VALUES('Admin','Admin','Admin@gmail.com','ADMIN');


INSERT INTO Academics.Course(course_name,department_id,instructor_id,course_code,semester,year,schedule,classroom,capacity)
VALUES ('Database systems',1, 1, 'CNC234',1,3, 'TEST','G25', 50 );


UPDATE Academics.Student
SET email = 'newemail@gmail.com'
WHERE student_id = 7;

DELETE FROM Academics.Student
WHERE student_id = 2;


SELECT * FROM dbo.Audit_log;

SELECT * FROM Academics.Student;
SELECT * FROM Academics.Course;
SELECT * FROM Academics.Enrollment;
SELECT * FROM Academics.EnrollmentHistory;
SELECT * FROM Academics.Advisor;


DELETE FROM Academics.Enrollment;
DELETE FROM Audit_Log;
DBCC CHECKIDENT ('Audit_Log', RESEED, 1);


DBCC CHECKIDENT ('Academics.Enrollment', RESEED, 1);



EXEC dbo.AddEnrollment @student_id = 13, @course_id = 2;

EXEC dbo.AddAdvisor @first_name='Mohmed', @last_name='Ahme', @department_id = 1, @email='Amad@gmail.com',@phone=2023;

SELECT * 
FROM Academics.Enrollment 
WHERE student_id = 13 AND course_id = 2;


EXEC sp_help 'Academics.Enrollment';
SELECT * FROM Academics.Enrollment
WHERE student_id = 13
  AND course_id = 2;
