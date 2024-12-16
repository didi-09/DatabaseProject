<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Results - Bugz University</title>
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
    <h2>Exam Results</h2>
    <p>View exam results for all grades and courses</p>
</div>

<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h5>Filter Results</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label for="filterGrade" class="form-label">Filter by Grade</label>
                    <select class="form-select" id="filterGrade">
                        <option value="all" selected>All Grades</option>
                        <option value="Grade 1">Grade 1</option>
                        <option value="Grade 2">Grade 2</option>
                        <option value="Grade 3">Grade 3</option>
                        <option value="Grade 4">Grade 4</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="filterCourse" class="form-label">Filter by Course</label>
                    <select class="form-select" id="filterCourse">
                        <option value="all" selected>All Courses</option>
                        <option value="Programming 101">Programming 101</option>
                        <option value="Data Structures">Data Structures</option>
                        <option value="Algorithms">Algorithms</option>
                        <option value="Database Systems">Database Systems</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="searchStudent" class="form-label">Search Student</label>
                    <input type="text" class="form-control" id="searchStudent" placeholder="Search by student name or ID">
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h5>Exam Results</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Grade</th>
                        <th>Course</th>
                        <th>Marks</th>
                    </tr>
                </thead>
                <tbody id="resultsTable">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    const results = [
        { id: "S001", name: "John Doe", grade: "Grade 1", course: "Programming 101", marks: 85 },
        { id: "S002", name: "Jane Smith", grade: "Grade 2", course: "Data Structures", marks: 90 },
        { id: "S003", name: "Sam Brown", grade: "Grade 3", course: "Algorithms", marks: 78 },
        { id: "S004", name: "Lucy Green", grade: "Grade 4", course: "Database Systems", marks: 88 },
        { id: "S005", name: "Mike Wilson", grade: "Grade 1", course: "Programming 101", marks: 92 },
    ];
    const resultsTable = document.getElementById("resultsTable");
    const filterGrade = document.getElementById("filterGrade");
    const filterCourse = document.getElementById("filterCourse");
    const searchStudent = document.getElementById("searchStudent");
    function displayResults(grade = "all", course = "all", searchQuery = "") {
        resultsTable.innerHTML = "";
        const filteredResults = results.filter(result => {
            const matchesGrade = grade === "all" || result.grade === grade;
            const matchesCourse = course === "all" || result.course === course;
            const matchesSearch = searchQuery === "" || 
                                  result.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                  result.id.toLowerCase().includes(searchQuery.toLowerCase());
            return matchesGrade && matchesCourse && matchesSearch;
        });
        filteredResults.forEach(result => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${result.id}</td>
                <td>${result.name}</td>
                <td>${result.grade}</td>
                <td>${result.course}</td>
                <td>${result.marks}</td>
            `;
            resultsTable.appendChild(row);
        });

        if (filteredResults.length === 0) {
            resultsTable.innerHTML = `<tr><td colspan="5" class="text-center">No results found</td></tr>`;
        }
    }

    filterGrade.addEventListener("change", () => displayResults(filterGrade.value, filterCourse.value, searchStudent.value));
    filterCourse.addEventListener("change", () => displayResults(filterGrade.value, filterCourse.value, searchStudent.value));
    searchStudent.addEventListener("input", () => displayResults(filterGrade.value, filterCourse.value, searchStudent.value));

    displayResults();
</script>

</body>
</html>
