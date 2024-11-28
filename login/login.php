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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $student_id = mysqli_real_escape_string($conn, $_POST['student_id']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $query = "SELECT * FROM student WHERE student_id = '$student_id' AND password = '$password'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 1) {
        $_SESSION['student_id'] = $student_id;
        header("Location: index.php");
        exit();
    } else {
        $error_message = "Invalid student ID or password";
    }
}
?>