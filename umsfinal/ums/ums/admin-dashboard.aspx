
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Bugz University</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }
       /*yaraaaaab 5555555566666666*/
.sidebar {
    width: 250px;
    background-color: #060060;
    color: white;
    padding: 1rem;
    display: flex;
    flex-direction: column;
    justify-content: flex-start; 
    height: 100vh;
}
.sidebar h2 {
    text-align: center;
    color: #f2f6d7;
    font-size: 2rem;
    margin: 0;
    padding: 1rem 0;
    border-bottom: 1px solid white; 
}

.sidebar nav {
    display: flex;
    flex-direction: column;
    justify-content: flex-start; 
    align-items: center; 
    flex-grow: 1; 
    margin-top: 2rem; 
}

.sidebar nav a {
    padding: 1rem;
    color: white;
    text-decoration: none;
    font-size: 1.1rem;
    border-bottom: 1px solid #fff;
    transition: background-color 0.3s ease;
    width: 100%; 
    text-align: center; 
}

        .sidebar nav a:hover {
            background-color: #0056b3;
        }

        .content {
            flex-grow: 1;
            padding: 2rem;
            overflow-y: auto;
        }

        .content h1 {
            color: #060060;
            text-align:center;
        }

        .section {
            display: none; 
        }

        .active {
            display: block; 
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: #f9f9f9;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 0.5rem;
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

        .header {
            background-color: #f1f1f1;
            padding: 1rem;
            margin-bottom: 2rem;
        }

        .header h2 {
            margin: 0;
            text-align:center;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Bugz University Admin</h2>
        <nav>
            <a href="#" onclick="showSection('registration')">Registration Page</a>
            <a href="#" onclick="showSection('studentManagement')">Student Management</a>
            <a href="#" onclick="showSection('courseManagement')">Course Management</a>
            <a href="#" onclick="showSection('instructorManagement')">Instructor Management</a>
            <a href="#" onclick="showSection('departmentManagement')">Department Management</a>
            <a href="#" onclick="showSection('roleManagement')">Role Management</a>
        </nav>
    </div>

    <div class="content">
        <div class="header">
            <h2>Welcome to Admin Dashboard</h2>
        </div>

       <div id="registration" class="section">
        <div class="form-container">
            <form id="studentForm">
                <div class="form-group">
                    <label for="studentId">Student ID</label>
                    <input type="text" id="studentId" name="studentId" required>
                </div>
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <select id="department" name="department" required>
                        <option value="">Select Department</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Business">Business</option>
                        <option value="Arts">Arts</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="">Select Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <button type="submit" class="btn">Register Student</button>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const departmentSelect = document.getElementById('department');
            const advisorIdInput = document.getElementById('advisorId');

            prePopulateForm();

            departmentSelect.addEventListener('change', function () {
                if (this.value === 'Engineering') {
                    advisorIdInput.disabled = false;
                    advisorIdInput.placeholder = 'Enter Engineering Advisor ID';
                } else {
                    advisorIdInput.disabled = true;
                    advisorIdInput.placeholder = '';
                }
            });

            document.getElementById('studentForm').addEventListener('submit', function (event) {
                event.preventDefault();
                submitForm();
            });
        });

        function prePopulateForm() {
            const savedData = JSON.parse(localStorage.getItem('studentData'));
            if (savedData) {
                document.getElementById('studentId').value = savedData.studentId || '';
                document.getElementById('firstName').value = savedData.firstName || '';
                document.getElementById('lastName').value = savedData.lastName || '';
                document.getElementById('email').value = savedData.email || '';
                document.getElementById('phone').value = savedData.phone || '';
                document.getElementById('department').value = savedData.department || '';
                document.getElementById('status').value = savedData.status || '';
                document.getElementById('address').value = savedData.address || '';
            }
        }

        function submitForm() {
            const formData = {
                studentId: document.getElementById('studentId').value,
                firstName: document.getElementById('firstName').value,
                lastName: document.getElementById('lastName').value,
                email: document.getElementById('email').value,
                phone: document.getElementById('phone').value,
                department: document.getElementById('department').value,
                status: document.getElementById('status').value,
                address: document.getElementById('address').value
            };

            localStorage.setItem('studentData', JSON.stringify(formData));

            alert('Student registered successfully!');
        }
    </script>
        <div id="studentManagement" class="section">
            <h1>Student Management</h1>
            <h3>Student List Page</h3>
            <p>View, search, and filter students. Add, update, or delete student records.</p>
            <a href="smanagment.aspx">
                <button class="btn">Manage Students</button>
            </a>
            <h3>Student Details Page</h3>
            <p>Detailed view of a student’s information (GPA, enrolled courses, advisor, contact info).</p>
            <a href="StudentDetails.aspx">
                <button class="btn">View Student Details</button>
            </a>
            <h3>Student Enrollment Page</h3>
            <p>Interface for students to enroll in available courses.</p>
             <a href="StudentEnrollment.aspx">
                <button class="btn">Manage Enrollment</button>
             </a>
</div>

        <div id="courseManagement" class="section">
            <h1>Course Management</h1>
            <h3>Course List Page</h3>
            <p>View all courses with details like instructors, schedule, and enrollment numbers.</p>
            <a href="CourseDetails.aspx">
            <button class="btn">View Courses</button>
            </a>
        </div>

        <div id="instructorManagement" class="section">
            <h1>Instructor Management</h1>
            <h3>Instructor Details Page</h3>
            <p>Detailed profile of an instructor, including their teaching schedule.</p>
            <a href="InstructorsDetails.aspx">
            <button class="btn">View Instructor Details</button>
           </a>
     
        </div>

        <div id="departmentManagement" class="section">
            <h1>Department Management</h1>
            <h3>Department List Page</h3>
            <p>View all departments details with their courses, instructors, and students.</p>
            <a href="DepartmentDetails.aspx">
                <button class="btn">View Department List</button>
            </a>
        </div>



        <div id="roleManagement" class="section">
            <h1>Role Management Page</h1>
            <p>Assign and manage roles and permissions for users.</p>
            <a href="ManageRules.aspx">
                <button class="btn">Manage Roles</button>
            </a>
        </div>
    </div>

    <script>
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.classList.remove('active');
            });

            const activeSection = document.getElementById(sectionId);
            if (activeSection) {
                activeSection.classList.add('active');
            }
        }

        showSection('registration');
    </script>
</body>
</html>
