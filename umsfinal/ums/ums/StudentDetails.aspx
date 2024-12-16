<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - Bugz University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .container {
            width: 80%;
            margin: 2rem auto;
            background-color: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #060060;
            margin-bottom: 2rem;
        }

        .student-info {
            margin-bottom: 2rem;
        }

        .student-info h2 {
            margin-bottom: 1rem;
            color: #060060;
        }

        .student-info p {
            font-size: 1.2rem;
            margin: 0.5rem 0;
        }

        .courses-list {
            margin-top: 2rem;
        }

        .courses-list h3 {
            color: #060060;
            margin-bottom: 1rem;
        }

        .courses-list ul {
            list-style-type: none;
            padding-left: 0;
        }

        .courses-list ul li {
            background-color: #e6e6e6;
            padding: 0.5rem;
            margin: 0.5rem 0;
            border-radius: 4px;
        }

        .btn {
            background-color: #060060;
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            text-align: center;
            display: inline-block;
            margin-top: 1rem;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .back-btn {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Details</h1>

        <div class="student-info">
            <h2>Student Information</h2>
            <p><strong>Student ID:</strong> <span id="studentId">Loading...</span></p>
            <p><strong>First Name:</strong> <span id="firstName">Loading...</span></p>
            <p><strong>Last Name:</strong> <span id="lastName">Loading...</span></p>
            <p><strong>Email:</strong> <span id="email">ass...</span></p>
            <p><strong>Phone:</strong> <span id="phone">ass...</span></p>
            <p><strong>Department:</strong> <span id="department">Loading...</span></p>
            <p><strong>GPA:</strong> <span id="gpa">Loading...</span></p>
            <p><strong>Advisor ID:</strong> <span id="advisorId">Loading...</span></p>
            <p><strong>Status:</strong> <span id="status">ass...</span></p>
            <p><strong>Address:</strong> <span id="address">ass...</span></p>
        </div>

        <div class="courses-list">
            <h3>Enrolled Courses</h3>
            <ul id="coursesList">
                <li>Loading...</li>
            </ul>
        </div>

        <div class="actions">
            <a href="StudentUpdate.aspx" class="back-btn">
                <button class="btn">Edit Student Details</button>
            </a>
        </div>
    </div>

    <script>
        const studentData = {
            studentId: '12345',
            firstName: 'ass',
            lastName: 'ass',
            email: 'ass.s@ass.com',
            phone: '+123456789',
            department: 'Computer Science',
            gpa: 3.85,
            advisorId: '4567',
            status: 'Active',
            address: '123  St, ',
            courses: [
                'Introduction to Programming',
                'Data Structures',
                'Operating Systems',
                'Computer Networks',
                'Database Management Systems'
            ]
        };

        function populateStudentInfo() {
            document.getElementById('studentId').textContent = studentData.studentId;
            document.getElementById('firstName').textContent = studentData.firstName;
            document.getElementById('lastName').textContent = studentData.lastName;
            document.getElementById('email').textContent = studentData.email;
            document.getElementById('phone').textContent = studentData.phone;
            document.getElementById('department').textContent = studentData.department;
            document.getElementById('gpa').textContent = studentData.gpa;
            document.getElementById('advisorId').textContent = studentData.advisorId;
            document.getElementById('status').textContent = studentData.status;
            document.getElementById('address').textContent = studentData.address;
        }

        function populateCoursesList() {
            const coursesList = document.getElementById('coursesList');
            studentData.courses.forEach(course => {
                const listItem = document.createElement('li');
                listItem.textContent = course;
                coursesList.appendChild(listItem);
            });
        }

        // Initialize page by populating student info and courses
        document.addEventListener('DOMContentLoaded', function() {
            populateStudentInfo();
            populateCoursesList();
        });
    </script>
</body>
</html>
