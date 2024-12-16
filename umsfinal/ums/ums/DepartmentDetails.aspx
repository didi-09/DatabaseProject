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
            <tbody>
                <tr>
                    <td>Computer Science</td>
                    <td>Introduction to Programming, Data Structures, Operating Systems</td>
                    <td>Dr.  abo samra, Prof. sasa</td>
                    <td>150</td>
                    <td>
                        <button class="btn">View Details</button>
                    </td>
                </tr>
                <tr>
                    <td>Engineering</td>
                    <td>Electrical Engineering, Mechanical Engineering</td>
                    <td>Dr. didi, Prof.bayo</td>
                    <td>120</td>
                    <td>
                        <button class="btn">View Details</button>
                    </td>
                </tr>
                <tr>
                    <td>Business</td>
                    <td>Business Management, Marketing</td>
         
