<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Scheduling - Bugz University</title>
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
    </style>
</head>
<body>

<div class="header">
    <h2>Exam Scheduling</h2>
    <p>Create schedules for CS department grades</p>
</div>

<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h5>Schedule an Exam</h5>
        </div>
        <div class="card-body">
            <form id="examScheduleForm">
                <div class="mb-3">
                    <label for="grade" class="form-label">Select Grade</label>
                    <select class="form-select" id="grade" required>
                        <option value="" selected disabled>Select Grade</option>
                        <option value="1st Year">1st Year</option>
                        <option value="2nd Year">2nd Year</option>
                        <option value="3rd Year">3rd Year</option>
                        <option value="4th Year">4th Year</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="course" class="form-label">Select Course</label>
                    <select class="form-select" id="course" required>
                        <option value="" selected disabled>Select Course</option>
                        <option value="Programming 101">Programming 101</option>
                        <option value="Data Structures">Data Structures</option>
                        <option value="Algorithms">Algorithms</option>
                        <option value="Database Systems">Database Systems</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="examDate" class="form-label">Exam Date</label>
                    <input type="date" class="form-control" id="examDate" required>
                </div>
                <div class="mb-3">
                    <label for="examTime" class="form-label">Exam Time</label>
                    <input type="time" class="form-control" id="examTime" required>
                </div>

                <div class="mb-3">
                    <label for="location" class="form-label">Exam Location</label>
                    <input type="text" class="form-control" id="location" placeholder="Enter exam location" required>
                </div>

                <button type="submit" class="btn btn-primary">Schedule Exam</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h5>Scheduled Exams</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Grade</th>
                        <th>Course</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="scheduledExams">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    document.getElementById("examScheduleForm").addEventListener("submit", function(event) {
        event.preventDefault();
        const grade = document.getElementById("grade").value;
        const course = document.getElementById("course").value;
        const examDate = document.getElementById("examDate").value;
        const examTime = document.getElementById("examTime").value;
        const location = document.getElementById("location").value;

        const table = document.getElementById("scheduledExams");
        const newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${grade}</td>
            <td>${course}</td>
            <td>${examDate}</td>
            <td>${examTime}</td>
            <td>${location}</td>
            <td>
                <button class="btn btn-danger btn-sm" onclick="deleteExam(this)">Delete</button>
            </td>
        `;
        table.appendChild(newRow);

        document.getElementById("examScheduleForm").reset();
    });

    function deleteExam(button) {
        const row = button.parentElement.parentElement;
        row.remove();
    }
</script>

</body>
</html>
