<?php
session_start();

$hostname = 'localhost';
$username = 'root';
$password = '';
$database = 'school_portal';

$conn = mysqli_connect($hostname, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if the user is logged in
if (!isset($_SESSION['student_id'])) {
    // Redirect to the login page if not logged in
    header("Location: login.php");
    exit();
}

// Fetch all student details from the database
$student_id = $_SESSION['student_id'];
$query = "SELECT * FROM student WHERE student_id = '$student_id'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);

// Include your header, navigation, or any other common HTML elements here

// Display student details in a Bootstrap table
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your School Portal - Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
</head>

<body>


<header>

        <div class="logo">Khem</div>
        <nav>
            <div class="menu-toggle" onclick="toggleMenu()">&#9776;</div>
            <ul class="nav-links">
                <li><a href="index.php">Home</a></li>
                <?php if (isset($_SESSION['student_id'])) : ?>
                    <li><a href="student_detail.php">Personal details</a></li>
                    <li><a href="courses.php">Courses</a></li>
                    <li><a href="result.php">Results</a></li>
                <?php else : ?>
                    <li><a href="logn.php">Login</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>

    <nav>
        <!-- Your navigation content here -->
    </nav>

    <main>
        <div class="container mt-5">
            <h2>Welcome, <?php echo $row['firstname']; ?>!</h2>
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">Student ID</th>
                        <td><?php echo $row['student_id']; ?></td>
                    </tr>
                    <tr>
                        <th scope="row">First Name</th>
                        <td><?php echo $row['firstname']; ?></td>
                    </tr>
                    <tr>
                        <th scope="row">Last Name</th>
                        <td><?php echo $row['lastname']; ?></td>
                    </tr>
                    <tr>
                        <th scope="row">Email</th>
                        <td><?php echo $row['email']; ?></td>
                    </tr>

                    <tr>
                        <th scope="row">Date Of Birth</th>
                        <td><?php echo $row['date_of_birth']; ?></td>
                    </tr>

                    <tr>
                        <th scope="row">Country of Birth</th>
                        <td><?php echo $row['country_of_birth']; ?></td>
                    </tr>

                    <tr>
                        <th scope="row">Scholarship ID</th>
                        <td><?php echo $row['scholarship_id']; ?></td>
                    </tr>
                    <!-- Add more rows as needed for other details -->
                </tbody>
            </table>
        </div>
    </main>

    <footer>
    <p>Contact us: contact@hemchool.edu</p>
    <!-- Your footer content here -->
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script>
        function toggleMenu() {
            const navLinks = document.querySelector('.nav-links');
            navLinks.classList.toggle('active');
        }
    </script>
</html>
