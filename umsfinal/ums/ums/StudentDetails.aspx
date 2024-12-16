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
            <p><strong>Student ID:</strong> <span id="studentId">12345</span></p>
            <p><strong>First Name:</strong> <span id="firstName">John</span></p>
            <p><strong>Last Name:</strong> <span id="lastName">Doe</span></p>
            <p><strong>Email:</strong> <span id="email">john.doe@example.com</span></p>
            <p><strong>Phone:</strong> <span id="phone">+123456789</span></p>
            <p><strong>Department:</strong> <span id="department">Computer Science</span></p>
            <p><strong>GPA:</strong> <span id="gpa">3.85</span></p>
            <p><strong>Advisor ID:</strong> <span id="advisorId">4567</span></p>
            <p><strong>Status:</strong> <span id="status">Active</span></p>
            <p><strong>Address:</strong> <span id="address">123 Main St, Cityville</span></p>
        </div>

        <div class="courses-list">
            <h3>Enrolled Courses</h3>
            <ul>
                <li>Introduction to Programming</li>
                <li>Data Structures</li>
                <li>Operating Systems</li>
                <li>Computer Networks</li>
                <li>Database Management Systems</li>
            </ul>
        </div>

        <div class="actions">
            <a href="StudentUpdate.aspx" class="back-btn">
                <button class="btn">Edit Student Details</button>
            </a>
        </div>
    </div>

</body>
</html>
