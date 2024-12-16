<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department List - Bugz University</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #060060;
            color: white;
            padding: 1rem;
            text-align: center;
        }

        .header h1 {
            margin: 0;
        }

        .table-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 1rem;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #060060;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            background-color: #060060;
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .back-btn {
            background-color: #f1f1f1;
            color: #060060;
            margin-top: 2rem;
            padding: 0.75rem 2rem;
        }

        #statusMessage {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Department List - Bugz University</h1>
    </div>

    <div class="table-container">
        <h2>All Departments</h2>
        <table>
            <thead>
                <tr>
                    <th>Department Name</th>
                    <th>Courses Offered</th>
                    <th>Instructors</th>
                    <th>Students Enrolled</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="departmentTable">
                <tr>
                    <td>Computer Science</td>
                    <td>Introduction to Programming, Data Structures, Operating Systems</td>
                    <td>Dr. Abo Samra, Prof. Sasa</td>
                    <td>150</td>
                    <td>
                        <button class="btn" onclick="viewDepartmentDetails(1)">View Details</button>
                    </td>
                </tr>
                <tr>
                    <td>Engineering</td>
                    <td>Electrical Engineering, Mechanical Engineering</td>
                    <td>Dr. Didi, Prof. Bayo</td>
                    <td>120</td>
                    <td>
                        <button class="btn" onclick="viewDepartmentDetails(2)">View Details</button>
                    </td>
                </tr>
                <tr>
                    <td>Business</td>
                    <td>Business Management, Marketing</td>
                    <td>Dr. John, Prof. Kate</td>
                    <td>200</td>
                    <td>
                        <button class="btn" onclick="viewDepartmentDetails(3)">View Details</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <button class="back-btn" onclick="goBack()">Go Back</button>
    </div>

    <div id="statusMessage"></div>

    <script>
        function viewDepartmentDetails(departmentId) {
            document.getElementById('statusMessage').innerText = 'Fetching department details...';

            fetch(`https://your-backend-api-url.com/getDepartmentDetails/${departmentId}`)
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        document.getElementById('statusMessage').innerHTML = `
                            <h3>Department Details</h3>
                            <p><strong>Department Name:</strong> ${data.department.name}</p>
                            <p><strong>Courses Offered:</strong> ${data.department.courses.join(', ')}</p>
                            <p><strong>Instructors:</strong> ${data.department.instructors.join(', ')}</p>
                            <p><strong>Students Enrolled:</strong> ${data.department.studentsEnrolled}</p>
                        `;
                    } else {
                        document.getElementById('statusMessage').innerText = 'Error fetching details: ' + data.message;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('statusMessage').innerText = 'An error occurred while fetching department details.';
                });
        }

        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>
