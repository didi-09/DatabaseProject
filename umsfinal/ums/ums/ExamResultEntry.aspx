<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Results Entry - Bugz University</title>
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
        .btn-primary {
            background-color: #060060;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Exam Results Entry</h2>
    <p>Manage and update exam results for students</p>
</div>

<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h5>Filter Results</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label for="filterCourse" class="form-label">Filter by Course</label>
                    <select class="form-select" id="filterCourse">
                        <option value="all" selected>All Courses</option>
                        <option value="Programming 101">Programming 101</option>
                        <option value="Data Structures">Data Structures</option>
                        <option value="Algorithms">Algorithms</option>
                        <option value="Database Systems">Database Systems</option>
                    </select>
                </div>

                <div class="col-md-6">
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
                        <th>Course</th>
                        <th>Marks</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="resultsTable">
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Exam Result</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editForm">
                    <div class="mb-3">
                        <label for="editStudentName" class="form-label">Student Name</label>
                        <input type="text" class="form-control" id="editStudentName" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editCourse" class="form-label">Course</label>
                        <input type="text" class="form-control" id="editCourse" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editMarks" class="form-label">Marks</label>
                        <input type="number" class="form-control" id="editMarks">
                    </div>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const results = [
        { id: "S001", name: " mo", course: "Programming 101", marks: 85 },
        { id: "S002", name: " mouri", course: "Data Structures", marks: 90 },
        { id: "S003", name: "didi", course: "Algorithms", marks: 78 },
        { id: "S004", name: "hanam", course: "Database Systems", marks: 88 },
        { id: "S005", name: "banam", course: "Programming 101", marks: 92 },
    ];

    const resultsTable = document.getElementById("resultsTable");
    const filterCourse = document.getElementById("filterCourse");
    const searchStudent = document.getElementById("searchStudent");

    let currentEditId = null;
    function displayResults(filter = "all", searchQuery = "") {
        resultsTable.innerHTML = "";
        const filteredResults = results.filter(result => {
            const matchesCourse = filter === "all" || result.course === filter;
            const matchesSearch = searchQuery === "" || 
                                  result.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                  result.id.toLowerCase().includes(searchQuery.toLowerCase());
            return matchesCourse && matchesSearch;
        });

        filteredResults.forEach(result => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${result.id}</td>
                <td>${result.name}</td>
                <td>${result.course}</td>
                <td>${result.marks}</td>
                <td>
                    <button class="btn btn-sm btn-primary" onclick="editResult('${result.id}')">Edit</button>
                </td>
            `;
            resultsTable.appendChild(row);
        });

        if (filteredResults.length === 0) {
            resultsTable.innerHTML = `<tr><td colspan="5" class="text-center">No results found</td></tr>`;
        }
    }

    function editResult(id) {
        currentEditId = id;
        const result = results.find(r => r.id === id);

        document.getElementById("editStudentName").value = result.name;
        document.getElementById("editCourse").value = result.course;
        document.getElementById("editMarks").value = result.marks;

        const editModal = new bootstrap.Modal(document.getElementById("editModal"));
        editModal.show();
    }

    document.getElementById("editForm").addEventListener("submit", (e) => {
        e.preventDefault();

        const newMarks = document.getElementById("editMarks").value;
        const result = results.find(r => r.id === currentEditId);
        result.marks = parseInt(newMarks);

        displayResults(filterCourse.value, searchStudent.value);
        const editModal = bootstrap.Modal.getInstance(document.getElementById("editModal"));
        editModal.hide();
    });

    filterCourse.addEventListener("change", () => displayResults(filterCourse.value, searchStudent.value));
    searchStudent.addEventListener("input", () => displayResults(filterCourse.value, searchStudent.value));

    displayResults();
</script>

</body>
</html>
