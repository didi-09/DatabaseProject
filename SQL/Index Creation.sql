CREATE NONCLUSTERED INDEX idx_student_name ON Academics.Student(first_name, last_name);
CREATE NONCLUSTERED INDEX idx_department_id ON Academics.Student(department_id);

CREATE NONCLUSTERED INDEX idx_course_name ON Academics.Course(course_name);
CREATE NONCLUSTERED INDEX idx_department_id ON Academics.Course(department_id);


CREATE NONCLUSTERED INDEX idx_student_course ON Academics.Enrollment(student_id, course_id);
CREATE NONCLUSTERED INDEX idx_enrollment_status ON Academics.Enrollment(status);

CREATE NONCLUSTERED INDEX idx_instructor_name ON Academics.Instructor(first_name, last_name);
CREATE NONCLUSTERED INDEX idx_department_id ON Academics.Instructor(department_id);

CREATE NONCLUSTERED INDEX idx_action_timestamp ON dbo.Audit_Log(timestamp);
CREATE NONCLUSTERED INDEX idx_performed_by ON dbo.Audit_Log(performed_by);
CREATE NONCLUSTERED INDEX idx_affected_table ON dbo.Audit_Log(affected_table);

CREATE NONCLUSTERED INDEX idx_course_schedule ON Exams.Schedule(course_id, start_time, end_time);

CREATE NONCLUSTERED INDEX idx_book_title ON Library.LibraryBook(title);
CREATE NONCLUSTERED INDEX idx_author_name ON Library.LibraryBook(author);

CREATE NONCLUSTERED INDEX idx_department_name ON Academics.Department(department_name);

CREATE NONCLUSTERED INDEX idx_course_prerequisite ON Academics.Prerequisitie(course_id, prerequisite_course_id);

CREATE NONCLUSTERED INDEX idx_scholarship_name ON Finances.Scholarship(scholarship_name);
CREATE NONCLUSTERED INDEX idx_student_scholarship ON Finances.StudentScholarship(student_id, scholarship_id);








