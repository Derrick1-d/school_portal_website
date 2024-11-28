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
if (isset($_SESSION['student_id'])) {
    // Fetch student details from the database
    $student_id = $_SESSION['student_id'];
    $query = "SELECT * FROM student WHERE student_id = '$student_id'";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);

    // Fetch student results from the database
    $resultsQuery = "SELECT * FROM result WHERE student_id = '$student_id'";
    $resultsResult = mysqli_query($conn, $resultsQuery);
}

// Logout functionality
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">

    <title>Student Portal</title>
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
    <!-- Your existing header content -->

<main class="container mt-4">
    <?php if (isset($_SESSION['student_id'])) : ?>
        <h2>Welcome, <?php echo $row['firstname']; ?>!</h2>
        <p>Student ID: <?php echo $row['student_id']; ?></p>
        

        <?php if ($resultsResult && mysqli_num_rows($resultsResult) > 0) : ?>
            <h3 class="mt-4">Your Results:</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($resultRow = mysqli_fetch_assoc($resultsResult)) : ?>
                        <tr>
                            <td><?php echo $resultRow['subject_id']; ?></td>
                            <td><?php echo $resultRow['Subject Name']; ?></td>

                            <td><?php echo $resultRow['score']; ?></td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else : ?>
            <p>No results available.</p>
        <?php endif; ?>

    <?php else : ?>
        <h2>Welcome to the University Portal</h2>
        <p>Please log in to view your details and results.</p>
    <?php endif; ?>
</main>
</body>
</html>
