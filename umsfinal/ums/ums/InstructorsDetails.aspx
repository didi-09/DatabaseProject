<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor List - Bugz University</title>
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

        .instructor-list {
            margin-bottom: 2rem;
        }

        .instructor-item {
            padding: 1rem;
            margin-bottom: 1.5rem;
            background-color: #f9f9f9;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .instructor-item h3 {
            color: #060060;
            margin: 0 0 0.5rem;
        }

        .instructor-item p {
            font-size: 1rem;
            color: #333;
            margin: 0.5rem 0;
        }

        .instructor-item .contact-info {
            font-size: 1rem;
            color: #060060;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Instructor List</h1>

        <div class="instructor-list" id="instructorList">
        </div>
    </div>

    <script>
        function fetchInstructors() {
            fetch('https://your-backend-api-url.com/getInstructors') 
                .then(response => response.json())
                .then(data => {
                    if (data && data.length > 0) {
                        const instructorList = document.getElementById('instructorList');
                        instructorList.innerHTML = ''; 
                        data.forEach(instructor => {
                            const instructorItem = document.createElement('div');
                            instructorItem.classList.add('instructor-item');

                            instructorItem.innerHTML = `
                                <h3>${instructor.name}</h3>
                                <p><strong>Assigned Courses:</strong> ${instructor.courses}</p>
                                <p><strong>Schedule:</strong> ${instructor.schedule}</p>
                                <div class="contact-info">
                                    <p><strong>Email:</strong> ${instructor.email}</p>
                                    <p><strong>Phone:</strong> ${instructor.phone}</p>
                                </div>
                            `;

                            instructorList.appendChild(instructorItem);
                        });
                    } else {
                        document.getElementById('instructorList').innerHTML = '<p>No instructors found.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error fetching instructor data:', error);
                    document.getElementById('instructorList').innerHTML = '<p>There was an error loading the instructor list.</p>';
                });
        }
        window.onload = function() {
            fetchInstructors();
        };
    </script>
</body>
</html>
