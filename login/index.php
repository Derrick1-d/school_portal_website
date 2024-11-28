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
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your School Portal</title>
    <link rel="stylesheet" href="index.css">
</head>
<style>
    /* CSS styles for the hero section */
.hero {
    position: relative;
    overflow: hidden;
    max-height: 500px; /* Set a maximum height as needed */
}

.hero img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* This property preserves the aspect ratio while covering the entire container */
}

</style>
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
                    <li><a href="?logout=true">Logout</a></li> <!-- Add the Logout link here -->
                <?php else : ?>
                    <li><a href="logn.php">Login</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>

    <main>
        <?php if (isset($_SESSION['student_id'])) : ?>
            <h2>Welcome, <?php echo $row['firstname']; ?>!</h2>
            <p>Student ID: <?php echo $row['student_id']; ?></p>
            <p>Email: <?php echo $row['email']; ?></p>
        <?php else : ?>
            <div class="display">
            <h2>Welcome to the University Portal</h2>
            <p>Please log in to view your details.</p>
            </div>
        <?php endif; ?>
    </main>

    <section class="hero">
        <img src="cover.jpg" alt="Campus Image">
    </section>

    <section class="quick-links">
        
    </section>

    <footer>
        <p>Contact us: contact@khem.edu</p>
    </footer>

    <script>
        function toggleMenu() {
            const navLinks = document.querySelector('.nav-links');
            navLinks.classList.toggle('active');
        }
    </script>
</body>

</html>
