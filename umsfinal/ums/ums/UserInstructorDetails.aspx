<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Details - Bugz University</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .header {
            background-color: #060060;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .card {
            margin: 20px 0;
        }
        .card-header {
            background-color: #060060;
            color: white;
        }
        .table thead {
            background-color: #060060;
            color: white;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Instructor Details</h2>
</div>

<div class="container mt-4">
    <!-- Instructor Information -->
    <div class="card">
        <div class="card-header">
            <h5>Instructor Profile</h5>
        </div>
        <div class="card-body" id="instructorProfile">
            <!-- Dynamic Content -->
        </div>
    </div>

    <!-- Assigned Courses -->
    <div class="card">
        <div class="card-header">
            <h5>Assigned Courses</h5>
        </div>
        <div class="card-body">
            <ul id="assignedCourses"></ul>
        </div>
    </div>

    <!-- Enrolled Students -->
    <div class="card">
        <div class="card-header">
            <h5>Enrolled Students</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Email</th>
                        <th>Contact</th>
                    </tr>
                </thead>
                <tbody id="enrolledStudents"></tbody>
            </table>
        </div>
    </div>

    <!-- Upcoming Exams -->
    <div class="card">
        <div class="card-header">
            <h5>Upcoming Exams</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody id="upcomingExams"></tbody>
            </table>
        </div>
    </div>

    <!-- Notifications -->
    <div class="card">
        <div class="card-header">
            <h5>Notifications</h5>
        </div>
        <div class="card-body">
            <ul id="notifications"></ul>
        </div>
    </div>

    <!-- Exam Schedule -->
    <div class="card">
        <div class="card-header">
            <h5>Exam Schedule for Your Courses</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Exam Type</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody id="examSchedule"></tbody>
            </table>
        </div>
    </div>
</div>

<script>
    // Mock Data
    const instructor = {
        name: "Dr. ass",
        email: "dr.ass@university.edu",
        contact: "555-555-5554",
        department: "Computer Science"
    };

    const courses = ["Programming 101", "Data Structures", "Algorithms"];

    const students = [
        { name: "ass dooooo", course: "Programming 101", email: "ass@example.com", contact: "123-456-7890" },
        { name: "ass Smith", course: "Data Structures", email: "ass@example.com", contact: "123-456-7891" }
    ];

    const exams = [
        { course: "Programming 101", date: "2024-12-20", time: "10:00 AM", location: "Room 101" },
        { course: "Data Structures", date: "2024-12-22", time: "02:00 PM", location: "Room 202" }
    ];

    const notifications = [
        "Exam schedule for Algorithms has been updated.",
        "New student Alice Smith has enrolled in Programming 101.",
        "Please submit grades for Data Structures by 18 Dec 2024."
    ];

    const examSchedule = [
        { course: "Programming 101", type: "Midterm", date: "2024-12-15", time: "09:00 AM", location: "Room 101" },
        { course: "Data Structures", type: "Final", date: "2024-12-22", time: "02:00 PM", location: "Room 202" },
        { course: "Algorithms", type: "Final", date: "2024-12-23", time: "11:00 AM", location: "Room 303" }
    ];

    // Populate Instructor Profile
    document.getElementById("instructorProfile").innerHTML = `
        <p><strong>Name:</strong> ${instructor.name}</p>
        <p><strong>Email:</strong> ${instructor.email}</p>
        <p><strong>Contact:</strong> ${instructor.contact}</p>
        <p><strong>Department:</strong> ${instructor.department}</p>
    `;

    // Populate Assigned Courses
    const coursesList = document.getElementById("assignedCourses");
    courses.forEach(course => {
        const li = document.createElement("li");
        li.textContent = course;
        coursesList.appendChild(li);
    });

    // Populate Enrolled Students
    const studentsTable = document.getElementById("enrolledStudents");
    students.forEach(student => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${student.name}</td>
            <td>${student.course}</td>
            <td>${student.email}</td>
            <td>${student.contact}</td>
        `;
        studentsTable.appendChild(row);
    });

    // Populate Upcoming Exams
    const examsTable = document.getElementById("upcomingExams");
    exams.forEach(exam => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${exam.course}</td>
            <td>${exam.date}</td>
            <td>${exam.time}</td>
            <td>${exam.location}</td>
        `;
        examsTable.appendChild(row);
    });

    // Populate Notifications
    const notificationsList = document.getElementById("notifications");
    notifications.forEach(notification => {
        const li = document.createElement("li");
        li.textContent = notification;
        notificationsList.appendChild(li);
    });

    // Populate Exam Schedule
    const scheduleTable = document.getElementById("examSchedule");
    examSchedule.forEach(schedule => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${schedule.course}</td>
            <td>${schedule.type}</td>
            <td>${schedule.date}</td>
            <td>${schedule.time}</td>
            <td>${schedule.location}</td>
        `;
        scheduleTable.appendChild(row);
    });
</script>

</body>
</html>
