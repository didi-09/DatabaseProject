<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Bugz University</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('preview.png'); 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.8); 
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #060060;
            margin-bottom: 1.5rem;
        }

h1 {
    text-align: center;
    color: #f2f6d7;
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
    position: relative;
    -webkit-background-clip: text;
    background-clip: text;
    text-shadow: 
        2px 2px 0px rgba(0, 0, 0, 0.6), 
        -2px -2px 0px rgba(0, 0, 0, 0.6),
        2px -2px 0px rgba(0, 0, 0, 0.6),  
        -2px 2px 0px rgba(0, 0, 0, 0.6);  
}


        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;

        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
            box-sizing: border-box;
            text-align: center;

        }

        .btn {
            width: 100%;
            padding: 1rem;
            background-color: #060060;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1.1rem;
            cursor: pointer;
            margin-top: 2rem; 

        }

        .btn:hover {
            background-color: #0056b3;
        }

.role-select {
    margin-top: 2rem;  
    text-align: center;
    font-size: 1.25rem; 
}

.role-select select {
    padding: 0.75rem; 
    font-size: 1.1rem;
    border-radius: 4px;
    border: 1px solid #ccc;
    width: 100%;
    max-width: 300px; 
    margin-top: 1rem; 
}
        .error-message {
            color: red;
            font-size: 0.875rem;
            text-align: center;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Bugz University</h1> 
        <h2>Login to Your Account</h2>
        <form id="loginForm">
            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your Email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <div class="role-select">
                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="student">Student</option>
                    <option value="instructor">Instructor</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
        <div class="error-message" id="error-message"></div>
    </div>
    <script>
        document.getElementById('loginForm').addEventListener('submit', function (e) {
            e.preventDefault(); 
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const role = document.getElementById('role').value;
            if (email === '' || password === '') {
                document.getElementById('error-message').textContent = 'Please fill out both fields.';
                return;
            }
            if (email === 'admin' && password === 'admin123' && role === 'admin') {
                window.location.href = '/admin-dashboard'; 
            } else if (email === 'instructor' && password === 'instructor123' && role === 'instructor') {
                window.location.href = '/instructor-dashboard'; 
            } else if (email === 'student' && password === 'student123' && role === 'student') {
                window.location.href = '/student-dashboard'; 
            } else {
                document.getElementById('error-message').textContent = 'Invalid email, password, or role.';
            }
        });
    </script>
</body>
</html>
