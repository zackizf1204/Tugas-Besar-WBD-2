function validateLogin() {
  var username = document.getElementById('username').value;
  var password = document.getElementById('password').value;
  if (username.length === 0 || password.length === 0) {
    alert("Username and password cannot be empty");
    return false;
  } else {
    return true;
  }
}