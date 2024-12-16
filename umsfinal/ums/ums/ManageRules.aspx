<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
        }
        select, input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .role-container {
            display: flex;
            gap: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Manage User Roles</h2>
    <form action="manage_roles.php" method="POST">
        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId" placeholder="Enter user ID" required>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="student">Student</option>
            <option value="instructor">Instructor</option>
            <option value="admin">Admin</option>
        </select>

        <label for="permissions">Permissions:</label>
        <div class="role-container">
            <div>
                <input type="checkbox" id="canViewCourses" name="permissions[]" value="view_courses">
                <label for="canViewCourses">View Courses</label>
            </div>
            <div>
                <input type="checkbox" id="canAssignGrades" name="permissions[]" value="assign_grades">
                <label for="canAssignGrades">Assign Grades</label>
            </div>
            <div>
                <input type="checkbox" id="canManageUsers" name="permissions[]" value="manage_users">
                <label for="canManageUsers">Manage Users</label>
            </div>
        </div>

        <button type="submit">Update Role</button>
    </form>
</div>

</body>
</html>
