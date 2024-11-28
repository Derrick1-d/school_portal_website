
  document.getElementById('loginForm').addEventListener('submit', function(event) {
      // Prevent the default form submission
      event.preventDefault();

      // Reset previous error messages
      document.getElementById('indexError').innerText = '';
      document.getElementById('passwordError').innerText = '';

      // Get the values of email and password
      const email = document.getElementById('index').value;
      const password = document.getElementById('password').value;

      // Validate the email format
      

      // Validate the password (you can add more complex checks)
      if (password.length < 6) {
          document.getElementById('passwordError').innerText = 'Password should be at least 6 characters long.';
          return;
      }

      // If the email and password are valid, you can proceed with further actions
      // For now, we'll just show an alert
      alert('Login successful!');
  });

  // Function to validate email format
  
/*
  function login() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Use AJAX to send data to PHP for authentication
    $.ajax({
        type: 'POST',
        url: 'login.php', // Replace with your PHP script URL
        data: { username: username, password: password },
        success: function(response) {
            if (response === 'success') {
                alert('Login successful!');
                // Redirect or perform other actions after successful login
            } else {
                alert('Invalid credentials. Please try again.');
            }
        },
        error: function() {
            alert('Error during login. Please try again.');
        }
    });

    return false; // Prevents the form from submitting traditionally
}
*/