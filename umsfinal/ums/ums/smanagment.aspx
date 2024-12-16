<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="smanagment.aspx.cs" Inherits="ums.smanagment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
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

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
            border: 1px solid #ccc;
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
            margin-right: 1rem;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .actions {
            text-align: center;
            margin-top: 2rem;
        }

        .output {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Management</h1>
        <div class="form-group">
            <label for="studentId">Enter Student ID</label>
            <input type="text" id="studentId" placeholder="Enter Student ID">
        </div>

        <div class="actions">
            <button class="btn" onclick="viewStudent()">View Student</button>
            <button class="btn" onclick="searchStudent()">Search Student</button>
            <button class="btn" onclick="filterStudents()">Filter Students</button>
<button class="btn" onclick="addStudent()">Add Student</button>
            <button class="btn" onclick="updateStudent()">Update Student</button>
            <button class="btn" onclick="deleteStudent()">Delete Student</button>
        </div>

        <div id="output" class="output">
        </div>
    </div>

    <script>
        function viewStudent() {
            const studentId = document.getElementById('studentId').value;
            if (studentId) {
                document.getElementById('output').innerHTML = `<p>Viewing details for Student ID: <strong>${studentId}</strong>.</p>`;
            } else {
                alert('Please enter a valid Student ID to view.');
            }
        }

        function searchStudent() {
            const studentId = document.getElementById('studentId').value;
            if (studentId) {
                document.getElementById('output').innerHTML = `<p>Searching for Student ID: <strong>${studentId}</strong>.</p>`;
            } else {
                alert('Please enter a valid Student ID to search.');
            }
        }

        function filterStudents() {
            document.getElementById('output').innerHTML = `<p>Filtering students based on criteria...</p>`;
        }

        function addStudent() {
                window.location.href = "admin-dashboard.aspx";
         }


        function updateStudent() {
            window.location.href = "StudentUpdate.aspx";
        }

        function deleteStudent() {
            const studentId = document.getElementById('studentId').value;
            if (studentId) {
                document.getElementById('output').innerHTML = `<p>Deleting Student ID: <strong>${studentId}</strong>.</p>`;
            } else {
                alert('Please enter a valid Student ID to delete.');
            }
        }
    </script>
</body>
</html>
