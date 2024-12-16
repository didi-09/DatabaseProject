<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam History - Bugz University</title>
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
    <h2>Exam History</h2>
    <p>View all past exams for each grade</p>
</div>

<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h5>Filter Exams</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label for="filterGrade" class="form-label">Filter by Grade</label>
                    <select class="form-select" id="filterGrade">
                        <option value="all" selected>All Grades</option>
                        <option value="1st Year">1st Year</option>
                        <option value="2nd Year">2nd Year</option>
                        <option value="3rd Year">3rd Year</option>
                        <option value="4th Year">4th Year</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label for="searchExam" class="form-label">Search Exam</label>
                    <input type="text" class="form-control" id="searchExam" placeholder="Search by course name or location">
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h5>Exam History</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Grade</th>
                        <th>Course</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody id="examHistoryTable">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    const examHistory = [
        { grade: "1st Year", course: "Programming 101", date: "2024-10-10", time: "10:00 AM", location: "Room A1" },
        { grade: "2nd Year", course: "Data Structures", date: "2024-10-15", time: "2:00 PM", location: "Room B2" },
        { grade: "3rd Year", course: "Algorithms", date: "2024-10-20", time: "9:00 AM", location: "Room C3" },
        { grade: "4th Year", course: "Database Systems", date: "2024-10-25", time: "11:00 AM", location: "Room D4" },
        { grade: "1st Year", course: "Math for CS", date: "2024-11-01", time: "1:00 PM", location: "Room A2" },
        { grade: "3rd Year", course: "Software Engineering", date: "2024-11-05", time: "3:00 PM", location: "Room C1" },
    ];

    const tableBody = document.getElementById("examHistoryTable");
    const filterGrade = document.getElementById("filterGrade");
    const searchExam = document.getElementById("searchExam");

    function displayExams(filter = "all", searchQuery = "") {
        tableBody.innerHTML = "";
        const filteredExams = examHistory.filter(exam => {
            const matchesGrade = filter === "all" || exam.grade === filter;
            const matchesSearch = searchQuery === "" || 
                                  exam.course.toLowerCase().includes(searchQuery.toLowerCase()) || 
                                  exam.location.toLowerCase().includes(searchQuery.toLowerCase());
            return matchesGrade && matchesSearch;
        });
        filteredExams.forEach(exam => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${exam.grade}</td>
                <td>${exam.course}</td>
                <td>${exam.date}</td>
                <td>${exam.time}</td>
                <td>${exam.location}</td>
            `;
            tableBody.appendChild(row);
        });

        if (filteredExams.length === 0) {
            const noDataRow = document.createElement("tr");
            noDataRow.innerHTML = `<td colspan="5" class="text-center">No exams found</td>`;
            tableBody.appendChild(noDataRow);
        }
    }
    filterGrade.addEventListener("change", () => {
        displayExams(filterGrade.value, searchExam.value);
    });

    searchExam.addEventListener("input", () => {
        displayExams(filterGrade.value, searchExam.value);
    });
    displayExams();
</script>

</body>
</html>
