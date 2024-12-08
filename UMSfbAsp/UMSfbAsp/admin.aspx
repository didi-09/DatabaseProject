<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="UMSfbAsp.admin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .entity-management {
            margin-top: 40px;
        }

        .entity-management h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .entity-management table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .add-entity-form {
            margin-top: 20px;
        }

        .form-input {
            margin-bottom: 10px;
            padding: 10px;
            width: 100%;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-button {
            padding: 10px 20px;
            background-color: #5cb85c;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>

        <!-- Student Management -->
        <div class="entity-management">
            <h2>Manage Students</h2>
            <table>
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Advisor</th>
                        <th>Enrollment Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var student in students) { %>
                        <tr>
                            <td><%= student.Name %></td>
                            <td><%= student.Email %></td>
                            <td><%= student.Department.Name %></td>
                            <td><%= student.Advisor.Name %></td>
                            <td><%= student.EnrollmentDate.ToShortDateString() %></td>
                            <td>
                                <button onclick="editStudent(<%= student.StudentId %>)">Edit</button>
                                <button onclick="deleteStudent(<%= student.StudentId %>)">Delete</button>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Add Student Form -->
        <div class="add-entity-form">
            <h3>Add New Student</h3>
            <form method="post" action="adminview.aspx?action=addStudent">
                <input class="form-input" type="text" name="name" placeholder="Student Name" required />
                <input class="form-input" type="email" name="email" placeholder="Student Email" required />
                <select class="form-input" name="department_id" required>
                    <option value="">Select Department</option>
                    <% foreach (var department in departments) { %>
                        <option value="<%= department.DepartmentId %>"><%= department.DepartmentName %></option>
                    <% } %>
                </select>
                <select class="form-input" name="advisor_id" required>
                    <option value="">Select Advisor</option>
                    <% foreach (var advisor in advisors) { %>
                        <option value="<%= advisor.AdvisorId %>"><%= advisor.Name %></option>
                    <% } %>
                </select>
                <input class="form-input" type="date" name="enrollment_date" required />
                <button type="submit" class="form-button">Add Student</button>
            </form>
        </div>

        <!-- Assign Grades Section -->
        <div class="entity-management">
            <h2>Assign Grades</h2>
            <form method="post" action="adminview.aspx?action=assignGrade">
                <select class="form-input" name="course_id" required>
                    <option value="">Select Course</option>
                    <% foreach (var course in courses) { %>
                        <option value="<%= course.CourseId %>"><%= course.CourseName %></option>
                    <% } %>
                </select>
                <select class="form-input" name="student_id" required>
                    <option value="">Select Student</option>
                    <% foreach (var student in students) { %>
                        <option value="<%= student.StudentId %>"><%= student.Name %></option>
                    <% } %>
                </select>
                <select class="form-input" name="grade_id" required>
                    <option value="">Select Grade</option>
                    <% foreach (var grade in grades) { %>
                        <option value="<%= grade.GradeId %>"><%= grade.GradeValue %></option>
                    <% } %>
                </select>
                <button type="submit" class="form-button">Assign Grade</button>
            </form>
        </div>
    </div>

    <script>
        function editStudent(studentId) {
            // Implement edit logic, likely using modal or redirect
            alert('Edit student with ID: ' + studentId);
        }

        function deleteStudent(studentId) {
            if (confirm('Are you sure you want to delete this student?')) {
                // Implement delete logic, send request to backend to delete student
                alert('Student with ID ' + studentId + ' has been deleted.');
            }
        }
    </script>
</body>
</html>
