<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentview.aspx.cs" Inherits="UniversityApp.studentview" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student View and GPA Calculator</title>
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

        .student-details, .course-enrollments {
            margin: 20px 0;
        }

        .student-details h2, .course-enrollments h2 {
            font-size: 1.5em;
            color: #333;
        }

        .student-details p, .course-enrollments p {
            font-size: 1.1em;
            margin-bottom: 10px;
        }

        table {
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

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table-container {
            max-height: 300px;
            overflow-y: auto;
        }

        .gpa-container {
            margin-top: 20px;
        }

        .gpa-container label, .gpa-container button {
            font-size: 1.1em;
            padding: 10px;
            margin-top: 10px;
        }

        .gpa-result {
            font-size: 1.5em;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Profile</h1>
        <div class="student-details">
            <h2>Student Information</h2>
            <p><strong>Name:</strong> <span id="studentName"><%= studentName %></span></p>
            <p><strong>Email:</strong> <span id="studentEmail"><%= studentEmail %></span></p>
            <p><strong>Enrollment Date:</strong> <span id="studentEnrollmentDate"><%= studentEnrollmentDate %></span></p>
            <p><strong>Department:</strong> <span id="studentDepartment"><%= studentDepartment %></span></p>
            <p><strong>Advisor:</strong> <span id="studentAdvisor"><%= studentAdvisor %></span></p>
        </div>

        <div class="course-enrollments">
            <h2>Courses Enrolled</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Status</th>
                            <th>Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var course in enrolledCourses) { %>
                            <tr>
                                <td><%= course.CourseName %></td>
                                <td><%= course.Status %></td>
                                <td><input type="text" id="grade_<%= course.CourseId %>" value="<%= course.Grade %>" /></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- GPA Calculator -->
        <div class="gpa-container">
            <label for="calculateGPA">Click to Calculate GPA:</label>
            <button onclick="calculateGPA()">Calculate GPA</button>
            <div class="gpa-result" id="gpaResult"></div>
        </div>
    </div>

    <script>
        function calculateGPA() {
            const grades = document.querySelectorAll('input[type="text"]');
            let totalPoints = 0;
            let totalCourses = grades.length;

            const gradePoints = {
                'A': 4.0,
                'B': 3.0,
                'C': 2.0,
                'D': 1.0,
                'F': 0.0
            };

            grades.forEach(function(input) {
                const grade = input.value.toUpperCase().trim();
                if (gradePoints[grade] !== undefined) {
                    totalPoints += gradePoints[grade];
                } else {
                    totalCourses -= 1; // If invalid grade, exclude this course
                }
            });

            const gpa = totalCourses > 0 ? (totalPoints / totalCourses).toFixed(2) : 'Invalid Grades';
            document.getElementById('gpaResult').innerText = `Your GPA is: ${gpa}`;
        }
    </script>
</body>
</html>