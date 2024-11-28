<?php
$hostname = 'localhost';
$username = 'root';
$password = '';
$database = 'school_portal';

$conn = mysqli_connect($hostname, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Fetch student enrolments from the database
$query = "SELECT student.firstname AS firstname, courses.course_name
          FROM registrations
          JOIN student ON registrations.student_id = student.student_id
          JOIN courses ON registrations.course_id = courses.course_id";

$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Enrolment</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2>Student Enrolment</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Student Name</th>
                <th scope="col">Course Name</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>{$row['firstname']}</td>";
                echo "<td>{$row['course_name']}</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies (jQuery and Popper.js) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

<?php
mysqli_close($conn);
?>
