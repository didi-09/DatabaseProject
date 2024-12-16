<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Enrollment - Bugz University</title>
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

        .course-selection {
            margin-bottom: 2rem;
        }

        .course-selection h2 {
            margin-bottom: 1rem;
            color: #060060;
        }

        .course-selection select {
            width: 100%;
            padding: 0.8rem;
            font-size: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .course-selection label {
            display: block;
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .enroll-btn-container {
            text-align: center;
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
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Course Enrollment</h1>

        <div class="course-selection">
            <h2>Select Courses to Enroll</h2>

            <form action="enroll.php" method="POST">
                <label for="course1">Course 1:</label>
                <select id="course1" name="course1">
                    <option value="intro_programming">Introduction to Programming</option>
                    <option value="data_structures">Data Structures</option>
                    <option value="operating_systems">Operating Systems</option>
                    <option value="computer_networks">Computer Networks</option>
                    <option value="database_systems">Database Management Systems</option>
                </select>

                <label for="course2">Course 2:</label>
                <select id="course2" name="course2">
                    <option value="">Select an additional course</option>
                    <option value="web_development">Web Development</option>
                    <option value="mobile_apps">Mobile App Development</option>
                    <option value="ai_foundations">Foundations of Artificial Intelligence</option>
                    <option value="cyber_security">Cyber Security</option>
                    <option value="machine_learning">Machine Learning</option>
                </select>

                <label for="course3">Course 3 (Optional):</label>
                <select id="course3" name="course3">
                    <option value="">Select an additional course</option>
                    <option value="cloud_computing">Cloud Computing</option>
                    <option value="data_analysis">Data Analysis</option>
                    <option value="game_development">Game Development</option>
                </select>

                <label for="course3">Course 4</label>
                <select id="course3" name="course3">
                    <option value="">Select an additional course</option>
                    <option value="cloud_computing">Cloud Computing</option>
                    <option value="data_analysis">Data Analysis</option>
                    <option value="game_development">Game Development</option>
                </select>

                                <label for="course3">Course 5 </label>
                <select id="course3" name="course3">
                    <option value="">Select an additional course</option>
                    <option value="cloud_computing">Cloud Computing</option>
                    <option value="data_analysis">Data Analysis</option>
                    <option value="game_development">Game Development</option>
                </select>

                <div class="enroll-btn-container">
                    <button type="submit" class="btn">Enroll in Selected Courses</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
