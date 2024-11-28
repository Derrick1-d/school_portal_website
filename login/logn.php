
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <link  rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>

<div class="login-container">
    <div class="container">
        <img class="company-logo" src="logo.png" alt="Company Logo">
        <p class="company-description">Education is the Key🗝️ to Life</p>
        <button class="orange-button">You need to login here</button>    
       
            <button class="white">Login Here</button>
          
    </div>
  <div class="form">
 <form action="login.php" method="post" class="login-form" id="loginForm">
    <input type="text" class="login-input" id="student_id" name="student_id"  placeholder="index">
    <div id="indexError" class="error-message"></div><br>

    <input type="password" class="login-input" id="password" name="password" placeholder="Password">
    <div id="passwordError" class="error-message"></div>

    <button type="submit" class="login-button">Login</button><a href="#"> lost your password?</a>
  </form>
  </div>
  <p><i class="fas fa-sign-in-alt"></Br></i>Welcome to Khem School Portal System </p>
  <p class="copyright">&copy; 2023 All Rights Reserved</p>
</div>

</body>
<script src=""></script>
</html>
