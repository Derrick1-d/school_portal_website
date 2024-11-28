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
    <title>Your School Portal</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <header>
        <div class="logo">Your School Logo</div>
        <nav>
            <div class="menu-toggle" onclick="toggleMenu()">&#9776;</div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <?php if (isset($_SESSION['student_id'])) : ?>
                <li><a href="#">Student Login</a></li>
                <li><a href="#">Courses</a></li>
                <li><a href="#">News</a></li>
                <?php else : ?>
                <li><a href="login/logn.php">Login</a></li>
            <?php endif; ?>

            </ul>
        </nav>
    </header>
    <main>
    <img src="cover.jpg" alt="School Image" style="width: 100%; height: 600px;">

        <?php if (isset($_SESSION['student_id'])) : ?>
            <h2>Welcome, <?php echo $row['firstname']; ?>!</h2>
            <p>Student ID: <?php echo $row['student_id']; ?></p>
            <p>Email: <?php echo $row['email']; ?></p>
        <?php else : ?>
            <h2>Welcome to the University Portal</h2>
            <p>Please log in to view your details.</p>
        <?php endif; ?>
    </main>
    <section class="hero">
        <h1>Welcome to Your School Portal</h1>
        <p>Empowering students through education.</p>
        <img src="logo.png" alt="Campus Image">
    </section>

    <section class="quick-links">
        <a href="#">Student Login</a>
        <a href="#">Courses</a>
        <a href="#">News</a>
        <a href="#">Events</a>
    </section>

    <footer>
        <p>Contact us: contact@yourschool.edu</p>
    </footer>

    <script>
        function toggleMenu() {
    const navLinks = document.querySelector('.nav-links');
    navLinks.classList.toggle('active');
}

    </script>
</body>

</html>
